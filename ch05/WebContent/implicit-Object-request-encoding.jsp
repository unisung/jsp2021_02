<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>  request 내장객체 - encoding</title>
</head>
<body>
   <%-- 링크태그를 통한 데이타 전송은 get방식  --%>
    <a href="getName.jsp?name='<%=URLEncoder.encode("홍길동")%>'">전송</a>
</body>
</html>