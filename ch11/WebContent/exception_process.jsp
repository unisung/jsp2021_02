<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<!--  directives에 설정한 예외처리 가 우선순위가 높음  -->
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        
        int c= num1/num2;
        		
		out.print(num1 + " / "+num2 +" = " + c)	;
%>

</body>
</html>
