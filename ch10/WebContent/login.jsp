<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Security</title>
</head>
<body>
<%--  url패턴에 지정된 리소스로 접근시 자동으로 호출되어서 나타남 --%>
<%-- web.xml에서 <login-config>의 <auth-method>값을 FORM으로 변경후 사용가능  --%>
  <form  name="loginForm"  action="j_security_check" method="post">
    <p> 사용자명:<input type="text" name="j_username">
    <p> 비밀번호:<input type="password" name="j_password">
    <p><input type="submit" value="전송">
  </form>
</body>
</html>