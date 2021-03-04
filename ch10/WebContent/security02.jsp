<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Security-programming</title>
</head>
<body>
  <p>사용자명:<%=request.getRemoteUser() %>
  <p>인증방법:<%=request.getAuthType() %>
  <p>인증한 사용자명이 역할명 "tomcat"에 속하는 사용자인가?<%=request.isUserInRole("tomcat") %>
  <p>인증한 사용자명이 역할명 "role1"에 속하는 사용자인가?<%=request.isUserInRole("role1") %>
  <p>요청 프로토콜 <%=request.getProtocol() %></p>
  <p>https로 접근여부<%=request.isSecure() %>
  <p>Priciple객체<%=request.getUserPrincipal() %>
  <hr>
  <%
  			if(request.isUserInRole("admin")){ %>
  			<a href="admin/addProduct.jsp">상품등록</a>
  		    <a href="admin/member.jsp">회원 관리</a>
  	<%
  			}else{
  	%>			
			<a href="member/products.jsp">상품 목록</a>
   <%}%>
  
</body>
</html>