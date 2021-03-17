<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  bootstrap 라이브러리 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
        <%@ include file="menu.jsp" %>

         <%! /* 선언부 */
         		 String greeting = "웹 쇼핑몰에 오신 것을 환영합니다." ;
         		 String tagline = "Welcome to Web Market!";
         %>
         <%-- 표현식  --%>
 <div class="jumbotron">
   <div class="conatiner">
	 <h1><%=greeting %></h1>
 </div>
 </div>
 <div class="container">
   <div class="text-center">
	 <h3><%=tagline %></h3>
     <%
           //response헤드 추가
           response.setIntHeader("Refresh", 1);
     
            /* Date객체 생성 */
     		 java.util.Date day = new java.util.Date();
             //오전/오후 변수
             String am_pm;
             //시각 변수
             int hour = day.getHours();
             //분 변수
             int minute = day.getMinutes();
             //초 변수
             int second = day.getSeconds();
             //오전/오후 확인
             if( hour / 12 == 0){//정수/정수 -> 정수
            	    am_pm="AM";
             }else{
            	   am_pm="PM";
             }
             //출력시간 문자열 생성
             String CT = hour + ":" + (Integer.toString(minute).length()==1?"0"+minute:minute) + ":" + second + " " + am_pm; 
             //현재 접속시각 출력
             out.print("현재 접속 시각:"+CT);
     %>
 </div>
 </div>
   <%@ include file ="footer.jsp" %>
</body>
</html>