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
 *   name = "MultiQuery"
 *   display-name = "MultiQuery"
 *   description = "Constructs a Dialog query from a single-prefix form and executes it"
 * @web.servlet-mapping 
 *   url-pattern = "/MultiQuery"
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
public class MultiQueryServlet extends HttpServlet {

  public static final int FIELD_COUNT = 5;
  
  public static final String NEXT_PAGE = "/hitcount.jsp";
  public static final String ERROR_PAGE = "/error.jsp";
  
  public MultiQueryServlet() {
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
    
    String[] prefixes = new String[FIELD_COUNT];
    String[] contents = new String[FIELD_COUNT];
    String[] operators = new String[FIELD_COUNT-1];
    for (int i = 0; i < FIELD_COUNT; i++) {
      prefixes[i] = request.getParameter("prefix" + (i+1));
      contents[i] = request.getParameter("content" + (i+1));
      if (prefixes[i] == null || contents[i] == null) {
        errorInfo.setErrorMessage("Invalid query parameters.");
        errorInfo.setErrorOccured(true);
        getServletConfig().getServletContext().getRequestDispatcher(
            ERROR_PAGE).forward(request, response);
        return;
      }
      if (i < FIELD_COUNT-1) {
        operators[i] = request.getParameter("operator" + (i+1));
        if (operators[i] == null) {
          errorInfo.setErrorMessage("Invalid query parameters.");
          errorInfo.setErrorOccured(true);
          getServletConfig().getServletContext().getRequestDispatcher(
              ERROR_PAGE).forward(request, response);
          return;
        }
      }
    }

    String displayQuery = "";
    UnimarcConverter conv = new UnimarcConverter();
    for (int i = 0; i < FIELD_COUNT; i++) {
      contents[i] = contents[i].toUpperCase();
      contents[i] = StringUtils.clearDelimiters(contents[i], ", ;:\"()[]{}-+/.?!");
      if (!"".equals(contents[i]))
        displayQuery += " " + prefixes[i] + "=" + contents[i];
      contents[i] = conv.Unicode2Unimarc(contents[i], false);
      contents[i] = contents[i].replace('*', '%').replace('?','_');
      contents[i] = StringUtils.adjustQuotes(contents[i]);
    }
    String test = "";
    for (int i = 0; i < FIELD_COUNT; i++) {
      test += contents[i];
    }
    test = test.trim();
    if ("".equals(test)) {
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
    
    String[] query = new String[FIELD_COUNT];
    String completeQuery;
    StringTokenizer st;

    for (int i = 0; i < FIELD_COUNT; i++) {
      if (!contents[i].equals("")) {
        st = new StringTokenizer(contents[i]);
        query[i] = "SELECT /*+USE_HASH(pref_"+prefixes[i]+") */ distinct doc_id FROM pref_"+prefixes[i]+" WHERE content LIKE '"+st.nextToken().replace('*','%').replace('?','_')+"'";
        int parenthesisCount = 0;
        while (st.hasMoreTokens()) {
          query[i] += " AND pref_id IN (SELECT pref_id FROM pref_"+prefixes[i]+" WHERE content LIKE '"+st.nextToken()+"'";
          parenthesisCount++;
        }
        while (parenthesisCount-- >0)
          query[i] += ")";
      }
    }
    int i = 0;
    int lastNonEmpty;
    while (contents[i].equals(""))
      i++;
    lastNonEmpty = i;
    completeQuery = query[i];
    for (int j = i+1; j < FIELD_COUNT; j++) {
      if (!contents[j].equals("")) {
        if (operators[lastNonEmpty].equals("AND"))
          completeQuery += " INTERSECT " + query[j];
        else if (operators[lastNonEmpty].equals("OR"))
          completeQuery += " UNION " + query[j];
        else
          completeQuery += " MINUS " + query[j];
        lastNonEmpty = j;
      }
    }
    if (Settings.getSettings().getStaticFilter() != null)
      completeQuery += " " + Settings.getSettings().getStaticFilter();
    completeQuery += " ORDER BY 1 ASC ";
    // za oracle:
    // completeQuery += " ORDER BY doc_id ASC ";

    try {
      int hitCount = 0;
      ArrayList list = new ArrayList();
      Statement stmt = Settings.getSettings().getConn().createStatement();
      ResultSet rset = stmt.executeQuery(completeQuery);
      while (rset.next()) {
        list.add(new RecordID(0, rset.getInt(1)));
      }
      rset.close();
      stmt.close();
      RecordID[] ids = new RecordID[list.size()];
      for (i = 0; i < list.size(); i++)
        ids[i] = (RecordID)list.get(i);
      WebUser webUser = (WebUser)request.getSession().getAttribute("user");
      webUser.setRecordIDs(ids);
      webUser.setCurrentQuery(displayQuery);
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