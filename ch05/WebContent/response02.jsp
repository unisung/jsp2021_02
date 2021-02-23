<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 -response</title>
</head>
<body>
 <p>이 페이지는 1초마다 새로고침 됩니다.
   <%
   				response.setIntHeader("Refresh", 1);
   %>
   <p><%=new java.util.Date() %>

</body>
</html>