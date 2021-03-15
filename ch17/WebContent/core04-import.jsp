<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<%-- <c:import url="http://search.daum.net/search" charEncoding="euc-kr" var="daumNews">
			<c:param name="w" value="cafe" />
            <c:param name="q" value="보라매 공원" />
</c:import> --%>
<c:import url="http://localhost:8282/ch17/core02_process.jsp" var="resultPage">
   <c:param  name="number" value="10"/>
</c:import>

<hr>
 <%-- <c:out value="${daumNews }"/> --%>
 <c:out value="${resultPage }"/>
 
 <hr>
 <hr>
 <c:url var="resultPage2" value="http://localhost:8282/ch17/core02_process.jsp">
          <c:param  name="number" value="10"/>
 </c:url>
 ${resultPage2}
 
 <hr><hr><hr>
 <c:redirect url="http://localhost:8282/ch17/core02_process.jsp">
     <c:param name="number" value="5"/>
 </c:redirect>
</body>
</html>