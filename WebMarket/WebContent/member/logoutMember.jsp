<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	 /* 로그아웃 처리 */ 
     session.invalidate();
     /* 다시 로그인 할수 있도록 login페이지로 이동 */
     response.sendRedirect("loginMember.jsp");
%>