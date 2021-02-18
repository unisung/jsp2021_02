<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action tag</title>
</head>
<body>
    <%-- 출력할 내용이 forward액션태그에 의해 삭제됨 - 출력안됨. --%>
    <h3> 이 파일은 first.jsp입니다. </h3>
    <%
           //reuqest에 저장하면 forward된 페이지로 전달됨. 
           //setAttribute(속성명,속성값(Object));
    		request.setAttribute("message", "이 파일은 first.jsp입니다.");
    %>
    
    <%-- 액션태그를 이용하여 요청을 second.jsp로 넘기기 --%>
    <jsp:forward page="second3.jsp"/>
    
    <%-- 위에서 다른 페이지로 이동 하므로 아래부분은 실행안됨. --%>
    <p>=== first.jsp의 페이지 === </p>   
</body>
</html>