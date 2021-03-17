<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
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
     String id=multi.getParameter("id");
     String name=multi.getParameter("name");

      //업로드된 파일정보 얻기
      Enumeration files = multi.getFileNames();
      String fname = (String)files.nextElement();
      //12라인에서 선언한 String filename="";의 변수명을 사용하여 파일명을 받기
     filename = multi.getFilesystemName(fname);
      
     
      
      //쿼리객체 생성
    /*   PreparedStatement pstmt=null;
      String sql="insert into product values(?,?)";
      pstmt=con.prepareStatement(sql);
      
      //바인딩변수에 값 설정
      pstmt.setString(1,id);
      pstmt.setString(2,name);
      
      //db에 저장
      pstmt.executeUpdate(); */
      
      //이미지 저장---------------
      File f=new File(savePath+"/"+filename);
      
      System.out.println(f.getPath());
      System.out.println(f.length());
      
      FileInputStream fis = new FileInputStream(f);
      
     String sql = "insert into mem values(?,?,?)";
      PreparedStatement pstmt = con.prepareStatement(sql);
      
      pstmt.setString(1,id);
      pstmt.setString(2,name);
      pstmt.setBinaryStream(3, fis,(int)f.length());
      pstmt.executeUpdate();
      
      
      
      if(pstmt !=null) pstmt.close();
      if(con!=null) con.close();
      
      //처리완료 후 결과 리스트확인페이지로 이동
      response.sendRedirect("imageView.jsp?id="+id);
     

%>