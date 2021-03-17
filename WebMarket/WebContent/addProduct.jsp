<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!--  bootstrap 라이브러리 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
<%-- 파라미터 받기(ko/en)--%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">

<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
	   <h1 class="display-3"><fmt:message key="title"/></h1>
	</div>
</div>
<%-- contents --%>
<div class="container">
<%-- 현재페이지의 메세지를 한글/영문으로 변환하는 파라미터  --%>
 <div class="text-right">
       <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
       <a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
 </div>

   <form name="newProduct" action="./processAddProduct.jsp" 
                        method="post"
                        enctype="multipart/form-data" 
                        class="form-horizontal">
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="productId"/></label>
      		<div class="col-sm-3">
      			<input name="productId" id="productId"  class="form-control">
      		</div>
      </div>
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="pname"/></label>
      		<div class="col-sm-3">
      			<input name="pname" id="name" class="form-control">
      		</div>
      </div>
   <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="unitPrice"/> </label>
      		<div class="col-sm-3">
      			<input name="unitPrice" id="unitPrice" class="form-control">
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="description"/> </label>
      		<div class="col-sm-5">
      			<textarea rows="2" cols="50" name="description" id="description" class="form-control" required></textarea>
      		</div>
      </div>  
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
      		<div class="col-sm-3">
      			<input name="manufacturer" id="manufacturer" class="form-control">
      		</div>
    </div>
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="category"/> </label>
      		<div class="col-sm-3">
      			<input name="category" id="category" class="form-control">
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2"> <fmt:message key="unitsInStock"/> </label>
      		<div class="col-sm-3">
      			<input name="unitsInstock" id="unitsInstock"class="form-control">
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="condition"/> </label>
      		<div class="col-sm-5">
      			<label><input type="radio" name="condition" value="New " checked="checked">
      			             <fmt:message key="condition_New"/>
      			 </label>
      			<label><input type="radio" name="condition" value="Old ">
      			            <fmt:message key="condition_Old"/>
      			</label>
      			<label><input type="radio" name="condition" value="Refurbished ">
      			            <fmt:message key="condition_Refurbished"/> 
      			</label>
      		</div>
    </div>
    <!--  이미지 등록 부분 추가  -->
    <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key='productImage'/></label>
      		<div class="col-sm-5">
      			<input type="file" name="productImage" class="form-control">
      		</div>
    </div>
      
    
    <div class="form-group row">
      		<div class="col-sm-offset-2 col-sm-10">
      			<input type="button" class="btn btn-primary" 
      			       value="<fmt:message key="button"/>" onclick="CheckAddProduct()">
      		</div>
    </div>
    
   </form>
</div>

 </fmt:bundle><%-- bundle태그 끝. --%>
 
</body>
</html>