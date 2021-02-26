<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script>
    function checkForm(){
    	   if(document.frm.name.value==""){
    		   alert("이름을 입력하세요");
    		   return false;//유효성 검사 결과를 리턴
    	   }
    }
</script>
</head>
<body>
<form name="frm">
   <p>이름:<input name="name">
    <input type="submit" value="전송" onclick="return checkForm()">
    <%-- 함수 실행후 결과를 받아서 false 기본동작 금지, true이면 기본동작 실행 --%>
</form>
</body>
</html>