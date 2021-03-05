<%@page import="ch13.dto.Member"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<%
       request.setCharacterEncoding("utf-8");

		//클라이언트의 요청정보에서 id,passwd 파라미터 값을 추출
       String user_id = request.getParameter("id");
       String user_pw=request.getParameter("passwd");
       String user_name = request.getParameter("name");
       String user_phone=request.getParameter("phone");
       
       
        //id,passwd확인 후 로그인 처리
        if("admin".equals(user_id) && "1234".equals(user_pw)){
        	//속성들을 하나로 묶은 객체 에 저장
        	  Member member = new Member();
        	  
        	//member의 속성에 값 설정, 개별 값들을 하나로 묶어서 처리
        	  member.setId(user_id);
        	  member.setPassword(user_pw);
        	  member.setName(user_name);
        	  member.setPhone(user_phone);
        	  
        	  //세션에 묶음단위로 저장
        	  session.setAttribute("MEMBER", member);
        	
        	//처리 메세지
        	out.print("세션 설정이 성공했습니다<br>");
        	out.print(user_id+"님 환영합니다.");
           }else{
        	  out.print("세션 설정이 실패했습니다.<br>");
        }
%>

</body>
</html>