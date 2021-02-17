<%@page import="ch03.PrintToday"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.Date" %><%-- 객체 사용 직전에 import --%>
Today is <%=new Date() %><br>
<br>
<%
	  PrintToday today = new PrintToday();
%>
<%=today%>
</body>
</html>