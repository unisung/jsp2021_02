<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action tag </title>
</head>
<body>
          <%=request.getParameter("name") %><br>
          <h3> 이페이지는 메인 페이지 </h3>
    <%-- param의 사용 범위는 include태그에 표시된 페이지에서만 사용 --%>      
          <jsp:include page="sub.jsp">
          		<jsp:param value="honggildong" 
          		                   name="name"/>
          </jsp:include>
</body>
</html>