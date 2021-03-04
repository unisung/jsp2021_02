<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Filter</title>
</head>
<body>
 <%
        request.setCharacterEncoding("utf-8");
 		 String name = request.getParameter("name");
        out.print(name.toUpperCase());
 %>
 <p>입력된 name 값:<%=name.toUpperCase() %>
</body>
</html>