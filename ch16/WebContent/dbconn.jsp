<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
Connection con=null;
    try{
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	     con=
		    DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
				                                   "jspbook", "jspbook");
     
    }catch(Exception e){
    	 out.print("데이타베이스 연결에 실해했습니다.");
    	 out.print("SQLException : "+e.getMessage());
     }

%>
