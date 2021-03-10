<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>동일한 name을 가진 쿠키의 value값 수정하기</title>
</head>
<body>
    <%
          /* 
              쿠키의 값 변경 - 변경할 쿠키정보의 name이 동일한 객체를 
              새로운 value로 생성하여 클라이언트로 전달 
            */
            
           /* 1. 쿠키 정보 얻기  */
           Cookie[] cookies = request.getCookies();
    
          /* 2. 얻은 쿠키 배열은 순회하면서 동일한 name이 있는 쿠키 찾기*/
          for(Cookie cook:cookies){
        	    /* 3. value를 수정하려는 name과 동일한 쿠키가 있으면. */
        	    if(cook.getName().equals("name")){
        	    	/* 4. 동일한 name에 수정할 value값을 가진 새로운 쿠키 객체 생성 */
        	    	   Cookie cookie = new Cookie(cook.getName(),"김감자");
        	    	/* 5. 동일한 name가 수정할 value로 생성한 쿠키객체를 response에 실어서 클라이언트로 전송 */
        	    	   response.addCookie(cookie);
        	    }
          }
    %>
</body>
</html>