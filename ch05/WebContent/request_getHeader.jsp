<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 헤더정보 얻기</title>
</head>
<body>
    <%
    		 String hostValue=request.getHeader("host");
             String alValue=request.getHeader("accept-language");
             
             out.print("호스트명 :"+hostValue+"<br>");
             out.print("설정된 언어: "+alValue+"<br>");
    
    %>
</body>
</html>