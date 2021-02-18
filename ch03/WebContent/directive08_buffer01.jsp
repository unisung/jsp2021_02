<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- 사용할 버퍼 사이즈 지정  --%>   
<%@ page buffer="16kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directive buffer</title>
</head>
<body>
   Today is: <%=new java.util.Date() %><br>
<%=out.getBufferSize() %><%-- 할당된 buffer사이즈 출력  --%>
</body>
</html>