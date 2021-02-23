<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 </title>
</head>
<body>
   <%
   			String driver = application.getInitParameter("driver");
   %>
   드라이버:<%=driver %><br>
<%
			Enumeration params = application.getInitParameterNames();
            while(params.hasMoreElements()){
            	     String name=(String)params.nextElement();
            	     out.print(name+"="+application.getInitParameter(name)+"<br>");
            }
%>
</body>
</html>