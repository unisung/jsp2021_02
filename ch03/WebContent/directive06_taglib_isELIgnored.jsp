<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page errorPage="directive07_isErrorPage01.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("RequestAttribute", "request 내장 객체");
%>
<%= request.getAttribute("RequestAttribute") %>
<br><br>
<%-- 커스텀 태그로 출력 ${속성명} --%>
${requestScope.RequestAttribute}
</body>
</html>