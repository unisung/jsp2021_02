<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<%
		//클라이언트의 요청정보에서 id,passwd 파라미터 값을 추출
       String user_id = request.getParameter("id");
       String user_pw=request.getParameter("passwd");
        
        //id,passwd확인 후 로그인 처리
        if("admin".equals(user_id) && "1234".equals(user_pw)){
        	//로그인 정보가 맞으면 세션에 id와 passwd정보를 저장
        	session.setAttribute("userID", user_id);
        	session.setAttribute("userPW", user_pw);
        	//처리 메세지
        	out.print("세션 설정이 성공했습니다<br>");
        	out.print(user_id+"님 환영합니다.");
           }else{
        	  out.print("세션 설정이 실패했습니다.<br>");
        }
%>

</body>
</html>