<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>jstl - core</title>
</head>
<body>
<jsp:useBean id="person" class="ch17.Person"/>

<%--   Bean인 경우  속성 값 설정--%>
<c:set target="${person}" property="name" value="홍길동"/>
<c:set target="${person}" property="age" value="13"/>

<p>이름: <c:out value="${person.name }"/>
<p>나이: <c:out value="${person.age }"/>

<hr>
<jsp:useBean id="mymap" class="java.util.HashMap"/>
<%-- map 객체인 경우  --%>
<c:set target ="${mymap}" property="name" value="일지매" />
<c:out value="${mymap.name }"/>



</body>
</html>