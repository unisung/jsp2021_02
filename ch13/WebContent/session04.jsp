<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
  <%
            //세션 속성값 삭제 전  
            //최초 접속한 브라우저의 세션정보를 공유
  			String user_id=(String)session.getAttribute("userID");
            String user_pw=(String)session.getAttribute("userPW");
            
            out.print("------   세션 속성값 삭제 전   -----<br>");
            out.print("설정됨 세션의 속성 값[1] :" +user_id+"<br>");
            out.print("설정된 세션의 속성 값[2] :" + user_pw+"<br>");
            
  %>
  <%
           //세션 정보 삭제 removeAttribute(속성명);
  			session.removeAttribute("userID");		
  %>
<%
//세션 속성값 삭제 전  
//최초 접속한 브라우저의 세션정보를 공유
	 user_id=(String)session.getAttribute("userID");
     user_pw=(String)session.getAttribute("userPW");

out.print("------   세션 속성값 삭제 후   -----<br>");
out.print("설정됨 세션의 속성 값[1] :" +user_id+"<br>");
out.print("설정된 세션의 속성 값[2] :" + user_pw+"<br>");

%>

</body>
</html>