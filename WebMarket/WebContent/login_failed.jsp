<%@ page contentType="text/html; charset=UTF-8"%>
<%
     //  login.jsp로 전달시 error=1이라는 쿼리스트링 파라미터을 같이 보냄.
	   response.sendRedirect("login.jsp?error=1");
%>
