<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<!--  bootstrap 라이브러리 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
<%   String contextPath =  getServletContext().getContextPath();
		pageContext.setAttribute("contextPath", contextPath);
%>
${contextPath}<br>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
	   <h1 class="display-3">상품 등록</h1>
	</div>
</div>
<%-- contents --%>
<div class="container">
   <form name="newProduct" action="./processAddProduct.jsp" 
                        method="post"
                        enctype="multipart/form-data" 
                        class="form-horizontal">
      <div class="form-group row">
      		<label class="col-sm-2">상품코드</label>
      		<div class="col-sm-3">
      			<input name="productId" id="productId"  class="form-control">
      		</div>
      </div>
      <div class="form-group row">
      		<label class="col-sm-2">상품명</label>
      		<div class="col-sm-3">
      			<input name="pname" id="name" class="form-control">
      		</div>
      </div>
   <div class="form-group row">
      		<label class="col-sm-2">가격</label>
      		<div class="col-sm-3">
      			<input name="unitPrice" id="unitPrice" class="form-control">
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2">상세 정보</label>
      		<div class="col-sm-5">
      			<textarea rows="2" cols="50" name="description" id="description" class="form-control" required></textarea>
      		</div>
      </div>  
      <div class="form-group row">
      		<label class="col-sm-2">제조사</label>
      		<div class="col-sm-3">
      			<input name="manufacturer" id="manufacturer" class="form-control">
      		</div>
    </div>
      <div class="form-group row">
      		<label class="col-sm-2">분류</label>
      		<div class="col-sm-3">
      			<input name="category" id="category" class="form-control">
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2">재고 수</label>
      		<div class="col-sm-3">
      			<input name="unitsInstock" id="unitsInstock"class="form-control">
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2">상태</label>
      		<div class="col-sm-5">
      			<label><input type="radio" name="condition" value="New " checked="checked">신규제품</label>
      			<label><input type="radio" name="condition" value="Old ">중고 제품</label>
      			<label><input type="radio" name="condition" value="Refurbished ">재생 제품</label>
      		</div>
    </div>
    <!--  이미지 등록 부분 추가  -->
    <div class="form-group row">
      		<label class="col-sm-2">이미지</label>
      		<div class="col-sm-5">
      			<input type="file" name="productImage" class="form-control">
      		</div>
    </div>
      
    
    <div class="form-group row">
      		<div class="col-sm-offset-2 col-sm-10">
      			<input type="button" class="btn btn-primary" value="등록"   onclick="CheckAddProduct()">
      		</div>
    </div>
    
   </form>
</div>
</body>
</html>