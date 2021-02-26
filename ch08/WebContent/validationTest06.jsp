<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>유효성 검사-입력데이타 타입 검사</title>
<script>
function checkLogin(){
	var form=document.loginForm;//name이 "loginForm"이 폼 객체을 얻음.
	
	for(i=0;i<form.id.value.length;i++){
		var ch=form.id.value.charAt(i);//입력된 값을 하나씪 추출
		//유효성 체크
		if( (ch<'a' || ch>'z') && (ch>'A' || ch<'Z') && (ch>'0' || ch<'9')){
			 alert("아이디는 영문 소문자만 입력 가능합니다!");
			 form.id.select();
			 return;
		}
	}
	
	
	//아이디,비번 데이타 길이 유효성 검사
	if(form.id.value.length < 4  || form.id.value.length > 12){
		alert("아이디는 4~12자 이내로 입력 가능합니다.");
		form.id.focus();
		return;
	}else if(!isNaN(form.id.value.substr(0,1))){//문자,숫자여부확인
		alert("아이디는 숫자로 시작할 수 없습니다.");
		form.id.select();
		return;
	}	
	else if(form.passwd.value.length < 4){//입력값 길이 확인
		alert("비밀번호는 4자 이상으로 입력해야 합니다.");
		form.passwd.focus();
		return;
	}else if(isNaN(form.passwd.value)){//숫자여부 확인
		  alert("비밀번호는 숫자만 입력 가능합니다!");
		  form.passwd.select();
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