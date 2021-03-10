<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 </title>
</head>
<body>
<%
		/* 쿠키 생성 */
		/*  Cookie 변수명 = new Cookie(이름,값); */
		Cookie cookie = new Cookie("name","value");
		cookie.setMaxAge(3);
		
		/* 클라이언트로 보내서 cookie저장소 저장하기 response.addCookie(쿠키명); */
        response.addCookie(cookie);
%>
</body>
</html>