<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script>
function checkLogin(){
	var form=document.loginForm;//name이 "loginForm"이 폼 객체을 얻음.
	//아이디,비번 유효성 검사
	if(form.id.value==""){
		alert("아이디를 입력해주세요");
		form.id.focus();
		return;
	}else if(form.passwd.value==""){
		alert("비밀번호를 입력해주세요");
		form.passwd.focus();
		return;
	}
	
	form.submit();//<input type="submit">을 눌렀을 때와 동일한 기능 함.
}
</script>
</head>
<body>
      <form action="validation02_process.jsp" method="post" name="loginForm">
            <p> 아이디:<input name="id">
            <p>비밀번호:<input type="password" name="passwd">
            <p><input type="button" value="전송" onclick="checkLogin()">
      </form>

</body>
</html>