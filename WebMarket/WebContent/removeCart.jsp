<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
      /* 쿼리스트링 파라미터로 넘어온 상품 id값 얻기  */
      String id=request.getParameter("id");
     /* 넘어온 쿼리스트링 파라미터값 이 없거나 빈문자열("") 이면 상품목록 전달 */
       if(id==null || id.trim().equals("")){// " P1234 " -trim()-> "P1234"
    	   response.sendRedirect("products.jsp");
           return;
       }
     
      /* 쿼리스트링 파라미터로 넘어온 상품 id값 정보 얻기, 상품목록에 있는지 여부 확인 */
       ProductRepository dao = ProductRepository.getInstance();
      /* 상품목록에 id에 해당하는 상품이 존재하지 않으면 에러 페이지로 이동 */
      Product product = dao.getProductById(id);
      if(product == null){
    	  response.sendRedirect("./error/exceptionNoProductId.jsp");
      }
      
      /*  장바구니리스트에서 넘어온 파라미터에 해당하는 상품이 존재하면, 장바구니에서 삭제 처리 */
      /* session에 저장된 장바구니를 추출 */
      ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
      /*  장바구니에 파라미터로 넘어온 상품id에 해당하는 상품이 존재하면, 장바구니에서 삭제처리  */
      Product goodsQnt = new Product();
      //삭제
      for(int i=0;i<cartList.size();i++){
    	   goodsQnt = cartList.get(i);
    	   if(goodsQnt.getProductId().equals(id)){
    		    cartList.remove(goodsQnt);//리스트내의 객체 삭제 remove(index), remove(객체)
    	   }
      }
      
      /*  삭제 처리 후 다시 장바구니로 이동하여 삭제 되었지 확인. */
        response.sendRedirect("cart.jsp");
       
%>
