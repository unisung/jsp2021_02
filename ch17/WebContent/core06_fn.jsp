<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - functions</title>
</head>
<body>
 <p>java 서버 페이지
 <p> hello, Java ServerPages!=>${fn:contains("hello, Java ServerPages","Java") }
   ${fn:containsIgnoreCase("hello, Java ServerPages","java") }
  <p>${fn:endsWith("hello, Java ServerPages","ServerPages") }
  <p>Java의 index번호 : ${fn:indexOf("hello, Java ServerPages","Java") }
  
  <p>${fn:split('hello, Java ServerPages', " ")}
  <p>${fn:substring('hello, Java ServerPages',7,16) } <%-- substring(문자값, 시작index, 끝index) --%>
  <p>${fn:replace('hello, Java ServerPages','hello', 'hi!') }
</body>
</html>