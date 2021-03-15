<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<%-- escapeXml true이면 특수문자로 변환 --%>
  <c:out value="<hr>" escapeXml="true" />
  <c:out value="I & U" escapeXml="false" />
</body>
</html>