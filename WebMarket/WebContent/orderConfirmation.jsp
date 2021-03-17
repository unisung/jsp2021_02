<%@page import="java.text.NumberFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 파라미터 받기(ko/en)--%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>

<!DOCTYPE html>
<%
        //현재페이지에 맞게 문자셋 설정 
          request.setCharacterEncoding("UTF-8");

        /* cartId 얻기 */
        String cartId = session.getId();
        
        /* 쿠키 값을 저장한 변수 선언 */
        String shipping_cartId ="";
        String shipping_name ="";
        String shipping_shippingDate="";
        String shipping_country="";
        String shipping_zipCode="";
        String shipping_addressName="";
        String shipping_addressDetail = "";
        String shipping_addressExtra="";
        
        /* request로 부터 쿠키 정보 읽어 오기 */
        Cookie[] cookies = request.getCookies();
        /* 쿠키배열을 순회하면 서 변수 에 값 저장 */
        if(cookies !=null){
        	for(int i=0;i<cookies.length;i++){
        		Cookie thisCookie = cookies[i];
        		String n=thisCookie.getName();//쿠키이름 얻기
        		if(n.equals("Shipping_cartId"))
        			shipping_cartId=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_name"))
        			shipping_name=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_shippingDate"))
        			shipping_shippingDate=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_country"))
        			shipping_country=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_zipCode"))
        			shipping_zipCode=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_addressName"))
        			shipping_addressName=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_addressDetail"))
        			shipping_addressDetail=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        		if(n.equals("Shipping_addressExtra"))
        			shipping_addressExtra=URLDecoder.decode(thisCookie.getValue(),"utf-8");
        	}
        }       
%>
<%-- <p><%=shopping_cartId %>
<p><%=shopping_name %>
<p><%=shopping_shippingDate %>
<p><%=shipping_country %>
<p><%=shipping_zipCode %>
<p><%=shipping_addressName %>
<p><%=shipping_addressDetail %>
<p><%=shipping_addressExtra %> --%>
<html>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title><fmt:message key='orderConfirmTitle'/></title>
</head>
<body>
 <jsp:include page="menu.jsp"/>
 <div class="jumbotron">
   <div class="container">
        <h1 class="display-3"> <fmt:message key='orderConfirmTitle'/></h1>
   </div>
 </div>
  <%-- 현재페이지의 메세지를 한글/영문으로 변환하는 파라미터  --%>
 <div class="text-right">
       <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
 </div>
 
 <div class="container col-8 alert alert-info">
   <div class="text-center">
       <h1><fmt:message key='receiptTitle'/></h1>
   </div>
   <div class="row justify-content-between">
     <div class="col-6" align="left">
           <strong><fmt:message key='receiveAddress'/></strong><br><fmt:message key='receiveName'/>:<%=shipping_name%><br>
           <fmt:message key='receiveZipcode'/>:<%=shipping_zipCode %><br>
           <fmt:message key='receiveAddress'/>:<%=shipping_addressName %><br>
           <fmt:message key='receiveAddressDetail'/>:<%=shipping_addressDetail %><br>
           <fmt:message key='receiveAddressExtra'/>:<%=shipping_addressExtra %><br>
           (<%=shipping_country %>)
     </div>
     <div class="col-4" align="right">
     	<P><em><fmt:message key='receiveDate'/>:<%=shipping_shippingDate %></em>
     </div>
     </div><%-- row justify-content-between 끝. --%>
     
     
     <div>
           <table class="table table-hover">
               <tr>
                 <th class="text-center"><fmt:message key='pname'/></th>
                 <th class="text-center"><fmt:message key='orderQuantity'/></th>
                 <th class="text-center"><fmt:message key='unitPrice'/></th>
                 <th class="text-center"><fmt:message key='thtotal'/></th>
                </tr> 
            <%
                    /* 합계 계산용 변수 선언*/
            		int sum=0;
                    /* session으로 부터 장바구니 정보를 얻기 */
                    ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
                    /* 만약 장바구니 객체 없으면 오류발생, 비어있는 장바구니 객체 생성 */
                    if(cartList==null)
                    	cartList = new ArrayList<Product>();
                    /* 장바구니에 있는 상품들을 하나씩 꺼내서 출력 */
                    for(int i=0;i<cartList.size();i++){
                    	Product product = cartList.get(i);
                    	//상품별 판매액 계산
                    	int total= product.getUnitPrice() * product.getQuantity();
                    	//총판매액 계산
                    	sum = sum + total;
                   %> 	
                    <tr>
                    	<td class="text-center"><em><%=product.getPname() %></em></td>
                    	<td class="text-center"><%=NumberFormat.getInstance().format(product.getQuantity()) %></td>
                    	<td class="text-center"><%=NumberFormat.getCurrencyInstance(request.getLocale()).format(product.getUnitPrice()) %></td>
                    	<td class="text-center"><%=NumberFormat.getCurrencyInstance(request.getLocale()).format(total) %></td>
                    </tr>	
                  <%  	
                    }
            %>    
              <!--  총액 출력-->
             <tr>
                 <td></td>
                 <td></td>
                 <td class="text-right"><strong><fmt:message key='thsum'/>:</strong></td>
                 <td class="text-center text-danger"><strong><%=NumberFormat.getCurrencyInstance(request.getLocale()).format(sum)%></strong></td>
             </tr>
           </table>
           
           <a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" 
                                                                                              role="button"><fmt:message key='linkPrev'/></a>
           <a href="./thankCustomer.jsp" class="btn btn-success" role="button"><fmt:message key='buttonOrderConfirm'/></a>
           <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"><fmt:message key='linkCancel'/></a>
     </div>
 </div>
</body>
</fmt:bundle>
</html>