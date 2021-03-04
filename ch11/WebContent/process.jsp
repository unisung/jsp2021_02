<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
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