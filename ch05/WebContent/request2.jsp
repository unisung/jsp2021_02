<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post로 데이터 전송</title>
</head>
<body>
  <form action='request01_process.jsp' method="post">
  			<p>아이디:<input name="name">
  			<p>비밀번호:<input name="passwd">
  			<input type='submit' value='전송'>
  </form>
</body>
</html>