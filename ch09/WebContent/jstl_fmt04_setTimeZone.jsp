<%@ page  contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>jstl setTimeZone 태그 사용</title>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date() %>"/>

<p>Date in Current Zone:<fmt:formatDate value="${now}" type="both" timeStyle="long" dateStyle="long"/>

<p>Change Time Zone to GMT-8

<%-- TimeZone 설정 이후 부터 적용  --%>
<fmt:setTimeZone value="GMT-8" />
<p>Date in Changed Zone: <fmt:formatDate value="${now}" type="both" timeStyle="long" dateStyle="long"/>

</body>
</html>