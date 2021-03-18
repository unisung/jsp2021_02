<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>서블릿의 처리 결과 출력 페이지</title>
</head>
<body>
 <h4> urMVC.jsp</h4>
 <%-- 표현식(자바) --%>
 결과:<%=request.getAttribute("result") %>
 <hr>
 <%-- 표현언어(EL)  --%>
 ${result }
</body>
</html>