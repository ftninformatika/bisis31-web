package com.gint.app.bisis.web.tag;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.gint.app.bisis.common.records.Record;
import com.gint.app.bisis.common.records.RecordFactory;
import com.gint.app.bisis.common.records.RecordID;
import com.gint.app.bisis.common.records.formatters.RecordFormatter;
import com.gint.app.bisis.common.records.formatters.RecordFormatterFactory;
import com.gint.app.bisis.report.Report;
import com.gint.app.bisis.web.Settings;
import com.gint.app.bisis.web.beans.WebUser;

import freemarker.template.SimpleList;

/**
 * JSP Tag Handler class
 *
 * @jsp.tag 
 *   name = "display"
 *   description = "Generates the retrived records paged table"
 *   body-content = "empty"
 */
public class DisplayTag extends TagSupport {

  public DisplayTag() {
    super();
  }
  
  public int doStartTag() throws JspException {
    if (user == null)
      throw new JspException("DisplayTag: missing attribute user");
    if (tableClass == null)
      throw new JspException("DisplayTag: missing attribute tableClass");
    if (cellClass == null)
      throw new JspException("DisplayTag: missing attribute cellClass");
    try {
      int startIndex = user.getStartIndex();
      int endIndex = startIndex + user.getPageSize();
      if (endIndex > user.getHitCount())
        endIndex = user.getHitCount();
      Report.ucitajParam();
      RecordFormatter rf = RecordFormatterFactory.getFormatter(
          user.getDisplayMode());
      ctx.getOut().println("<table class=\""+tableClass+"\">");
      for (int i = startIndex; i < endIndex; i++) {
        RecordID rid = user.getRecordID(i);
        Connection conn = Settings.getSettings().getConn();
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery(
            "SELECT document FROM documents WHERE doc_id="+user.getRecordID(i).getLocalID());
        rset.next();
        Record rec = RecordFactory.fromUNIMARC(0, rset.getString(1));
        rset.close();
        stmt.close();
        stmt = conn.createStatement();
        rset = stmt.executeQuery("SELECT count(*) FROM circ_docs WHERE docid=" +
            user.getRecordID(i).getLocalID() + " AND status=0");
        rset.next();
        int cirk = rset.getInt(1);
        rset.close();
        stmt.close();
        rec.getRecordID().setLocalID(cirk);
        
        stmt = conn.createStatement();
        rset = stmt.executeQuery("SELECT CTLG_NO, status FROM circ_docs WHERE docid=" +
            user.getRecordID(i).getLocalID()); 
        HashMap inventar=new HashMap();
        SimpleList invL=new SimpleList();
        while(rset.next()){
        	HashMap inv=new HashMap();     
        	inv.put("invNum",rset.getString(1));
        	inv.put("status",rset.getString(2));        	
          	invL.add(inv);
          }
        inventar.put("invList",invL);
        
        
        rset.close();
        stmt.close();
        String s = rf.toHTML(rec, user.getLocale(),cirk,inventar);
        ctx.getOut().print("<tr><td class=\""+cellClass+"\">");
        ctx.getOut().print(s);
        ctx.getOut().println("</td></tr>");
      }
      ctx.getOut().print("</table>");
    } catch (Exception ex) {
      log.fatal(ex);
    }
    return SKIP_BODY;
  }
  
  public int doEndTag() throws JspException {
    return EVAL_PAGE;
  }
  
  /**
   * @jsp.attribute
   *   required = "true"
   *   rtexprvalue = "true"
   *   type = "com.gint.app.bisis.web.beans.WebUser"
   * @return Returns the user.
   */
  public WebUser getUser() {
    return user;
  }
  /**
   * @param user The user to set.
   */
  public void setUser(WebUser user) {
    this.user = user;
  }
  /**
   * @jsp.attribute
   *   required = "true"
   *   rtexprvalue = "false"
   *   type = "java.lang.String"
   * @return Returns the cellClass.
   */
  public String getCellClass() {
    return cellClass;
  }
  /**
   * @param cellClass The cellClass to set.
   */
  public void setCellClass(String cellClass) {
    this.cellClass = cellClass;
  }
  /**
   * @jsp.attribute
   *   required = "true"
   *   rtexprvalue = "false"
   *   type = "java.lang.String"
   * @return Returns the tableClass.
   */
  public String getTableClass() {
    return tableClass;
  }
  /**
   * @param tableClass The tableClass to set.
   */
  public void setTableClass(String tableClass) {
    this.tableClass = tableClass;
  }
  public void setPageContext(PageContext ctx) {
    this.ctx = ctx;
  }

//  /** Home for creating record retrievers. */
//  private RecordRetrieverLocalHome rrh;
  /** JSP page context. */
  private PageContext ctx;
  /** The WebUser object instance used in the current HTTP session. */
  private WebUser user;
  /** Indicates whether the owner library should be displayed. */
  private boolean showLibraries;
  /** CSS table class. */
  private String tableClass;
  /** CSS cell class. */ 
  private String cellClass;
  
  private static Log log = LogFactory.getLog(
      "com.gint.app.bisis.web.tag.DisplayTag");
}