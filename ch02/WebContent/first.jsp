<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 디렉티브(지시부) -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 문서의 제목</title>
</head>
<body>
<%
		/* 스크립틀릿 - 자바 명령어가 기술되는 부분 */
		String bookTile = "JSP 기초";
        String author = "홍길동";
%>
<!-- 표현식 -->
 <b><%=bookTile %></b>(<%=author %>)입니다.
</body>
</html>