<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActionTag 사용자정의 객체 </title>
</head>
<body>
  <jsp:useBean id="bean" class="ch04.model.Calculator"/>
  <%   
    //액션태드 useBean으로 생성된 객체를 스크립틀릿에서 사용가능.
  			int m = bean.process(5);
            out.print("5의 세제곱 : " +m);
  %>
</body>
</html>