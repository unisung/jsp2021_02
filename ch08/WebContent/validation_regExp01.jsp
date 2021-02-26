<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>유형성검사 - 정규 표현식을 이용한 방법</title>
<script>
function checkForm(){
	//var regExp = /Java/i;	//정규표현식
	var regExp = new RegExp('java','i');//정규표현식 객체을 이용한 선언
	var str=document.frm.title.value;
	 var result=regExp.exec(str);//패턴에 맞는 값 추출
	 alert(result[0]);//exec()함수의 실행결과 맞는 패턴에 해당하는 값을 배열로 추출함.
}
</script>
</head>
<body>
    <form name="frm">
    	<p> 제목 : <input type="text" name="title">
    	 <input type="submit" value="전송" onclick="checkForm()">
    </form>
</body>
</html>