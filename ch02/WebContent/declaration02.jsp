<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부</title>
</head>
<body>
 <!-- 선언부 :전역변수로 선언  -->
 <%! int data=50; %>
  <%
  			out.println("Value of the variable is:" + data);
  %>
</body>
</html>