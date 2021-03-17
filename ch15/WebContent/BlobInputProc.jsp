<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>

<%@include file="dbconn.jsp" %>
<%
String sql = "insert into testblob(id,name,photo) values(?,?,?)";
try{
	   
	   //자동 커밋 설정 해제
	   con.setAutoCommit(false);//-----
	   File file = new File("C:/upload/Koala.jpg");
	   InputStream is = new FileInputStream(file);
	   int fileSize= (int)file.length();
	   PreparedStatement pstmt = con.prepareStatement(sql);
	   pstmt.setString(1, "aa");
	   pstmt.setString(2,"사막");
	   //이미지 파일 셋팅
	   pstmt.setBinaryStream(3, is, fileSize);
	    
	   int  result = pstmt.executeUpdate();
	   if(result>0)
	     con.commit();
	   else
		 con.rollback();
	   is.close();
	   pstmt.close();
	   con.setAutoCommit(true);//-----
	   con.close();
	   out.print("입력 처리 완료");
	  
}catch(Exception e){
	out.print(e.getMessage());
}
%>