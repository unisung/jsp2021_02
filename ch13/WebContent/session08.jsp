<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
  <%
  			//세션 id 얻기
  			String session_id = session.getId();
  
          //요청 마지막 시각:
        	long last_time = session.getLastAccessedTime();
          
          //요청 시작 시각:
        	long start_time = session.getCreationTime();
          
          //경과 시간:
        	long used_time = (last_time - start_time)/60000;// /(1000 * 60) 분단위 출력
  
           out.print("세션 아이디 : " + session_id +"<br>");
           out.print("요청 시작 시각 : " + start_time + "<br>");
           out.print("요청 마지막 시각 : " +last_time + "<br>");
           out.print("웹 사이트의 경과 시간 : " + used_time +"<br>");
  %>
</body>
</html>