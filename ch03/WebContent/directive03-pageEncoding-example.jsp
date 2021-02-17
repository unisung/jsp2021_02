<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
    <%-- 현재 작업 페이지의 문자셋 설정 pageEncoding  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive Tag pageEncoding</title>
</head>
<body>
  <%@ page info="Date 클래스를 이용한 날짜 출력하기 " %>
  Today is <%=new java.util.Date() %>
  <%=getServletInfo() %><%-- info 속성에 지정한 메세지가 출력됨.  --%>
</body>
</html>