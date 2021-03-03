<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Internationalization</title>
</head>
<body>
<!--  현재 브라우저의 언어 정보 출력 Accept-Language -->
<%=response.getLocale() %>

<!--  content-Language 출력, Accept-Language는 불변 -->
<fmt:setLocale value="ko"/>
<p><%=response.getLocale() %>

<fmt:setLocale value="ja"/>
<p><%=response.getLocale() %>

<fmt:setLocale value="en"/>
<p><%=response.getLocale() %>
</body>
</html>