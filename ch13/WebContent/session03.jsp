<%@page import="java.util.Enumeration"%>
<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<%
			String name;
            String value;
            
            //session에 저장된 속성명들 추출
            Enumeration en=session.getAttributeNames();
            int i=0;
            
            while(en.hasMoreElements()){
            	i++;
            	name = en.nextElement().toString();
            	value = session.getAttribute(name).toString();
            	//속성 이름=값 출력
            	out.print("설정된 세션의 속성 이름 ["+i+"]: "+ name +"<br>");
            	out.print("설정된 세션의 속성  값  ["+i+"]: "+ value +"<br>");
            	
            }
            

%>
</body>
</html>