<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<sql:setDataSource var="dataSource"  url="jdbc:oracle:thin:@localhost:1521:xe" 
                             driver="oracle.jdbc.driver.OracleDriver"
                             user="jspbook"    password="jspbook" />
                             
<sql:update dataSource="${dataSource}" var="resultSet">
		insert into webMember(id, name,photo)  values(?,?,?)
		<sql:param value="kim"/> 
		<sql:param value="김길동"/> 
		<sql:param value='<%=new FileInputStream(new File("c:/temp/lena.png"))%>'/> 
		
</sql:update>
