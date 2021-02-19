<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 forward</title>
</head>
<body>
<%-- jsp에서 제공하는 태그, 서버의 동작을 제어하는 태그 --%>
   <h3>이 페지이는 f1.jsp페이지 입니다.</h3>
   <h3> A수퍼에는 콩나물이 없어요 </h3>
   <%-- 서버에게 f2.jsp로 요청(request)을 이동 시키라고 지시  --%>
   <jsp:forward page="f2.jsp"></jsp:forward>
   <p> -----이페지는 f1.jsp 페이지 -----</p>
</body>
</html>