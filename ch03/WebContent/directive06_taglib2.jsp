<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 커스텀태그를 사용하기위한 선언  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- EL(Expression Language) , 신텍스 기준 xml --%>
  <c:forEach var="k" begin="0" end="10" step="1"  varStatus="i">
     <c:out value="${k}"/><br>
  </c:forEach>
</body>
</html>