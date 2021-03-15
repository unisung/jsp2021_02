<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%-- DBMS연결 객체 페이지 include --%>
<%@ include file="dbconn.jsp" %>
<%
     //넘어온 파라미터의 문자셋을 현재 페이지에 맞도록 설정
      request.setCharacterEncoding("utf-8");
  
    //저장경로 설정
     String filename="";
/*      //파일업로드된 경로
     String root = getServletContext().getRealPath("/");
     String savePath=root+"resources/images"; */
     String savePath="c:/upload";
     
     // out.print(savePath);
     int maxSize = 5 * 1024 * 1024;
     String enctype="utf-8";
     
     //upload처리 객체 생성
     MultipartRequest multi=new MultipartRequest(request, savePath,maxSize, enctype, new DefaultFileRenamePolicy());

     //파라미터값 받기
     //MultipartRequest로 바꿈
     String productId=multi.getParameter("productId");
   %>
  <%-- <%=productId %> --%> 
 <%
     String pname=multi.getParameter("pname");
     String unitPrice=multi.getParameter("unitPrice");
     String description=multi.getParameter("description");
     String manufacturer=multi.getParameter("manufacturer");
     String unitsInstock=multi.getParameter("unitsInstock");
     String condition=multi.getParameter("condition");
     String category=multi.getParameter("category");
     
     //숫자로 변환
      Integer price;
      if(unitPrice.isEmpty()) price=0;//""
      else 
    	  price=Integer.parseInt(unitPrice);
      
      long stock;
      if(unitsInstock.isEmpty()) stock=0;//""
      else
    	  stock=Long.valueOf(unitsInstock);
      
      //업로드된 파일정보 얻기
      Enumeration files = multi.getFileNames();
      String fname = (String)files.nextElement();
      //12라인에서 선언한 String filename="";의 변수명을 사용하여 파일명을 받기
     filename = multi.getFilesystemName(fname);
      
      // 파라미터을 받아서 상품정보 update처리 
      // 쿼리객체 생성
      PreparedStatement pstmt=null;
      String sql="select * from product where p_id=?";
      pstmt=con.prepareStatement(sql);
      pstmt.setString(1, productId);
      
      //DB로부터 파리미터에 해당하는상품id를 가진 상품 정보 추출
      ResultSet rs=pstmt.executeQuery();
   
      //DB에 해당 상품정보가 있으면 update처리
   if(rs.next()){
       if(filename!=null){//수정할 이미지가 파라미터로 넘어왔으면 이미지도 수정처리
    	   sql="update product set p_name=?, p_unitPrice=?, p_description=?, "
    		  +" p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=?, "
    		  +" p_fileName=? where p_id=?";
    	     //수정할 값 설정
    	     pstmt=con.prepareStatement(sql);
    	     //바인딩변수에 값 설정
    	      int index=0;
    	     
    	      pstmt.setString(++index,pname);
    	      pstmt.setInt(++index,price);
    	      pstmt.setString(++index,description);
    	      pstmt.setString(++index,manufacturer);
    	      pstmt.setString(++index,category);
    	      pstmt.setLong(++index,stock);
    	      pstmt.setString(++index,condition.trim());//상태값 trim() 처리
    	      pstmt.setString(++index,filename);
    	      //키 wher p_id
    	      pstmt.setString(++index,productId);
    	      
    	      //update처리
    	      pstmt.executeUpdate();
    	     
       }else{//수정할 이미지가 파라미터로 넘어오지 않았으면 이미지는 수정미처리
    	   sql="update product set p_name=?, p_unitPrice=?, p_description=?, "
        	  +" p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=? "
        	  +" where p_id=?";
       
        	     //수정할 값 설정
        	     pstmt=con.prepareStatement(sql);
        	     //바인딩변수에 값 설정
        	      int index=0;
        	     
        	      pstmt.setString(++index,pname);
        	      pstmt.setInt(++index,price);
        	      pstmt.setString(++index,description);
        	      pstmt.setString(++index,manufacturer);
        	      pstmt.setString(++index,category);
        	      pstmt.setLong(++index,stock);
        	      pstmt.setString(++index,condition.trim());//상태값 trim() 처리
        	    /*   pstmt.setString(++index,filename); */
        	      //키 wher p_id
        	      pstmt.setString(++index,productId);
        	      
        	      //update처리
        	      pstmt.executeUpdate();
       }
   }
      /* 자원 해제 */
      if(pstmt !=null) pstmt.close();
      if(con!=null) con.close();
      
      //상품정보 update완료 후 상품편집 페이지로 이동.
      response.sendRedirect("editProduct.jsp?edit=update");
     
%>