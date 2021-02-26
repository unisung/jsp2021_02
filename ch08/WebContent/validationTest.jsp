<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>유효성 검사</title>
</head>
<body>
     <form name="frm">
               <p> 이름:<input name="name">
               <input type="submit" value="전송" onclick="chckForm()">
     </form>
</body>
</html>
<script>
function chckForm(){
	alert("이름은 "+document.frm.name.value +"입니다.");
	alert("이름은 "+document.forms[0].name.value +"입니다.");
}
</script>