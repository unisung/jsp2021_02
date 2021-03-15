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
    <%=id %><br>
    <%=passwd %><br>
    <%=name %>
    <%-- dataSource 선언 --%>
    <sql:setDataSource  var="dataSource" 
                  url="jdbc:oracle:thin:@localhost:1521:xe" 
                  driver="oracle.jdbc.driver.OracleDriver"
                  user="jspbook"
                  password="jspbook"
                  />
                  
     <%-- 입력처리  --%> 
     <sql:update dataSource="${dataSource}"  var="resultSet">
         update member set passwd=? where id=?
         <sql:param value="<%=passwd%>"/>
         <sql:param value="<%=id%>"/>
     </sql:update>            
    <hr>
    <c:import url="sql01.jsp" var="resultUrl"/>
    ${resultUrl }
</body>
</html>