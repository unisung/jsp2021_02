<%@ page  contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title> 쿠키 </title>
</head>
<body>
<%
       /*  클라이언트의 form 정보의 파라미터 값 얻기 */
		String user_id = request.getParameter("id");
        String user_pw = request.getParameter("passwd");
        
        //아이디가 admin이고, 비번이 1234면 쿠키 생성하여 클라이언트에 저장
        if(user_id.equals("admin") && user_pw.equals("1234")){
        	//쿠키 생성
        	Cookie cookie_id = new Cookie("userID", user_id);
        	Cookie cookie_pw = new Cookie("userPW", user_pw);
        	//쿠키를 response객체에 실어서 브라우저로 전송
        	response.addCookie(cookie_id);
        	response.addCookie(cookie_pw);
        	
        	out.print("쿠키 생성이 성공했씁니다.<br>");
        	out.print(user_id + "님 환영합니다.<br>");
        }else{
        	out.print("쿠키 생성이 실패했습니다.");
        }
%>

</body>
</html>