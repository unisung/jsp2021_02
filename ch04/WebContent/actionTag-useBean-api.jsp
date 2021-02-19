<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActionTag - useBean- APi 생성 </title>
</head>
<body>
<%-- useBean으로 생성  --%>
  <jsp:useBean id="date" class="java.util.Date" />
   <p><% out.print("오늘의 날짜 및 시각");%>
   <p><%=date %><%--  표현식으로 출력 --%>
</body>
</html>