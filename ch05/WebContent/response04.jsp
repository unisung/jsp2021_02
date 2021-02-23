<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 response sendError(코드,메세지)</title>
</head>
<body>
  <%
  				response.sendError(404, "요청한 페이지를 찾을수 없습니다.");
  
  %>
</body>
</html>