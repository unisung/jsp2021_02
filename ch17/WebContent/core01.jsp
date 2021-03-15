<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
      browser 변수 값 설정
      <c:set var="browser" value="${header['User-Agent']}"/>
      <br>
      
      <c:out value="${browser}"/>
      
      <hr> 
      <p>browser 변수 값 제거 후
      <%-- 변수삭제  --%>
      <c:remove var="browser"/>
      
      <c:out value="${browser}"/>
</body>
</html>