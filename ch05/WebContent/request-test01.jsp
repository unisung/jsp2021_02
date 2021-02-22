<%@page import="java.util.Arrays"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.servlet.jsp.tagext.IterationTag"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String pwd=request.getParameter("pwd");
        //String hobby=request.getParameter("hobby");
        //동일 파라미터명에 두개이상의 다른값이 넘어올때는 배영로 받음.
        String hobby[]=request.getParameterValues("hobby");
 %>
 id:<%=id %><br>
 이름:<%=name %><br>
 비번:<%=pwd %><br>
  취미:
<% 
      for(int i=0;i<hobby.length;i++){
%>
<%=hobby[i] %>,
 <%} %>
 
 <hr>
 <%
           //파라미터로 넘어온 파라미터명들만 추출하는 메소드 
 			Enumeration params = request.getParameterNames();
 %>
 <%
             while(params.hasMoreElements()){
            	        String param=(String)params.nextElement();
            	  %> <%=param%>=<%=request.getParameter(param) %><br><%     
             }
 %>
 
 <hr>
 <%
           Map<String, String[]>paramMap=request.getParameterMap(); 
 %>
 <% 
        Set<String> keys =paramMap.keySet();
 
        Iterator<String> itor = keys.iterator();
        while(itor.hasNext()){
        	 String key=itor.next();
        	 out.print(key+"="+Arrays.toString(paramMap.get(key))+"<br>");
        }
 %>
 
</body>
</html>