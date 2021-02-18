<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 에러 처리 페이지로 선언 --%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>에러 전담페이지 </title>
</head>
<body>
   <h4> 에러가 발생하였습니다.</h4>
   <h5>exception 내장 객체 변수</h5>
 <%
 		///exception.printStackTrace(new PrintWriter(out));
       out.print(exception.getMessage());
 %>
</body>
</html>