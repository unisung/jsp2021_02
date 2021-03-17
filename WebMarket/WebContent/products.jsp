<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page  contentType="text/html; charset=UTF-8"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 파라미터 받기(ko/en)--%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">

<!DOCTYPE html><html><head>
<!-- bootstrap라이브러리 연결 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
       <jsp:include page="menu.jsp"/>
       <div class="jumbotron">
         <div class="container">
         		<h1 class="display-3"><fmt:message key="productsTitle"/> </h1>
         </div>
       </div>
      <div class="container">
      <%-- 현재페이지의 메세지를 한글/영문으로 변환하는 파라미터  --%>
 <div class="text-right">
       <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
 </div>
 
         <div class="row" align="center">
        <%@ include file="dbconn.jsp" %>
   <%
                 /* 상품 정보를 db에서 얻어오기 */
                 PreparedStatement pstmt=null;
                 ResultSet rs=null;
                 String sql = "select * from product";
                 pstmt=con.prepareStatement(sql);
                 rs=pstmt.executeQuery();
                 
   				 while(rs.next()){
   				        %>
   				        <div class="col-md-4">
   				        <img src="/resources/images/<%=rs.getString("p_fileName")%>"  style="width:100%"> <%-- 이미지파일경로 지정 --%>
   				        <h3><%=rs.getString("p_name") %></h3>
   				            <p><%=rs.getString("p_description") %></p>
   				            <p><%=rs.getInt("p_unitprice") %>원</p>
   				            <%-- 상세페이지 이동 처리 --%>
   				            <p><a href="./product.jsp?id=<%=rs.getString("p_id")%>" 
   				                         class="btn btn-secondary" role="button">
   				                         <fmt:message key='detailButton'/> &raquo;</a>
   				        </div>
   <% 	
   } 
   %>
   
   
    </div>
        <hr><!-- 수평선 -->
   </div>
   <jsp:include page="footer.jsp"/>
   </fmt:bundle><!-- bundle 끝. -->
   
<div class="container" style="border: 1px solid black; width: 500px;height: 100px; position: fixed;top: 50px; right: 20px;">
  <p>장바구니</p>            
  <table class="table">
    <tbody>
     <%
                		//카트리스트로부터 상품 카트상품 추출하여 속성 출력
                		int sum=0;// 가트 상품 전체 합계
                		//세션으로 부터 카트상품리트 추출
                		ArrayList<Product> cartList =(ArrayList<Product>)session.getAttribute("cartlist");
                		//세션에 카트정보 없으면 null
                		if(cartList == null){
                			cartList = new ArrayList<Product>();//카트리스트 생성
                		}
                		//카트리스트로부터 상품리스트 출력
                		for(int i=0;i<cartList.size();i++){
                			Product product = cartList.get(i);
                			int total=product.getUnitPrice() * product.getQuantity();//단가 * 장바구니에 등록된 갯수
                			sum=sum+total; //총합계 계산
						%>
						<!-- 개별 상품 속성 출력 -->
                		<tr>
                		    <td><%=product.getProductId() %> - <%=product.getPname() %></td>
                		    <td><%=NumberFormat.getCurrencyInstance().format(product.getUnitPrice()) %></td>
                		    <td><%=product.getQuantity() %></td>
                		    <td><%=NumberFormat.getCurrencyInstance().format(total) %></td>
                		</tr>
                	<%	
                		}
                %>
         
     </tbody>
     </table>    
   </div>
</body>
</html>