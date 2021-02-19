<%@page import="ch04.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% MemberBean m 
        = (MemberBean)request.getAttribute("m");
      if(m!=null){
%>
<%=m.getId() %> | <%=m.getName() %>
<%}else{ %>
       넘어온  Bean객체가 없습니다. 
<%} %>
</body>
</html>