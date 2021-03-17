<%@page import="java.net.URLEncoder"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
      /* request로 넘어오는 파라미터의 값의 문자셋을 현재 페이지에 맞도록 설정 */
      request.setCharacterEncoding("utf-8");

     /*  넘어온 파라미터 값들을 Cookie로 생성하여 브라우저에 저장 */
     Cookie cartId = 
        new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));

     Cookie name = 
    	        new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
     
     Cookie shippingDate = 
 	        new Cookie("Shipping_shippingDate",
 	        		            URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
     
     Cookie country = 
 	        new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
     
     Cookie zipcode = 
  	        new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipcode"),"utf-8"));
     
     Cookie addressName = 
   	        new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
     
     Cookie addressDetail = 
    	        new Cookie("Shipping_addressDetail",URLEncoder.encode(request.getParameter("addressDetail"),"utf-8"));
     
     Cookie addressExtra = 
 	        new Cookie("Shipping_addressExtra",URLEncoder.encode(request.getParameter("addressExtra"),"utf-8"));
     
     /* 쿠키 유효시간 설정 */
     cartId.setMaxAge(24*60*60);//24시간 * 60초*60= 하루 
     name.setMaxAge(24*60*60);
     shippingDate.setMaxAge(24*60*60);
     country.setMaxAge(24*60*60);
     zipcode.setMaxAge(24*60*60);
     addressName.setMaxAge(24*60*60);
     addressDetail.setMaxAge(24*60*60);
     addressExtra.setMaxAge(24*60*60);
     
     /* 브라우저에 저장  */
     response.addCookie(cartId);
     response.addCookie(name);
     response.addCookie(shippingDate);
     response.addCookie(country);
     response.addCookie(zipcode);
     response.addCookie(addressName);
     response.addCookie(addressDetail);
     response.addCookie(addressExtra);
     
     /* 주문확정 처리 화면으로 이동 */
     response.sendRedirect("orderConfirmation.jsp");
     
%>