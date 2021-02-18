<%@page import="ch03.com.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 커스텀 태그 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%-- #{}문자가 문자열로 출력되도록 처리하는 선언문  --%>
<%@ page deferredSyntaxAllowedAsLiteral="true" %>
<%-- <%@ page isELIgnored="true" %>    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   			Member m=new Member();
            m.setName("홍길동");
   %>
 <%-- ${속성명}<=선언시에 값 할당 ,#{속성명}<=호출시에 값 할당 --%>
 <%-- 커스텀 태그 변수 선언  --%>
<c:set var="m" value="<%=m%>"/>
<c:set var="name" value="#{m.name }"/>
<% m.setName("일지매"); %>
${name}
</body>
</html>