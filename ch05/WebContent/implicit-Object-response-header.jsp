<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addHeader(),setHeader(),getHeader()</title>
</head>
<body>
   <%=response.getHeader("Cache-control") %><br>
   <%=response.getHeader("contentType") %><br>
   <%=response.getHeader("date") %><br>
  <%    
           //응답객체의 헤드정보 추가 setHeader(), addHeader()
  			response.setHeader("Cache-control", "use_cache");
            response.addHeader("contentType","text/html; charset=utf-8");
            response.setDateHeader("date",1L);
  %>
  Cache-control : <%=response.getHeader("Cache-control") %><br>
  contentType : <%=response.getHeader("contentType") %><br>
  date : <%=response.getHeader("date") %><br>
  
</body>
</html>