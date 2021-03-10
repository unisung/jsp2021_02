<%@page import="java.net.URLDecoder"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>클라언트로 부터 쿠키정보 얻기</title>
</head>
<body>
  sessionId: <%=session.getId() %><br>

  <%
            /* 클라이언트로 부터 전달된 모든 쿠키를 얻기 request.getCookies() */
            Cookie[] cookies = request.getCookies();
           
             /* 쿠키 목록 출력 */
             if( cookies != null && cookies.length >0 ){
            	 for(int i=0;i<cookies.length;i++){
            %>
            <%-- 쿠키이름: getName(), 쿠키값 : getValue() --%>
              <%=cookies[i].getName() %> = <%=URLDecoder.decode(cookies[i].getValue(),"euc-kr") %><br>		 
            <%		 
                 //서버의 sessionId(getId())값과 클라이언트의 쿠키의 JSESSIONID값은 같다.
                  if(cookies[i].getName().equals("JSESSIONID")){// sessionId와 
                	   out.print(session.getId().equals(cookies[i].getValue())+"<br>");
                  }
            	 }
             }else{
            %>	 
            	 쿠키가 존재 하지 않습니다.
             <%
             }
  %>
</body>
</html>