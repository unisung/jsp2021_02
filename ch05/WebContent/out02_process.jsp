<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <% request.setCharacterEncoding("utf-8"); %>

<%-- 표현식 --%>
아이디:<%=request.getParameter("name")%><br>
비번:<%=request.getParameter("passwd") %><br>
<br><br>
 <%-- out객체를 이용한 출력  --%>
<%
			out.print(request.getParameter("name")+"<br>");
            out.print(request.getParameter("passwd")+"<br>");
%>

</body>
</html>