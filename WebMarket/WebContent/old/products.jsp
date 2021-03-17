<%@page import="dto.Product"%>
<%@ page  contentType="text/html; charset=UTF-8"  %>
<%-- bean선언  --%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html><html><head>
<!-- bootstrap라이브러리 연결 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
       <jsp:include page="../menu.jsp"/>
       <div class="jumbotron">
         <div class="container">
         		<h1 class="display-3">상품 목록</h1>
         </div>
       </div>
      <div class="container">
         <div class="row" align="center">
   <%
   			for(int i=0;i<productDAO.getAllProducts().size();i++){
   				        Product product = productDAO.getAllProducts().get(i);
   				        %>
   				        <div class="col-md-4">
   				            <h3><%=product.getPname() %></h3>
   				            <p><%=product.getDescription() %></p>
   				            <p><%=product.getUnitPrice() %>원</p>
   				            <%-- 상세페이지 이동 처리 --%>
   				            <p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">상세정보 &raquo;</a>
   				        </div>
   <% 	
   }
   %>
    </div>
        <hr><!-- 수평선 -->
   </div>
   <jsp:include page="../footer.jsp"/>
</body>
</html>