<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File upload- commons-IO 라이브러리사용 </title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="commons_process3.jsp" >
           <p><label>제목</label>:<input type="text" name="title"><!--  form태그 -->
           <p><label>파일</label>:<input type="file" name="fileName"><!-- file(스트림으로 전달) -->
           <p><input type="submit" value="submit">
</form>

</body>
</html>