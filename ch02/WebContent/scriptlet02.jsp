<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scripting tag</title>
</head>
<body>
<%
		int a=2;
        int b=3;
        int sum= a+b;

         //System.out.println(값);
         //OutputStream out = new OutputStream();
        out.println("2 + 3=" + sum);//out <- 내장 객체(변수)- 이미 선언되어있는 객체변수
%>
<br>
 2 + 3 = <%=sum %>

</body>
</html>