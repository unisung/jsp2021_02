<%@page import="java.sql.PreparedStatement"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
		String name = request.getParameter("name");
		
if(id!=null && name!=null){
	String sql 
	  = "insert into board(num, id, name, subject, content, register_day, ip) "
	   +" values (board_seq.nextval, ?,?,'게시글 제목'||board_seq.currval, '게시글 내용'||board_seq.currval,to_char(sysdate),'127.0.0.1')";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setString(2,name);
		
		for(int i=0;i<10;i++)
			pstmt.executeUpdate();
}

%>