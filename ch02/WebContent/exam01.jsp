<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  10 보다 큰 정수 하나를 입력받아서  1~ 입력 값까지의 짝수의 합을 리턴하는
         메소드를 선언하고, 표현식으로 결과를 출력하는 페이지를 작성하시요.
         * 메소드명 int evenSum(int i){}
         * evenSum(30)
          --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문(declaration), 표현식(expression)</title>
</head>
<body>
<%!
         
		int evenSum(int i){
	       int sum=0;
	     for(int j=1;j<=i;j++) 
	    	    if(j%2==0) sum+=j;
	     return sum;
}
%> 
<%
		out.println(evenSum(30));
%> 
<br>
<%=evenSum(30) %>
</body>
</html>