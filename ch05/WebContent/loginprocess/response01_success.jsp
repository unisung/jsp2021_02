<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>내장객체 response.sendRedirect()</title>
</head>
<body>
        <%
        		String id=(String)session.getAttribute("id");
                if(id==null || id.equals("")){
                	 response.sendRedirect("response01_failed.jsp");
                }
        %>
        <h2>로그인을 성공했습니다.!!!</h2>
</body>
</html>