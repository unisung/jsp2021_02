<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
      /* 현재 페지이 문자셋에 맞게 설정 */
       request.setCharacterEncoding("utf-8");
       
      /* 파라미터 값 얻기 */
      String id = request.getParameter("id");
      String password = request.getParameter("password");
      String name = request.getParameter("name");
      String gender= request.getParameter("gender");
      
      String year=request.getParameter("birthyy");
      String month=request.getParameter("birthmm");
      String day=request.getParameter("birthdd");
      String birth=year + "/"+month+"/"+day;
      
      String mailId=request.getParameter("email");
      String domain=request.getParameter("domain");
      String email=mailId+"@"+domain;
      
      String phone1=request.getParameter("phone1");
      String phone2=request.getParameter("phone2");
      String phone3=request.getParameter("phone3");
      String phone=phone1 + "-" + phone2+"-" +phone3;
      
      String postcode=request.getParameter("postcode");
      String address=request.getParameter("roadAddress");
      String addressDetail=request.getParameter("detailAddress");
      String addressJibun=request.getParameter("jibunAddress");
      String addressExtra=request.getParameter("extraAddress");
      //등록일자 데이타 생성
      Date currentDatetime = new Date(System.currentTimeMillis());
      java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
      Timestamp timestamp = new Timestamp(currentDatetime.getTime());
      
%>
<p><%=id %><p><%=password %><p><%=name %><p><%=gender %><p><%=birth %>
<p><%=email %><p><%=phone %><p><%=postcode %><p><%=address %><p><%=addressDetail %>
<p><%=addressJibun %><p><%=addressExtra %><p><%=currentDatetime%><p><%=sqlDate%>
<p><%=timestamp%>

<sql:setDataSource var="dataSource"  url="jdbc:oracle:thin:@localhost:1521:xe" 
                             driver="oracle.jdbc.driver.OracleDriver"
                             user="jspbook"    password="jspbook" />
                             
<sql:update dataSource="${dataSource}" var="resultSet">
		insert into webMember(id, password, name, gender, birth, mail, phone, postcode, 
		                                 address,addressDetail,addressJibun,addressExtra,regist_day) 
		          values(?,?,?,?,?,?,?,?,?,?,?,?,?)
		<sql:param value="<%=id %>"/> 
		<sql:param value="<%=password %>"/> 
		<sql:param value="<%=name %>"/> 
		<sql:param value="<%=gender %>"/>                
		<sql:param value="<%=birth %>"/> 
		<sql:param value="<%=email %>"/> 
		<sql:param value="<%=phone %>"/> 
		<sql:param value="<%=postcode %>"/> 
		
		<sql:param value="<%=address %>"/> 
		<sql:param value="<%=addressDetail %>"/> 
		<sql:param value="<%=addressJibun %>"/> 
		<sql:param value="<%=addressExtra %>"/>                
		<sql:param value="<%=timestamp %>"/> 
</sql:update>

<c:if test="${resultSet>=1}">
       <c:redirect url="resultMember.jsp?msg=1"/>
</c:if>




