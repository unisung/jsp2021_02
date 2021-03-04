<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Filter</title>
</head>
<body>
 <%
        request.setCharacterEncoding("utf-8");
 		 String id = request.getParameter("id");
 		String passwd = request.getParameter("passwd");
       
 %>
 <p>입력된 id 값:<%=id %>
 <p>입력된 pw 값:<%=passwd %>
</body>
</html>