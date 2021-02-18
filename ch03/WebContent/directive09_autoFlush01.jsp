<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 페이지 버퍼 사이즈 선언 --%>
<%@ page buffer="1kb" %>
<%-- 버퍼 자동 비우기 false로 처리 buffer overflow발생 --%>
<%@ page autoFlush="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
			for(int i=0;i<1000;i++){%>
		  		1234
<% 	}
%>
</body>
</html>