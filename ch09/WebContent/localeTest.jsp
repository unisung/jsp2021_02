<%@page import="java.util.Locale"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Localization</title>
</head>
<body>
<%
        //요청한 클라이언트의 로케일정보 얻기
		 Locale locale = request.getLocale();
       //지역 언어 정보
         String displayLanguage = locale.getDisplayLanguage();
         String language = locale.getLanguage();
         String displayCountry = locale.getDisplayCountry();
         String country = locale.getCountry();
%>
<%
		out.print("로케일 언어: "+displayLanguage+"<br>");
        out.print("로케일 언어 코드: "+language+"<br>");
        out.print("로케일 국가: "+displayCountry+"<br>");
        out.print("로케일 국가 코드: "+country+"<br>");
		
%>

</body>
</html>