<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>JSTL - SQL </title>
</head>
<body>
    <%
    		request.setCharacterEncoding("utf-8");
             
            String id=request.getParameter("id");
            String name=request.getParameter("name");
            String passwd=request.getParameter("passwd");
    
    %>
    <%-- dataSource 선언 --%>
    <sql:setDataSource  var="dataSource" 
                  url="jdbc:oracle:thin:@localhost:1521:xe" 
                  driver="oracle.jdbc.driver.OracleDriver"
                  user="jspbook"
                  password="jspbook"
                  />
                  
     <%-- 입력처리  --%> 
     <sql:update dataSource="${dataSource}"  var="resultSet">
         insert into member values (?,?,?)
         <sql:param value="<%=id %>"/>
         <sql:param value="<%=name %>"/>
         <sql:param value="<%=passwd %>"/>
     </sql:update>            
    
</body>
</html>