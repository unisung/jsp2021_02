<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script>
// test(), exec()
	 function checkForm(){
		 var regExp = /Java/i;/* 정규표현식 var regExp=new RegExp("Java","i");  */
		 var str=document.frm.title.value;
		 //var result=regExp.test(str);// 입력된 문자열 "Java Server Pages"에 "java"문자열 패턴이 있으면 true
		 //alert(result);
		 var result=regExp.exec(str);//패턴에 맞는 값 추출 ->배열로 추출
		 alert(result[0]);//패턴에 맞는 추출된 값 중 첫번째
	 }
</script>
</head>
<body>

  <form name="frm">
     <p>제목:<input type="text" name="title">
       <input type="submit" value="전송" onclick="checkForm()">
  </form>
</body>
</html>