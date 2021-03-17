<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  bootstrap 라이브러리 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
      <nav class="navbar  navbar-expand navbar-dark bg-dark">
         <div>
         		<div>
         			<a  class="navbar-brand" href="./welcome.jsp">Home</a>
         		</div>
         </div>
      </nav>

         <%! /* 선언부 */
         		 String greeting = "Welcome to Web Shopping Mall" ;
         		 String tagline = "Welcome to Web Market!";
         %>
         
         
         <%-- 표현식  --%>
 <div class="jumbotron">
   <div class="conatiner">
	 <h1><%=greeting %></h1>
 </div>
 </div>
 
 <div class="container">
   <div class="text-center">
	 <h3><%=tagline %></h3>
 </div>
 </div>
 
 <footer class="container">
 	 <p>&copy; WebMarket</p>
 </footer>
 
</body>
</html>