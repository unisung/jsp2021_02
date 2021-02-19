<%@page import="ch04.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Action Tag - useBean </title>
</head>
<body>
<%-- Bean생성 --%>
<jsp:useBean id="m" class="ch04.model.MemberBean" 
                    scope="request"/>
<%-- Bean속성값 설정 --%>
<jsp:setProperty property="id" name="m" value="2"/>
<jsp:setProperty property="name" name="m" value="김길동"/>
<%-- Bean 속성 값 출력 --%>
<jsp:getProperty property="id" name="m"/> |
<jsp:getProperty property="name" name="m"/>

<jsp:forward page="forwarded.jsp"/>
</body>
</html>