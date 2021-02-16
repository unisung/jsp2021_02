<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부</title>
</head>
<body>
<!-- 선언부: 함수와 전역변수 선언영역  -->
  <%! int sum(int a, int b){
	         return a+ b;
  }
  %>
  
  <%
  			out.print("2 + 3=" + sum(2,3));
  %>
</body>
</html>