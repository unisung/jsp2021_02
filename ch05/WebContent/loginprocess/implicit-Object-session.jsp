<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("id");
		String password=request.getParameter("pass");
		
		//id가"관리자"이고 비번이"1234"이면 성공
		if(userid.equals("관리자") && password.equals("1234")){
			//session객체에 로그인정보를 담은 후 이동처리
			  session.setAttribute("id", userid);
			  response.sendRedirect("response01_success.jsp");
		}else
			 response.sendRedirect("response01_failed.jsp");

			
%>
</body>
</html>