<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>ActionTag useBean-파라미터명과 속성명이 같을 때</title>
</head>
<body>
  <jsp:useBean id="person" 
              class="ch04.model.Person" scope="request"/>
              
  
<%-- 파라미터명일 Person객체와 같으면 자동으로 값이 세팅됨 
		 속성에 값 설정시  set+속성명으로 선언된 메소드가 호출되어 값이 세팅됨
 --%> 
 <jsp:setProperty property="id" name="person" />
<jsp:setProperty property="name" name="person" /> 

<%-- 자바코드와 비교 --%>
<%
      /// 파라미터를 person객체의 속성값으로 설정시 문법에 맞게 타입변환을 해줘야함. 
	 //   person.setId(Integer.parseInt(request.getParameter("id")));
     //   person.setName(request.getParameter("name"));
%>

<%-- 와일드카드문자 ('*')를 사용하여 한번에 파라미터값 설정 --%>
<%-- <jsp:setProperty property="*" name="person"/> --%>

 <%=person.getId() %><br>
  <%=person.getName() %>
<br>
<%-- 액션태그를 이용한 bean의 속성값 출력, get메소드 실행 --%>
<jsp:getProperty property="id" name="person"/>
<jsp:getProperty property="name" name="person"/>

<%-- 출력 시 getProperty 와일드카드문자(*) 오류 --%> 
 <%-- <jsp:getProperty property="*" name="person"/> --%>

</body>
</html>