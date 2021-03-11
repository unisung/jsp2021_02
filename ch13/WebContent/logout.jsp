<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
       //로그아웃 처리
		session.invalidate();
%>
<h3>로그아웃 되었습니다.</h3>
</body>
</html>