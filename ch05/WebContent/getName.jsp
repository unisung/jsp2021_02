<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>get방식으로 데이타 받기</title>
</head>
<body>
  <%
           //보낸페이지의 문자셋과 무관하게 현재페이지의 문자셋으로 처리 하는 메소드
            request.setCharacterEncoding("utf-8");
  			String name=URLDecoder.decode(request.getParameter("name"));
  %>
  <%=name %>
</body>
</html>