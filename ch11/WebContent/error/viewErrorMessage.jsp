<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 에러 처리 페이지 </title>
</head>
<body>
  요청과정에서 예외가 발생하였습니다 <br>
  빠른시간내에 문제를 해결하도록 하겠습니다.
 <p>
 에러 타입:<%=exception.getClass().getName() %><br>
 에러 메시지:<%=exception.getMessage() %>

</body>
</html>