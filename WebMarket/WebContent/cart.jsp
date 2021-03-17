<%@page import="java.text.NumberFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>cart리스트 페이지</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script>
/*  장바구니 비우기 확인 함수 */
function deleteCart(cartId){
	  //alert(cartId);
	  if(confirm("장바구니를 정말로 비우시겠습니까?")){
		  location.href="./deleteCart.jsp?cartId="+cartId;
	  }
  }
/* 장바구니 내의 개별상품 삭제 확인 함수 */  
function removeCart(id){
	  isDelete=confirm("해당 상품을 정말 삭제하시겠습니까?");
	 //alert(isDelete); 
	 if(isDelete)
		 location.href= "./removeCart.jsp?id="+id;
  }
/* 구매 진행으로 이동 */
function goBuy(cartId){
	/* 장바구니에 상품이 없으면 null */
	if(<%=(ArrayList<Product>)session.getAttribute("cartlist")==null?true:false%>){
		 alert('장바구니에 상품이 없습니다.');
		  return;
	  }else if(confirm("장바구니의 상품을 구매하시겠습니까?")){
		  location.href="./shippingInfo.jsp?cartId="+cartId;
	  }
}
</script>
</head>
<body>
<%-------------------------- 파라미터 받기(ko/en)-------------------------%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">
    <%
             //카트는 세션단위로 구분되므로 session id를 카드 id로 사용
             String cartId = session.getId();
             //out.println("세션 id: "+session.getId());
    %>
    <jsp:include page="menu.jsp"/>
    <div class="jubmbotron">
    			<div class="container">
    				<h1 class="display-3"><fmt:message key="cartTitle"/></h1>
    			</div>
    </div>
    <%-- 장바구니 리스트 출력 --%>
    <div class="container">
        <%-- 현재 페이지에서 파라미터의 갯수를 확인 후 개수만큼 파라미터 지정을 해야 오류가 안남. --%>
			 <div class="text-right">
			       <a href="?language=ko">Korean</a>|
			       <a href="?language=en">English</a>
			 </div>
    	<div class="row">
    	     <table width="100%">
    	       <tr>
    	        <td align="left">
    	           <a href="javascript:deleteCart('<%=cartId%>')" class="btn btn-danger"><fmt:message key="buttonDelete"/></a>
    	        </td>
    	        <td align="right">
    	           <a href="javascript:goBuy('<%=cartId%>')"  class="btn btn-success"><fmt:message key="buttonOrder"/></a>
    	       </td>
    	       </tr>
    	     </table><!-- 삭제 , 주문 메뉴 끝. -->
    	
    	</div>
        <div style="padding-top: 50px;">
            <table class="table table-hover">
                <tr>
                	<th><fmt:message key="thProduct"/></th>
                	<th><fmt:message key="thPrice"/></th>
                	<th><fmt:message key="thquantity"/></th>
                	<th><fmt:message key="thtotal"/></th>
                	<th><fmt:message key="thdescription"/></th>
                </tr>
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
                		    <td><a href="javascript:removeCart('<%=product.getProductId()%>')" class="badge badge-danger">
                		           <fmt:message key="buttonDelete"/></a>
                		    </td>
                		</tr>
                	<%	
                		}
                %>
                      <!-- 집계내역 출력 -->
                      <tr>
                         <th></th><th></th><th><fmt:message key="thsum"/></th><th><%=NumberFormat.getCurrencyInstance().format(sum) %></th><th></th>
                      </tr>
            </table>
              <%-- 쇼핑 계속하기 메뉴 추가 --%>
             <a href="./products.jsp" class="btn btn-secondary"> &laquo; <fmt:message key="linkShopping"/> </a>
        </div>
          <hr>
    </div><!-- container끝. -->
    <jsp:include page="footer.jsp"/>
 </fmt:bundle>
    
</body>
</html>