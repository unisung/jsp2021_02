<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>requestEncoding</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<%-- request.setCharacterEncoding(문자셋)과 동일 --%>
요청파라미터:
<%
			out.print(request.getParameter("id"));
%>
<p><%=response.getLocale()%>

<!--  현재 페이지 자신에게 파라미터 전송하기 -->
<form  method="post">
  <p>아이디:<input name="id">
  <input type="submit" value="전송">
</form>
</body>
</html>