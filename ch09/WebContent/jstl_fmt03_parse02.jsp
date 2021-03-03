<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>jstl fmt:parseDate</title>
</head>
<body>
<h3> Date parsing</h3>
<c:set var="now" value="20-10-2010"/><%-- 변수 선언 --%>
<fmt:parseDate value="${now }" var="parsedDate" pattern="dd-MM-yyyy"/>
<%-- value값이 pattern에 맞으면 Date타입으로 변환 --%>

<p>Parsed Date:<c:out value="${parsedDate }"/></p>

<p><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss">2010-05-05 16:51:44</fmt:parseDate>

<hr>
<p><c:set var="nowtemp" value="2010-09-14 16:51:44.0"/>
<fmt:parseDate var="dateTempParse" value="${nowtemp}" pattern="yyyy-MM-dd HH:mm:ss.S"></fmt:parseDate>
<c:out value="${dateTempParse }"/>
</body>
</html>