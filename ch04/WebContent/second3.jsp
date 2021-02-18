<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>action Tag</title>
</head>
<body>
  <% 
           //내장객체 request에 의해 전달된 객체는 Object타입으로 리턴되므로 원래 타입으로 형변환 처리
  			String message = (String)(request.getAttribute("message"));
  %>
  <h3><%=message%></h3>
 <h3> 이 파일은 second.jsp 입니다. </h3>
 Today is : <%=(new java.util.Date()).toLocaleString() %>
</body>
</html>