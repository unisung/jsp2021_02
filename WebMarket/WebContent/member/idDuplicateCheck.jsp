<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
 <%
   String id = request.getParameter("id") ;
   
    String sql="select count(*) from webmember where id=?";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet rs=pstmt.executeQuery();
    if(rs.next()){
    	if(rs.getInt(1)>0){
    		out.print("<script>alert('이미 존재하는 id 입니다.');</script>");
    		out.print("<script>opener.newMember.id.value='';</script>");
    		out.print("<script>opener.newMember.id.select();</script>");
    		out.print("<script>self.close();</script>");
    	}else{// rs.getInt(1)==0 인 경우
    		out.print("<script>alert('사용할수 있는 id 입니다.');</script>");
    		out.print("<script>opener.newMember.id.readOnly=true;</script>");
    		out.print("<script>opener.newMember.password.select();</script>");
    		out.print("<script>self.close();</script>");
    	}
    }else{
    	out.print("<script>self.close();</script>");
    }
 
 %>
