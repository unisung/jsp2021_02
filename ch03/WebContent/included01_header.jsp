<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	  int pageCount=0;//전역변수
      void addCount(){//메소드
    	      pageCount++;
      }
%>
<%
   addCount();
%>
<p> 이 사이트 방문은 <%=pageCount%>번째 입니다.