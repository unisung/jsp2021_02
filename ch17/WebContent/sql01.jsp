<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>jstl - sql </title>
</head>
<body>
<%-- dataSource 얻기  --%>
<sql:setDataSource  var="dataSource" 
                  url="jdbc:oracle:thin:@localhost:1521:xe" 
                  driver="oracle.jdbc.driver.OracleDriver"
                  user="jspbook"
                  password="jspbook"
                  />
                  
   <%-- 데이타 조회 쿼리스트링 선언 --%>
   <sql:query var="resultSet" dataSource="${dataSource}">
           select * from member order by id
   </sql:query>
   
   <table border=1>
     <tr>
       <c:forEach var="columnName" items="${resultSet.columnNames}">
       			<th width=100><c:out value="${columnName}"/></th>
       </c:forEach>
     </tr>
     
     <c:forEach var="row" items="${resultSet.rowsByIndex}">
        <tr> 
           <c:forEach var="column" items="${row}" varStatus="i">
                        <td>
                                <c:if test="${column !=null }">
                                		<c:out value="${column}"/>
                                </c:if>
                                <c:if test="${column ==null }">
                                		&nbsp;
                                </c:if>
                        </td>
           </c:forEach>
        </tr>
     </c:forEach>
   </table>                  
</body>
</html>