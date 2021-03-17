<%@ page  contentType="text/html; charset=UTF-8"%>
<%
        /*  장바구니에서 쿼리스트링 파라미터로 넘어온 sessionId를 얻기 */
         String id = request.getParameter("cartId");
        
        /*  카트 id가 없는 경우 다시 장바구니 페이지로 이동 */
        if(id==null || id.trim().equals("")){
        	 response.sendRedirect("cart.jsp");
        	 return;
        }
        
        /* 카트id가 존재하면 장바구니 비우기(session.invalidate())*/
        session.invalidate();
        
        /* 장바구니 비운 후 다시 장바구니 페이지로 이동하여 삭제여부 확인 */
        response.sendRedirect("cart.jsp");

%>