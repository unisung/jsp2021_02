<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  		String number = request.getParameter("number");
  %>
  <%-- String타입의 number값이 자동으로 int타입으로 변환  --%>
  <c:set var="number" value="<%=number %>" />
  
  <c:catch var="error">
	  <%-- 짝수,홀수 여부 확인 choose --%>
	  <c:choose>
	     <c:when test="${number%2==0 }">
	     	  <c:out value="${number }"/>은 짝수입니다.
	     </c:when>
	     <c:when test="${number%2!=0 }">
	     	  <c:out value="${number }"/>은 홀수입니다.
	     </c:when>
	     <c:otherwise>
	     	  숫자가 아닙니다.
	     </c:otherwise>
	  </c:choose>
  </c:catch>
  
  ${error }
  
</body>
</html>