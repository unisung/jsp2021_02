<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<!--  bootstrap 라이브러리 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>사진 등록</title>
</head>
<body>


   <form name="newProfile" action="./processAddImage.jsp" 
                        method="post"
                        enctype="multipart/form-data" >
      <div class="form-group row">
      		<label class="col-sm-2">id</label>
      		<div class="col-sm-3">
      			<input name="id" id="id"  class="form-control">
      		</div>
      </div>
      <div class="form-group row">
      		<label class="col-sm-2">name</label>
      		<div class="col-sm-3">
      			<input name="name" id="name" class="form-control">
      		</div>
      </div>
   
    <!--  이미지 등록 부분 추가  -->
    <div class="form-group row">
      		<label class="col-sm-2">profile사진</label>
      		<div class="col-sm-5">
      			<input type="file" name="profileImage" class="form-control">
      		</div>
    </div>
      
    
    <div class="form-group row">
      		<div class="col-sm-offset-2 col-sm-10">
      			<input type="submit" class="btn btn-primary" 
      			       value="등록" >
      		</div>
    </div>
    
   </form>
</div>
 
</body>
</html>