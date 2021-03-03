<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Internalization</title>
</head>
<body>
<!--  로케일 지정 후 로케일에 맞게 메세지 출력 -->
<fmt:setLocale value="ko"/>
<p>------------fmt:bundle -------------------</p>
<fmt:bundle basename="ch09.com.bundle.myBundle">
  <p>제목: <fmt:message key="title" var="title"/>
                 ${title}
  <p><fmt:message key="username" var="userMsg"/>
         이름:${userMsg }
   <p><fmt:message var="pwd" key="password"/>
      패스워드:${pwd }

</fmt:bundle>
</body>
</html>