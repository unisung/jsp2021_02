<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File upload</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="fileupload02_process.jsp" >
           <p><label>이름1</label>:<input type="text" name="name1">
           <label>제목1</label>:<input type="text" name="subject1">
           <label>파일1</label>:<input type="file" name="fileName1">
           
           <p><label>이름2</label>:<input type="text" name="name2">
           <label>제목2</label>:<input type="text" name="subject2">
           <label>파일2</label>:<input type="file" name="fileName2">
           
           <p><label>이름3</label>:<input type="text" name="name3">
           <label>제목3</label>:<input type="text" name="subject3">
           <label>파일3</label>:<input type="file" name="fileName3">
           
           <p><input type="submit" value="submit">
</form>

</body>
</html>