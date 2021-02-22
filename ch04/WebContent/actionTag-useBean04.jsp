<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
<%-- include나 forward한 페이지이 bean 아이디와, scope가 같으면 공유 --%>
 <jsp:useBean id="person"
         class="ch04.model.Person" 
          scope="request"/>
 
   <p>아이디:<%=person.getId() %></p>
   <p>이 름:<%=person.getName() %></p>
   
       <%-- 속성 값 변경 --%>
       <%
       			person.setId(20212005);
                person.setName("김길동");
       %>
       <jsp:include page="actionTag-useBean03.jsp"/>

</body>
</html>