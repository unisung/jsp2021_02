<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <%
       		String op1 = request.getParameter("op1");
            String cal = request.getParameter("cal");
            String op2 = request.getParameter("op2");
              switch(cal){
              case "+": out.print(Integer.parseInt(op1) + Integer.parseInt(op2)); break;
              case "-":  out.print(Integer.parseInt(op1)-Integer.parseInt(op2)); break;
              case "x": out.print(Integer.parseInt(op1)*Integer.parseInt(op2)); break;
              case "/": out.print(Integer.parseInt(op1)/Integer.parseInt(op2)); break;
              }
       %>
</body>
</html>