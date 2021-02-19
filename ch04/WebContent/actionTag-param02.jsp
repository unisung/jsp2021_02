<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - param</title>
</head>
<body>
   <h3> 이 파일은 first 파일입니다.</h3>
   <jsp:include page="second4.jsp">
       <jsp:param value="<%=new java.util.Date() %>" name="date"/>
   </jsp:include>

</body>
</html>