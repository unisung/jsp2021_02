<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href='http://localhost:8181/WebMarket/resources/css/bootstrap.min.css'/>
<title>상품 아이디 오류</title>
</head>
<body>
                 <jsp:include page="../menu.jsp"/>
                 <div class="jumbotron">
                 			<div class="container">
                 			  <h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
                 			</div>
                 </div>
                 <div class="container">
                 		<p><%=request.getRequestURL() %>?<%=request.getQueryString()%>
                 		<p><a href="../products.jsp" class="btn btn-secondary">상품 목록</a>
                 </div>
</body>
</html>