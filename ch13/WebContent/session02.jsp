<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
  <%
            //최초 접속한 브라우저의 세션정보를 공유
  			String user_id=(String)session.getAttribute("userID");
            String user_pw=(String)session.getAttribute("userPW");
            
            out.print("설정됨 세션의 속성 값[1] :" +user_id+"<br>");
            out.print("설정된 세션의 속성 값[2] :" + user_pw);
  %>

</body>
</html>