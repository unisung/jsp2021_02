<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application기본객체-초기화 파라미터값 읽기</title>
</head>
<body>
 <%
 			String url=getServletContext().getInitParameter("url");
 %>
 <%=url %>
 <br>
  <%-- 톰캣 버전  --%>
 <%=getServletContext().getServerInfo() %><br>
 <%-- 서블릿 버전 --%>
 <%=getServletContext().getMajorVersion() %>.<%=getServletContext().getMinorVersion() %>
 <br><br>
 <%=application.getServerInfo() %><br>
 <%=application.getMajorVersion() %>.<%=application.getMinorVersion() %>
</body>
</html>