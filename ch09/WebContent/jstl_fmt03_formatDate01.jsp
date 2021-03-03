<%@page import="java.text.DateFormat"%><%@page import="java.util.Locale"%><%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>numberFormat 태그 사용</title>
</head>
<body>
<%
		 Date now = new Date();
     Locale locale = request.getLocale();
    String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.MEDIUM, locale).format(now);
    pageContext.setAttribute("now", now);//request, session, application
%>
<p>데이트 형식:<%=date %> 

<hr>
<%-- 자바코드로 생성된 객체는 scope가 지정된 객체에 속성으로 등록 된 후 사용가능  --%>
<fmt:formatDate value="${now}" type="date"/>

<hr>
<%-- useBean으로 생성된 객체는 scope의 default값이 page이므로 바로 사용 가능 --%>
<jsp:useBean id="now1" class="java.util.Date"/>
<p> 데이트 형식:<fmt:formatDate value="${now1 }" type="date"/><br>
<p> time형식:<fmt:formatDate value="${now1 }" type="time"/><br>
<p> 데이트 타임 형식:<fmt:formatDate value="${now1 }" type="both"/><br>

<hr><hr>
style=full:
<p> 데이트 형식:<fmt:formatDate value="${now1 }" type="date" dateStyle="full"/><br>
<p> time형식:<fmt:formatDate value="${now1 }" type="time"  timeStyle="full" /><br>

<hr><hr>
style=long:
<p> 데이트 형식:<fmt:formatDate value="${now1 }" type="date" dateStyle="long"/><br>
<p> time형식:<fmt:formatDate value="${now1 }" type="time"  timeStyle="long" /><br>

<hr><hr>
style=medium:
<p> 데이트 형식:<fmt:formatDate value="${now1 }" type="date" dateStyle="medium"/><br>
<p> time형식:<fmt:formatDate value="${now1 }" type="time"  timeStyle="medium" /><br>

<hr><hr>
style=short:
<p> 데이트 형식:<fmt:formatDate value="${now1 }" type="date" dateStyle="short"/><br>
<p> time형식:<fmt:formatDate value="${now1 }" type="time"  timeStyle="short" /><br>
</body>
</html>