<%@page import="java.io.BufferedOutputStream"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<html>
<body>
<%@include file="dbconn.jsp" %>
<%
BufferedOutputStream bos=null;
InputStream in = null;
ResultSet rs=null;
String sql = "select profile from mem where id=?";
try{

	   PreparedStatement pstmt = con.prepareStatement(sql);
	   String id = request.getParameter("id");
	   pstmt.setString(1, id);
	   rs =pstmt.executeQuery();
	   if(rs.next()){
		   //DB로 부터 이미지 객체 읽어서 생성
		   Blob blob = rs.getBlob(1);
		   //뒤에서 호출되는 getOutputStream에 의한 객체 충돌 방지처리
		   out.clear();
		   out=pageContext.pushBody();
		   
		   //출력스트림 생성
		   bos = new BufferedOutputStream(response.getOutputStream());
		   //시리얼라이즈
		   in = blob.getBinaryStream();
		   //이미지 크기 
		   int length = (int)blob.length();
		   //버퍼 
		   byte[] buffer = new byte[length];
		   //write작업
		   while((length=in.read(buffer))!=-1){
			   bos.write(buffer);
		   }
		   bos.close();
		   in.close();
		   pstmt.close();
		   con.close();
	   }
}catch(Exception e){
	out.print("오류:"+e.getMessage());
}
%>
</body>
</html>