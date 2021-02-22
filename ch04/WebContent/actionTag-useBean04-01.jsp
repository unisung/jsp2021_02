<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActionTag useBean</title>
</head>
<body>
  <jsp:useBean id="person" 
              class="ch04.model.Person" scope="request"/>
              
<%-- <jsp:setProperty property="userId" name="person"/> --%>
  
 <%-- 파라미터로 넘어온 파라미터명과 Person객체의 속성명 id를 연계 처리, 타입변환 자동!!!!  --%>
<jsp:setProperty property="id" name="person" param="userId"/>
<%-- 파라미터명일 Person객체와 같으면 자동으로 값이 세팅됨  --%>
 <jsp:setProperty property="name" name="person" />

<%-- 자바코드와 비교 --%>
<%
      /// 파라미터를 person객체의 속성값으로 설정시 문법에 맞게 타입변환을 해줘야함. 
	    person.setId(Integer.parseInt(request.getParameter("userId")));
        person.setName(request.getParameter("name"));
%>


 <%=person.getId() %><br>
 <%=person.getName() %>


</body>
</html>