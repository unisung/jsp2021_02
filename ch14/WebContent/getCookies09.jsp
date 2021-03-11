<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>쿠키 정보 얻기</title>
</head>
<body>
<%
		/* 쿠키는 request에 실려오므로 request.getCookies()메소드로 얻기 */
		Cookie[] cookies = request.getCookies();
       
        for(Cookie cook:cookies){
%>
<%-- 쿠키이름 getName() , 쿠키 값 getValue() --%>
<%=cook.getName() %>=<%=URLDecoder.decode(cook.getValue()) %><br>
<%
      /* 쿠키 값 수정 - name이 같은 쿠키의 값이 다른 쿠키객체를 새로 생성하여 브라우저로 전달 */
       if(cook.getName().equals("name")){
    	   response.addCookie(new Cookie(cook.getName(),URLEncoder.encode("임꺽정")));
       }
      /* 쿠키 값 삭제 */
       if(cook.getName().equals("id")){
    	   cook.setMaxAge(0);//즉시 삭제는 유효시간을 0으로 지정
    	   response.addCookie(cook);
       }
        } %>
</body>
</html>