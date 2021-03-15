<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h3>구구단</h3>
 <table>
 <%-- 1부터 9까지 1씩 증가 처리 --%>
   <c:forEach var="i"  begin="2" end="9">
   	<tr>
   	   <c:forEach var="j" begin="1" end="9">
   	      	<td width="100">${i }*${j }=${i * j }</td>
   	   </c:forEach>
   	</tr>
   </c:forEach>
 </table>
</body>
</html>