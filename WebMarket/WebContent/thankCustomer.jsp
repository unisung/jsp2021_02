<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
</head>
<body>
<%
		String shipping_cartId="";
        String  shipping_name="";
        String shipping_shippingDate="";
        String shipping_country="";
        String shipping_zipCode="";
        String shipping_addressName="";
        String shipping_addressDetail="";
        String shipping_addressExtra="";
        
        /* 쿠키 정보 얻기 */
        Cookie[] cookies = request.getCookies();
        /* 쿠키 정보을 얻었으면 */
      if(cookies!=null){
       for(Cookie cook:cookies){
        	String n=cook.getName();//쿠키name얻기
         //주문번호 정보, 배송일자를 쿠키에서 얻기
        if(n.equals("Shipping_cartId")) shipping_cartId=URLDecoder.decode(cook.getValue(),"utf-8");
        if(n.equals("Shipping_shippingDate")) shipping_shippingDate=URLDecoder.decode(cook.getValue(),"utf-8");
        	}
        }
%>
 <jsp:include page="menu.jsp"/>
 <div>
   <div class="jumbotron">
   		<div class="container">
   			<h1 class="display-3">주문 완료</h1>
   		</div>
   </div>
   
   <div class="container">
   		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
   		<p>주문은<%=shipping_shippingDate %>에 배송될 예정입니다.
   		<p>주문번호:<%=shipping_cartId %>
   </div>
   <div class="container">
   		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
   </div>
<%
    /* 장바구니 정보 삭제 */
     //1. 세션의 장바니정보 삭제
     session.invalidate();

     //2. 쿠키의 구매 정보 삭제
     for(Cookie cook:cookies){
    	 /* 쿠키의 유효기간을 0으로 설정 - 즉시 삭제됨 */
    	 if(cook.getName().equals("Shipping_cartId")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_name")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_shippingDate")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_country")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_zipCode")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_addressName")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_addressDetail")) cook.setMaxAge(0);
    	 if(cook.getName().equals("Shipping_addressExtra")) cook.setMaxAge(0);
         /* 클라이언트로 response객체에 실어서 보냄 */
    	 response.addCookie(cook);
     }
%>
 </div>
</body>
</html>