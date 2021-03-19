<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Board</title>
<link rel='stylesheet' href="./resources/css/bootstrap.min.css" />
</head>
<script>
function checkForm(){
	if(!document.newWrite.subject.value){
		alert("제목을 입력하세요");
		document.newWrite.subject.select();
		return false;
	}
	if(!document.newWrite.content.value){
		alert("내용을 입력하세요");
		document.newWrite.content.select();
		return false;
	}
	return true;
}
</script>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>
<div class="container">
		<form name="newWrite" action="./BoardWriteAction.do"
				  class="form-horizontal" 
				  method="post" onsubmit="return checkForm()" >
		<input name="id" type="hidden" value="${sessionId}">		  
		<div class="form-group row">
		     <label class="col-sm-2 control-label">성명</label>
		     <div class="col-sm-3">
		         <input name="name" class="form-control" value="${name}" readonly required>
		     </div>
		</div>		  
		<div class="form-group row">
		     <label class="col-sm-2 control-label">제목</label>
		     <div class="col-sm-3">
		         <input name="subject" class="form-control" placeholder="subject">
		     </div>
		</div>
		<div class="form-group row">
		     <label class="col-sm-2 control-label">내용</label>
		     <div class="col-sm-8">
		         <textarea rows="5" cols="50" name="content" 
		                       class="form-control" placeholder="content"></textarea>
		     </div>
		</div>
		<div class="form-group row">
		     <div class="col-sm-10 col-sm-offset-2">
		         <input type="submit" class="btn btn-primary" value="등록">
		         <input type="reset" class="btn btn-success" value="취소">
		     </div>
		</div>
		</form>
		<hr>
</div>
	<jsp:include page="../footer.jsp"/>

</body>
</html>