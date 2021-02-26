<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>유형성검사 - 정규 표현식을 이용한 방법</title>
<script>
function checkForm(){
	//정규표현식을 이용한 유효성 검사
	var str=document.frm.name.value;
	var regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//규칙
	if(!regExp.test(str)){
		alert("이름은 숫자로 시작할 수 없습니다.");
		return;
	}
}
</script>
</head>
<body>
    <form name="frm">
    	<p> 제목 : <input type="text" name="name">
    	 <input type="submit" value="전송" onclick="checkForm()">
    </form>
</body>
</html>