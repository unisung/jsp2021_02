<%@ page  contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>timezone 태그 사용</title>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date() %>"/>

<fmt:timeZone value="Hongkong">
  <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" />
</fmt:timeZone>
<br>
<fmt:timeZone value="ja">
  <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" />
</fmt:timeZone>

<br>
<fmt:timeZone value="en">
  <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" />
</fmt:timeZone>

</body>
</html>