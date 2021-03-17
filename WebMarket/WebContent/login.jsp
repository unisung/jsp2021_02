<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<%-- 파라미터 받기(ko/en)--%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">
<title><fmt:message key="loginTitle"/></title>
</head>
<body>
   <jsp:include page="menu.jsp"/>
   <div class="jumbotron">
   		<div class="container">
   				<h1 class="display-3"><fmt:message key="adminLoginTitle"/></h1>
   		</div>
   </div>
   
    <%-- 현재페이지의 메세지를 한글/영문으로 변환하는 파라미터  --%>
 <div class="text-right">
       <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
 </div>
 
  <div class="container" align="center">
    <div class="col-md-4 col-md-offset-4" >
      <h3 class="form-signin-heading"><fmt:message key="loginTitle2"/></h3>
  <%
  			String error=request.getParameter("error");
    		if(error !=null){
    			out.print("<div class='alert alert-danger'>");
    			out.print("아이디와 비밀번호를 확인해주세요");
    			out.print("</div>");
    		}
  %>
 <form class="form-signin" action="j_security_check" method="post">
  <div class="form-group">
    <label for="inputUserName" class="sr-only">User Name</label>
      <input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus>
  </div>
  <div class="form-group">
    <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" class="form-control" placeholder="Password" name="j_password" required>
  </div>
  
  <button class="btn btn btn-lg btn-success btn-block" type="submit"><fmt:message key="loginButton"/></button>
 </form>
   </div>
   </div>
   </fmt:bundle>
</body>
</html>