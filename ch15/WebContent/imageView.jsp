<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<% String id=request.getParameter("id"); %>
	<head><title>그림 보기</title></head>
	<body>
		<img src="blob_out.jsp?id=<%=id%>" ><br>
		<hr>
		<!-- <img src="../images/Koala.jpg"><br> -->
	</body>
</html>