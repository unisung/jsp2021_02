<%@page import="ch18.com.model.LoginBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
   <p> 로그인 성공했습니다.
   <%
   			LoginBean bean =(LoginBean)request.getAttribute("bean");
            out.print("아이디: " +bean.getId());
   %>
</body>
</html>