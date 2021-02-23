<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
			 int grade=7;
             String gradeStringA="A등급",gradeStringB="B등급";
             
             if(grade>10){
            	    %><%=gradeStringA%><br>
             <% }else{%>
             <%=gradeStringB %>
<%}%>
 <br>
    <%
    	    if(grade>10){
    	    	 out.print(gradeStringA+"<br>");
    	    }else{
    	    	out.print(gradeStringB);
    	    }
    %>
   
</body>
</html>