<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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
      
      //쿼리객체 생성
      PreparedStatement pstmt=null;
      String sql="insert into product values(?,?,?,?,?,?,?,?,?)";
      pstmt=con.prepareStatement(sql);
      
      //바인딩변수에 값 설정
      int index=0;
      pstmt.setString(++index,productId);
      pstmt.setString(++index,pname);
      pstmt.setInt(++index,price);
      pstmt.setString(++index,description);
      pstmt.setString(++index,category);
      pstmt.setString(++index,manufacturer);
      pstmt.setLong(++index,stock);
      pstmt.setString(++index,condition.trim());/* 파라미터로 넘어온 값을 양끝 공백 제거 trim();*/
      pstmt.setString(++index,filename);
      
      //db에 저장
      pstmt.executeUpdate();
      
      if(pstmt !=null) pstmt.close();
      if(con!=null) con.close();
      
      //처리완료 후 결과 리스트확인페이지로 이동
      response.sendRedirect("products.jsp");
     

%>