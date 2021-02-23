<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post방식으로 전달된  데이타 받기</title>
</head>
<body>
    <%
              //현재페이지의 문자셋에 맞도록 변환 
               request.setCharacterEncoding("utf-8");  
    		String name=request.getParameter("name");
    %>
    <p>아이디:<%=name %>
</body>
</html>