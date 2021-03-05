<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<h4>-------------  세션 유효 시간 변경 전 -----------</h4>
<%
		int time = session.getMaxInactiveInterval()/60;//초/60 -> 분단위 
		out.print("세션 유효 시간 : " + time + "분<br>");
%>

<h4>-------------  세션 유효 시간 변경 후 -----------</h4>
<%
        //세션 유효 시간 재설정 
		 session.setMaxInactiveInterval(60*60);//60초 * 60 -> 60분 -> 1시간
		 
		 time = session.getMaxInactiveInterval() / 60 ;
		 out.print("세션 유효 시간 : " + time + "분<br>");
%>

</body>
</html>