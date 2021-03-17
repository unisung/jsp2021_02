<%@page import="ch18.com.model.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/* 파라미터로 넘어온 파라미터 얻기 */
String id=request.getParameter("id");
String password=request.getParameter("passwd");

LoginBean bean=new LoginBean();
bean.setId(id);
bean.setPassword(password);

boolean status = bean.validate();


RequestDispatcher rd=null;
 if(status) {//status==true
         out.print("로그인 성공");
 }else {//status==false
	     out.print("로그인 실패");
 }
%>    
