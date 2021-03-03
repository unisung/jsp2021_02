<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Internalization</title>
</head>
<body>
<!--  로케일 지정 후 로케일에 맞게 메세지 출력 -->
<fmt:setLocale value="en"/>
<p>------------fmt:setBundle -------------------</p>
<fmt:setBundle basename="ch09.com.bundle.myBundle"  var="message"/>
  <p>제목: <fmt:message  bundle="${message}" key="title" />
  <p>이름:<fmt:message bundle="${message}" key="username"/>
   <p>패스워드:<fmt:message bundle="${message}" key="password"/>
</body>
</html>