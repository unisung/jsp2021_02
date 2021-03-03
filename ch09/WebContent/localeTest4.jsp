<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>통화, 숫자 포맷</title>
</head>
<body>
<%
		Locale locale = request.getLocale();
        NumberFormat currency=NumberFormat.getCurrencyInstance(locale);//통화포맷
        NumberFormat percentage=NumberFormat.getPercentInstance(locale);//% 포맷
        //세자리씩 끊기
        NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);// 숫자포맷
        
        //입력데이타를 포맷팅
        String fcurrency= currency.format(1234567);
        String fpercentage = percentage.format(0.25);
        
        String fnumber = numberFormat.format(123456.7);
%>
<p> 로케일의 통화 형식:<%=fcurrency %>
<p> 로케일의 비율 형식:<%=fpercentage %>
<p> 숫자:<%=fnumber %>

</body>
</html>