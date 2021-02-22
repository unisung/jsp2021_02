<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Action Tag useBean</title>
</head>
<body>
<%-- useBean에서 선언한 id명을 스크립틀릿이나  표현식에서 사용 --%>
  <jsp:useBean id="person" 
         class="ch04.model.Person" 
         scope="request"/>
  
  <p>아이디:<%=person.getId() %>
  <p>이름:<%=person.getName() %>
  
</body> 
</html>