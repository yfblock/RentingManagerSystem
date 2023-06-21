<%@ tag language="java"  pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="file" type="java.lang.String" required="true" %>
<%@ attribute name="title" type="java.lang.String" %>
<%
    String contentPage = (String)request.getAttribute("contentPage");
    if (contentPage == null) {
        contentPage = request.getServletPath();
        request.setAttribute("contentPage", contentPage);
        request.setAttribute("title", title);
        request.setAttribute("originPath", request.getAttribute(RequestDispatcher.FORWARD_REQUEST_URI));
//        request.setAttribute("originPath", request.getRequestURI().replace("/WEB-INF/template/", ""));
        request.getRequestDispatcher(file).forward(request, response);
//        throw new SkipPageException();
    }
%>