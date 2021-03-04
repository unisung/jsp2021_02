<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
<%
  try{
		int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        
        int c= num1/num2;
        		
		out.print(num1 + " / "+num2 +" = " + c)	;
		
  }catch(NumberFormatException e){
	  //forward처리 객체 생성
	  RequestDispatcher dispatcher = request.getRequestDispatcher("./error/trycatch_error.jsp");
	  //지정한 페이지로 forward
	  dispatcher.forward(request, response);
  }
%>

</body>
</html>