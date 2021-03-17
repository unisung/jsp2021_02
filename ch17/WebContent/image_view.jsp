<%@ page  contentType="text/html; charset=UTF-8"%>
<html>
<%
      String id=request.getParameter("id");
%>
   <head>이미지 보기 </head>
   <body>
   		<img alt="" src="image_out.jsp?id=<%=id%>">
   </body>
</html>