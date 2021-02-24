<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form으로 부터 전송된 데이터 받기</title>
</head>
<body>
<%
         //html로 부터 넘어온 파라미터문자셋을 현재 페이지의 문자셋으로 설정
		 request.setCharacterEncoding("utf-8");

        String id=request.getParameter("id");
        String passwd=request.getParameter("passwd");
        String name=request.getParameter("name");
        String birthY=request.getParameter("year");
        String birthM=request.getParameter("month");
        String birthD=request.getParameter("date");
        String phone1 = request.getParameter("phone1");
        String phone2 = request.getParameter("phone2");
        String phone3 = request.getParameter("phone3");
        String sex = request.getParameter("sex");
        
        String[] hobby=request.getParameterValues("hobby");
        String comment=request.getParameter("comment");
%>
<p>아이디:<%=id %>
<p>비밀번호:<%=passwd %>
<p>이름:<%=name %>
<p>생년월일:<%=birthY %>-<%=birthM %>-<%=birthD %>
<p>성별:<%=sex %>
<p>연락처:<%=phone1 %>-<%=phone2 %>-<%=phone3 %>
<p>취미:<%=Arrays.toString(hobby) %>
<p>가입인사:<%=comment %>

</body>
</html>