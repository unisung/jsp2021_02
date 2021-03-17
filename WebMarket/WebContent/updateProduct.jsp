<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style type="text/css">
#newImg {
 object-fit:fill;/* 이미지를 부모요소 크기에 맞추기 */
}
</style> 
<!--  bootstrap 라이브러리 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<%-- 파라미터 받기(ko/en)--%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">
<title><fmt:message key="updateTitle"/></title>
</head>
<body>

<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
	   <h1 class="display-3"><fmt:message key="updateTitle"/></h1>
	</div>
</div>
<%@ include file="dbconn.jsp" %>
<%
		String productId=request.getParameter("id");

        // DB에서 상품정보 얻기
        String sql="select * from product where p_id=?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, productId);
        ResultSet rs = pstmt.executeQuery();
        //DB에서 상품정보가 추출 되면 
        if(rs.next()){
%>
<%-- contents --%>
<div class="container">
<%-- 현재페이지의 메세지를 한글/영문으로 변환하는 파라미터  --%>
 <div class="text-right">
       <a href="?language=ko&id=<%=request.getParameter("id")%>">Korean</a>|
       <a href="?language=en&id=<%=request.getParameter("id")%>">English</a>
 </div>
     
     <div class="row">
      	<div class="col-md-5" >
            <img src="/resources/images/<%=rs.getString("p_filename") %>" 
                                          alt="image" style="width:100%" id="newImg"> 
     	</div>

    
    <div class="col-md-7">
   <form name="newProduct" action="./processUpdateProduct.jsp" 
                        method="post"
                        enctype="multipart/form-data" 
                        class="form-horizontal">
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="productId"/></label>
      		<div class="col-sm-3">
      		   <input type="hidden" name="productId" id="productId"  class="form-control" value='<%=rs.getString("p_id")%>' >
      			<input name="productId" id="productId"  class="form-control" value='<%=rs.getString("p_id")%>' disabled="disabled">
      		</div>
      </div>
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="pname"/></label>
      		<div class="col-sm-3">
      			<input name="pname" id="name" class="form-control"  value='<%=rs.getString("p_name")%>'>
      		</div>
      </div>
   <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="unitPrice"/> </label>
      		<div class="col-sm-3">
      			<input name="unitPrice" id="unitPrice" class="form-control" value='<%=rs.getString("p_unitprice")%>'>
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="description"/> </label>
      		<div class="col-sm-5">
      			<textarea rows="2" cols="50" name="description" id="description" class="form-control" required>
      			      <%=rs.getString("p_description") %>
      			</textarea>
      		</div>
      </div>  
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
      		<div class="col-sm-3">
      			<input name="manufacturer" id="manufacturer" class="form-control" value='<%=rs.getString("p_manufacturer")%>' >
      		</div>
    </div>
      <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="category"/> </label>
      		<div class="col-sm-3">
      			<input name="category" id="category" class="form-control" value='<%=rs.getString("p_category")%>' >
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2"> <fmt:message key="unitsInStock"/> </label>
      		<div class="col-sm-3">
      			<input name="unitsInstock" id="unitsInstock"class="form-control" value='<%=rs.getLong("p_unitsInstock")%>' >
      		</div>
    </div>
    <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key="condition"/> </label>
      		<div class="col-sm-5">
      			<label><input type="radio" name="condition" value="New " 
      			                               <%=rs.getString("p_condition").equals("New")?"checked='checked'":"" %>>
      			             <fmt:message key="condition_New"/>
      			 </label>
      			<label><input type="radio" name="condition" value="Old " <%=rs.getString("p_condition").equals("Old")?"checked='checked'":"" %>>
      			            <fmt:message key="condition_Old"/>
      			</label>
      			<label><input type="radio" name="condition" value="Refurbished " <%=rs.getString("p_condition").equals("Refurbished")?"checked='checked'":"" %>>
      			            <fmt:message key="condition_Refurbished"/> 
      			</label>
      		</div>
    </div>
    <!--  이미지 등록 부분 추가  -->
    <div class="form-group row">
      		<label class="col-sm-2"><fmt:message key='productImage'/></label>
      		<div class="col-sm-5">
      			<input type="file" name="productImage" class="form-control"  
      			                         id="image" accept="image/*" 
                                        onchange="setThumbnail(event);">
      		</div>
    </div>
      
    
    <div class="form-group row">
      		<div class="col-sm-offset-2 col-sm-10">
      			<input type="button" class="btn btn-primary" 
      			       value="<fmt:message key="buttonUpdate"/>" onclick="CheckAddProduct()">
      		</div>
     </div>
    </form>
   </div>
 </div>
</div>
   <%
      }        
    %>
 </fmt:bundle><%-- bundle태그 끝. --%>
<script> function setThumbnail(event) { /* ie에서는 미 작동 */
	          var reader = new FileReader(); 
	          reader.onload = function(event) { 
	        	                 var img=document.getElementById("newImg");
	        	                  img.setAttribute("src", event.target.result); 
	        	                 }; 
	          reader.readAsDataURL(event.target.files[0]); 
	        } 
 </script>
</body>
</html>