<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>내장객체 response.sendRedirect()</title>
</head>
<body>
      세션정보:<%=session.getAttribute("id") %>
      <p>로그인을 실패했습니다.
       <p><a href="./response.jsp">로그인 가기</a>
</body>
</html>