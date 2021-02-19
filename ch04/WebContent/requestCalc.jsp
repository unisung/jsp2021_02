<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h3>계산 결과 </h3>
     <jsp:include page="calc.jsp">
	       <jsp:param value='<%=request.getParameter("op1") %>' name="op1"/>
	       <jsp:param value='<%=request.getParameter("op2") %>' name="op2"/>
	       <jsp:param value='<%=request.getParameter("cal") %>' name="cal"/>
     </jsp:include>

</body>
</html>