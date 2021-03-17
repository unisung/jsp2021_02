<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
       /* 파라미터 값 받기 */
        String id=request.getParameter("id");

        /* 입/출력 스트림 객체 생성 */
		BufferedOutputStream bos=null;
        InputStream is=null;
        ResultSet rs=null;
        /* 쿼리문 작성 */
       /*  String sql="select photo from photoTest where id=?"; */
        String sql="select profile from webMember where id=?";
        try{
        	     /* 쿼리 객체 생성*/
        	     PreparedStatement pstmt = con.prepareStatement(sql);
                 pstmt.setString(1,id);
                 rs=pstmt.executeQuery();
                 /* 쿼리 결과 처리 */
                 if(rs.next()){
                	 /* DB로 부터 이미지 객체 읽어서 생성 */
                	 Blob blob = rs.getBlob(1);//java에서 제공하는 Blob객체로 값 얻기
                	 
                	 //아래에 호출되는 getOutputStream에 의한 객체 충돌 방지처리
                	 out.clear();//메모리버퍼 비우기
                	 out=pageContext.pushBody();
                	 
                	 /* 출력 스트림 생성 */
                	 bos = new BufferedOutputStream(response.getOutputStream());
                	 /* 출력될수 있도록 serialize */
                	  is = blob.getBinaryStream();
                	 /* 이미지 크기 얻기 */
                	 int length = (int)blob.length();
                	 /* 버퍼 */
                	 byte[] buffer = new byte[length];
                	 /* write 작업 */
                	 while((length=is.read(buffer))!=-1){
                		      bos.write(buffer);
                	 }
                	 /* 자원해제 */
                	 bos.close();
                	 is.close();
                	 pstmt.close();
                	 con.close();
                 }  
        }catch(Exception e){
        	 out.print("오류: " +e.getMessage());
        }
%>