<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Board</title>
<link rel='stylesheet' href="./resources/css/bootstrap.min.css" />
</head>

<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시글 상세</h1>
	</div>
</div>
<div class="container">
<form name="newWrite" 
	  action="./BoardUpdateAction.do?num=${num}&pageNum=${pageNum}&items=${items}&text=${text}"
				  class="form-horizontal" 
				  method="post" >
		<input name="id" type="hidden" value="${sessionId}">		  
		<div class="form-group row">
		     <label class="col-sm-2 control-label">성명</label>
		     <div class="col-sm-3">
		         <input name="name" class="form-control" value="${board.name}" readonly required>
		     </div>
		</div>		  
		<div class="form-group row">
		     <label class="col-sm-2 control-label">제목</label>
		     <div class="col-sm-3">
		         <input name="subject" class="form-control" value="${board.subject}">
		     </div>
		</div>
		<div class="form-group row">
		     <label class="col-sm-2 control-label">내용</label>
		     <div class="col-sm-8">
		         <textarea rows="5" cols="50" name="content" 
		                       class="form-control" placeholder="content">${board.content}</textarea>
		     </div>
		</div>
		<div class="form-group row">
		     <div class="col-sm-10 col-sm-offset-2">
		     <c:set var="userId" value="${board.id }"/>
		      <!--  게시글을 조회한 자가 작성자와 동일한 id면 삭제와 수정 권한 부여  -->
		     <c:if test="${sessionId==userId}">
		     	<p><a href="./BoardDeleteAction.do?num=${board.num}&pageNum=${pageNum}&items=${items}&text=${text}" class="btn btn-danger">삭제</a>
		             <input type="submit" class="btn btn-success" value="수정">
		     </c:if>    
		         <a href="./BoardListAction.do?pageNum=${pageNum}&items=${items}&text=${text}" class ="btn btn-primary">목록</a>
		     </p>
		     </div>
		</div>
		</form>
		<hr>
</div>
	<jsp:include page="../footer.jsp"/>

</body>
</html>