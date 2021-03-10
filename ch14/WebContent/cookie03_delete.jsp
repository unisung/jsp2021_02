<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
<%
            /* 1. 쿠키 객체 얻기 */
			Cookie[] cookies = request.getCookies();

           /* 2. 얻은 쿠키배열을 순회하면서 */
            for(Cookie cook: cookies){
            	 /* 3. 각 쿠키의 유효기간을 0으로 처리 */
            	   cook.setMaxAge(0);
            	 /* 4. 유효기간 0으로 설정 후 바로 클라이언트로 전송 */
            	   response.addCookie(cook);
            }
              /* 삭제후 결과 보기 */
            response.sendRedirect("getCookiesTest01.jsp");
%>

</body>
</html>