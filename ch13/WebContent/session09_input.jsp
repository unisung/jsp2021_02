<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<form action="session09_process.jsp" 
          method="post">
   <p>아이디 : <input name="id">
   <p>비밀번호:<input type="password" 
                                 name="passwd">
   <p>이름:<input name="name">
   <p>전화번호:<input name="phone">
   <p><input type="submit" value ="전송">
</form>
</body>
</html>