<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>쿠키생성 - value가 한글인 경우</title>
</head>
<body>
<%
           /*  쿠키 객체 생성  -한글이 깨져서 오류가 나는 경우 URLEncoder.encode(한글값,문자셋); */
			Cookie myCookie = new Cookie("name",URLEncoder.encode("홍길동","euc-kr"));

          /* 클라이언트에 저장  addCookie() */
           response.addCookie(myCookie);

%>
<p> 쿠키 이름:<%=myCookie.getName() %> 쿠키의 값 ="<%=myCookie.getValue() %>"
<p> decode 후 쿠키값 출력
<!-- encode() 된 값을 읽을 때 decode() 메소드로 읽음. decode(값, ecode()시 설정한 문자셋) -->
<p> 쿠키 이름:<%=myCookie.getName() %> 쿠키의 값 ="<%=URLDecoder.decode(myCookie.getValue(),"euc-kr") %>"
</body>
</html>