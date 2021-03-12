<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
  <%
  			Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from member order by id");
            out.print("<table>");
            
            while(rs.next()){
            	out.print("<tr><td>"+rs.getInt(1)+"</td>");
            	out.print("<td>"+rs.getString(2)+"</td>");
            	out.print("<td>"+rs.getString(3)+"</td></tr>");
            }
            
            out.print("</table>");
  %>
</body>
</html>