<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="ft" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ft:parseNumber value="1,100.12" pattern="0,000.00" var="num"/>
  parse결과(0,000.00):${num }<p>
 
<ft:parseNumber value="1,100.12" pattern="#,###.##" var="num"/>
  parse결과(#,###.#):${num }<p> 
  
  <ft:parseNumber value="1,100.12" pattern="0,000.00" var="num" integerOnly="true"/>
  parse결과(integerOnly):${num }<p> 
  
  <!--  출력 -->
  <ft:formatNumber  var="fmtNum" value='${num}' pattern="0,000.00"/>
  천 단위 묶음 표시:${fmtNum }
  
</body>
</html>