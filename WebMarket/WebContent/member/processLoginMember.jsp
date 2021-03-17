<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
		request.setCharacterEncoding("utf-8");
        
        String id=request.getParameter("id");
        String password=request.getParameter("password");
%>
<sql:setDataSource var="dataSource"  url="jdbc:oracle:thin:@localhost:1521:xe" 
                             driver="oracle.jdbc.driver.OracleDriver"
                             user="jspbook"    password="jspbook" />

<sql:query dataSource="${dataSource}" var="resultSet">
            select * from webmember where id=? and password=?
           <sql:param value="<%=id %>"/>
           <sql:param value="<%=password %>"/>        
</sql:query>

<%-- id/ password가 맞는 경우 로그인 처리 결과 페이지로 이동  --%>
<c:forEach var="row" items="${resultSet.rows}">
      <%
      			session.setAttribute("sessionId", id);
      %>
      <c:redirect url="resultMember.jsp?msg=2"/>
</c:forEach>

<%-- id/password가 아닌 경우 다시 로그인 페이지로 이동(이동시, 오류결과를 전달함) --%>
<c:redirect url="loginMember.jsp?error=1" />
