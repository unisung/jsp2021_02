<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Internationalization(i18n)</title>
</head>
<body>
<%
  // DateFormat클래스의 getDateTimeInstance(날짜포맷, 시간포맷, 지역정보);
		Locale locale = request.getLocale();
String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.MEDIUM, locale).format(new Date());
%>
<p> 로케일의 날짜 형식
<p><%=date %></p>
</body>
</html>