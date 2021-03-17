<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="./error/exceptionNoProductId.jsp" %>
<%-- DBMS 연결 페이지 inclue --%>
<%@ include file="dbconn.jsp" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상세정보 출력페이지</title>
<script>
    function addToCart(){
    	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
    		 document.addForm.submit();//<form name='addForm'> 내의 데이타 전송
    	}else{
    		document.addForm.reset();//<form name='addForm'>내의 값 초기화 
    	}
    }
</script>
</head>
<body>

<%-------------------------- 파라미터 받기(ko/en)-------------------------%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">

<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><fmt:message key="productTitle"/></h1>
	</div>
</div>

<%
String id=request.getParameter("id");
    String sql="select * from product where p_id=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1,id); 
    /* 상품 상세정보 얻기*/
    ResultSet rs=pstmt.executeQuery();
    rs.next();
    
%>
<div class="container"><!-- 영역을 잡기위해 컨테이너를 쓴다 -->
    <%-- 현재페이지의 메세지를 한글/영문으로 변환하는 파라미터  --%>
    <%-- 현재 페이지에서 파라미터의 갯수를 확인 후 개수만큼 파라미터 지정을 해야 오류가 안남. --%>
 <div class="text-right">
       <a href="?language=ko&id=<%=id%>">Korean</a>|
       <a href="?language=en&id=<%=id%>">English</a>
 </div>
 
<div class="row">
   <div class="col-md-5"><!--  이미지 출력부분 -->
   		 <%-- <img src="./resources/images/<%=product.getFilename()%>" style="width:100%"> --%>
   		 <%-- tomcat의 server.xml에 외부이미지 경로 설정 후 아래와 같이 처리  --%>
   		 <img src="/resources/images/<%=rs.getString("p_filename")%>" style="width:100%">
   </div>
<div class ="col-md-6">
<h3><%=rs.getString("p_name") %></h3>
<p><%=rs.getString("p_description") %></p>
<p><b><fmt:message key='productId'/>:</b><span class="badge badge-danger">><%=rs.getString("p_id") %></span>
<p><b><fmt:message key='manufacturer'/></b>:<%=rs.getString("p_manufacturer") %>
<p><b><fmt:message key='category'/></b>:<%=rs.getString("p_category") %>
<p><b><fmt:message key='unitsInStock'/></b>:<%=rs.getLong("p_unitsinstock") %>
<h4><fmt:message key='unitPrice'/>:<%=rs.getInt("p_unitprice") %></h4>

<p>
<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
<a href="#" class="btn btn-info"  onclick="addToCart()"> <fmt:message key='order'/> &raquo;</a>
<a href="./cart.jsp" class="btn btn-warning"><fmt:message key='cartLink'/> &raquo;</a>
<a href="./products.jsp" class="btn btn-secondary"> <fmt:message key='productList'/>&raquo;</a>
</form>

</div>
</div>
</div>
<jsp:include page="footer.jsp"/>

</fmt:bundle><%-- bundle 끝. --%>
</body>
</html>












