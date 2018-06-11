package com.gint.app.bisis.web.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gint.app.bisis.web.beans.ErrorInfo;
import com.gint.app.bisis.web.beans.WebUser;

/**
 * Servlet Class
 *
 * @web.servlet              
 *   name="PrevPage"
 *   display-name="PrevPage"
 *   description="Backward paging servlet"
 * @web.servlet-mapping      
 *   url-pattern="/PrevPage"
 */
public class PrevPageServlet extends HttpServlet {

  public static final String NEXT_PAGE = "/display.jsp";
  public static final String ERROR_PAGE = "/error.jsp";

  public PrevPageServlet() {
  }


  protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

    try {
      WebUser webUser = (WebUser)request.getSession().getAttribute("user");
      int newIndex = webUser.getStartIndex() - webUser.getPageSize();
      if (newIndex < 0)
        newIndex = 0;
      webUser.setStartIndex(newIndex);
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