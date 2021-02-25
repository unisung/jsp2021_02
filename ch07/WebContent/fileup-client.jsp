<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File upload</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="process.jsp" >
           <p><label>제목</label>:<input type="text" name="title">
           <p><label>파일</label>:<input type="file" name="fileName">
           <p><input type="submit" value="submit">
</form>

</body>
</html>