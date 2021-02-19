<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - include</title>
</head>
<body>
    <h3>이 파일은 first파일입니다.</h3>
    <%-- page에서 실행된 결과를 현재페이지에 포함시키는 액션태그  --%>
    <jsp:include page="second.jsp"  flush="true"/><%-- xml 문법 --%>
</body>
</html>