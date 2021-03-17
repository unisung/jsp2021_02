<%@ page contentType="text/html; charset=UTF-8"%>
<%
       //서버와의 연결정보를 모두 제거함.
		session.invalidate();
       //addProduct.jsp로 보냄 -> addProduct.jsp로 이동시 로그인창이 자동으로 나타남.
       response.sendRedirect("addProduct.jsp");
%>