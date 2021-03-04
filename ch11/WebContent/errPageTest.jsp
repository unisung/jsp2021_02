<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>디렉티브설정한 에러 페이지</title>
</head>
<body>
name 파라미터 값:<%=request.getParameter("name").toUpperCase() %>
</body>
</html>