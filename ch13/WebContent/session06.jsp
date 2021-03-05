<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
   <h4>------- 세션 삭제하기 전 --------</h4>
   <%
   			String user_id =(String)session.getAttribute("userID");
            String user_pw =(String)session.getAttribute("userPW");
            
            out.print("설정된 세션 이름 userID : " + user_id + "<br>");
            out.print("설정된 세션 이름 userPW : " + user_pw + "<br>");
            
            //세션정보가 valid여부 확인
            if(request.isRequestedSessionIdValid() == true){
            	  out.print("세션이 유효합니다.");
            }else {
            	out.print("세션이 유효하지 않습니다.");
            }
   %>
   <%-- 세션 정보 삭제 --%>
   <%
   			session.invalidate();
   %>
   <h4>------- 세션 삭제 후 -------</h4>
   <%
   			if(request.isRequestedSessionIdValid() == true){
   			 	out.print("세션이 유효합니다.");
   			}else{
   				out.print("세션이 유효하지 않습니다.");
   			}
   %>
   
</body>
</html>