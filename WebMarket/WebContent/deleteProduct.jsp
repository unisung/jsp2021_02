<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
       //파라미터 쿼리스트링으로 넘어온 상품id 얻기
       String productId=request.getParameter("id");

      //db 쿼리 객체 생성
      PreparedStatement pstmt = null;
      //DB에 상품정보가 있으면 결과를 얻어와서 삭제 처리
      ResultSet rs = null;
      //쿼리문 작성
      String sql="select * from product where p_id=?";
      //쿼리객체 설정
      pstmt = con.prepareStatement(sql);
      //바인딩 변수 값 설정
      pstmt.setString(1, productId);
      //쿼리문 실행
      rs=pstmt.executeQuery();
      
      //DB에 등록되 상품 삭제처리
      if(rs.next()){
    	  sql="delete from product where p_id=?";
    	  pstmt=con.prepareStatement(sql);
    	  pstmt.setString(1,productId);
    	  pstmt.executeUpdate();
    	  
      }else{
    	  out.print("일치하는 상품이 없습니다.");
      }
      
      //자원해제
      if(rs!=null) rs.close();
      if(pstmt!=null) pstmt.close();
      if(con!=null) con.close();
      
      //삭제 처리 후 다시 편집 페이지로 이동.
      response.sendRedirect("editProduct.jsp?edit=delete");
      
%>