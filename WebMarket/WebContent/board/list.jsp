<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  페이지번호:${pageNum }<br>
  페이지 수:${total_page}<br>
  전체 건수:${total_record}<br>
  
  <c:forEach var="board" items="${boardlist}" varStatus="seq">
       ${seq.count} : ${board.num }, ${board.subject}, ${board.name }, ${board.content } <br>
  </c:forEach>
  
  
</body>
</html>