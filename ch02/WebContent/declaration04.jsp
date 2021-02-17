<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>declaration tag</title>
</head>
<body>
<!-- 선언부:메소드나 전역변수 선언 부분 -->
<%! 
       //전역변수(맴버변수)
		int count=3;
      //메소드 선언
        String makeItLower(String data){
        	return data.toLowerCase();//함수내에서 다른 함수 호출
        }
%>

<!-- 스크립틀릿:자바코드 영역 -->
<%
      for(int i=0;i<=count;i++){//선언부에서 선언한 전역변수 사용
    	  out.print("Java Server Pages "+ i +"<br>");
      }
%>

<%
		out.println(makeItLower("Hello World"));//선언부에서 선언한 메소드 호출
%>
</body>
</html>