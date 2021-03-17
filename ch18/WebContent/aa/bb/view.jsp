<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
        //forward되어서 온 현재 페이지에서 request로부터 message값을 추출
  		String msg = (String)request.getAttribute("message");
        out.print(msg);
  %>
</body>
</html>