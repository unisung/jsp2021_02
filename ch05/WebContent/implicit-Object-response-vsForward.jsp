<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response - sendRedirect(이동할 페이지)</title>
</head>
<body>
   <%
             //forward시키는 객체  RequestDispatcher생성 -request로부터 이동할 경로 정보 얻기
   			 RequestDispatcher rd= request.getRequestDispatcher("implicit-Object-request01.jsp");
            //forward로 이동
             rd.forward(request, response);
   %>
</body>
</html>