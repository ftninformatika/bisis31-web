package com.gint.app.bisis.web.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gint.app.bisis.common.records.RecordID;
import com.gint.app.bisis.web.Messages;
import com.gint.app.bisis.web.Settings;
import com.gint.app.bisis.web.beans.ErrorInfo;
import com.gint.app.bisis.web.beans.WebUser;
import com.gint.util.string.StringUtils;
import com.gint.util.string.UnimarcConverter;

/**
 * Servlet Class
 *
 * @web.servlet 
 *   name = "SingleQuery"
 *   display-name = "SingleQuery"
 *   description = "Constructs a Dialog query from a single-prefix form and executes it"
 * @web.servlet-mapping 
 *   url-pattern = "/SingleQuery"
 * @web.ejb-local-ref 
 *   name = "ejb/bisis/RecordRetrieverLocal"
 *   type = "Session"
 *   home = "com.gint.app.bisis4.ejb.interfaces.RecordRetrieverLocalHome"
 *   local= "com.gint.app.bisis4.ejb.interfaces.RecordRetrieverLocal"
 *   link = "RecordRetriever"
 * @jboss.ejb-local-ref 
 *   ref-name = "ejb/bisis/RecordRetrieverLocal"
 *   jndi-name = "ejb/bisis/RecordRetrieverLocal"
 *                    
 */
public class SingleQueryServlet extends HttpServlet {

  public static final String NEXT_PAGE = "/hitcount.jsp";
  public static final String ERROR_PAGE = "/error.jsp";
  
  public SingleQueryServlet() {
    super();
  }

  public void init(ServletConfig config) throws ServletException {
    super.init(config);
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(response.getCharacterEncoding());
    ErrorInfo errorInfo = (ErrorInfo)request.getSession().getAttribute(
        "errorInfo");
    if (errorInfo == null) {
      getServletConfig().getServletContext().getRequestDispatcher(
          ERROR_PAGE).forward(request, response);
      return;
    }
    errorInfo.setErrorOccured(false);
    errorInfo.setErrorMessage("");
    
    String prefix = request.getParameter("prefix1");
    String content = request.getParameter("content1");
    if (content == null || prefix == null) {
      errorInfo.setErrorOccured(true);
      errorInfo.setErrorMessage("Invalid page parameters.");
      getServletConfig().getServletContext().getRequestDispatcher(
          ERROR_PAGE).forward(request, response);
      return;
    }

    UnimarcConverter conv = new UnimarcConverter();
    content = content.trim().toUpperCase();
    content = StringUtils.clearDelimiters(content, ", ;:\"()[]{}-+/.?!");
    String origContent = content;
    content = conv.Unicode2Unimarc(content, false);
    content = content.replace('*', '%').replace('?','_');
    content = StringUtils.adjustQuotes(content);
    if ("".equals(content)) {
      errorInfo.setErrorOccured(true);
      WebUser webUser = (WebUser)request.getSession().getAttribute("user");
      if (webUser != null)
        errorInfo.setErrorMessage(Messages.get("EMPTY_QUERY", webUser.getLocale()));
      else
        errorInfo.setErrorMessage(Messages.get("EMPTY_QUERY", "sr"));
      getServletConfig().getServletContext().getRequestDispatcher(
          ERROR_PAGE).forward(request, response);
      return;
    }

    StringTokenizer st = new StringTokenizer(content);
    String query = "SELECT /*+USE_HASH(pref_"+prefix+") */ distinct doc_id FROM pref_"+prefix+" WHERE content LIKE '"+st.nextToken()+"'";
    int parenthesisCount = 0;
    while (st.hasMoreTokens()) {
      query += " AND pref_id IN (SELECT pref_id FROM pref_"+prefix+" WHERE content LIKE '"+st.nextToken()+"'";
      parenthesisCount++;
    }
    while (parenthesisCount-- >0)
      query += ")";
    if (Settings.getSettings().getStaticFilter() != null) {
      query += " " + Settings.getSettings().getStaticFilter();
      query += " ORDER BY 1 ASC ";
    } else
      query += " ORDER BY doc_id ASC ";

    try {
      int hitCount = 0;
      ArrayList list = new ArrayList();
      Statement stmt = Settings.getSettings().getConn().createStatement();
      ResultSet rset = stmt.executeQuery(query);
      while (rset.next()) {
        list.add(new RecordID(0, rset.getInt(1)));
      }
      rset.close();
      stmt.close();
      RecordID[] ids = new RecordID[list.size()];
      for (int i = 0; i < list.size(); i++)
        ids[i] = (RecordID)list.get(i);
      WebUser webUser = (WebUser)request.getSession().getAttribute("user");
      webUser.setRecordIDs(ids);
      webUser.setCurrentQuery(prefix + "=" + origContent);
      webUser.setStartIndex(0);
      getServletConfig().getServletContext().getRequestDispatcher(
          NEXT_PAGE).forward(request, response);
    } catch (Exception ex) {
      ex.printStackTrace();
      errorInfo.setException(ex);
      getServletConfig().getServletContext().getRequestDispatcher(
          ERROR_PAGE).forward(request, response);
    }
  }
}