<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    클라이언트 요청 주소:<%= request.getRemoteAddr() %><br>
    요청방식:<%=request.getMethod() %><br>
    요청url:<%=request.getRequestURL() %><br>
    요청serverName:<%=request.getServerName() %><br>
    요청port:<%=request.getServerPort() %><br>
    요청경로:<%=request.getContextPath() %><br>
    쿼리파라미터:<%=request.getQueryString() %><br>
</body>
</html>