<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
       String id = request.getParameter("id");
%>
<sql:setDataSource var="ds"  
                            url="jdbc:oracle:thin:@localhost:1521:xe" 
                            driver="oracle.jdbc.driver.OracleDriver"
                            user="jspbook"    
                            password="jspbook" />
                            
<sql:update dataSource="${ds}"  var="result" >
		delete from webmember where id=?
        <sql:param value="<%=id%>" />
</sql:update>       

<c:if test="${result>0 }">
	  <c:import url="logoutMember.jsp" var="url"/>
	  <c:redirect url="resultMember.jsp"/>
</c:if>
                    

