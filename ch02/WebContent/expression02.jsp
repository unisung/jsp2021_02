<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 날짜 출력</title>
</head>
<body>
           <!--  표현식내에서 함수()호출 결과 출력  -->
       	 <p> Today's date:<%=new java.util.Date() %><p><!-- 표현식 -->
       	 <p> Today's date:<% out.print(new java.util.Date() ); %></p><!-- 스크립틀릿 -->
       
</body>
</html>