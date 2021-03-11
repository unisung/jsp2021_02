<%@page import="java.net.URLEncoder"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
  <%
  			/* 쿠키는 Cookie클래스로 생성 후, response객체에 실어서 브라우저로 보냄 */
  			Cookie cookie1 = new Cookie("id","hong"); //name이 id이고, value가 hong
  			//브라우저로 전송
  			response.addCookie(cookie1);
  %>
  <%
           /* 한글- ecode처리 */
  			Cookie cookie2 = new Cookie("name",URLEncoder.encode("홍길동"));
            response.addCookie(cookie2);
  %>
</body>
</html>