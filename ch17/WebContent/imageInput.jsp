<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>이미지 입력</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%

     //이미지 정보 얻기
     File file = new File("c:/temp/lena.png");
     InputStream is = new FileInputStream(file);
     int fileSize =(int)file.length();
     
	  String sql = "insert into photoTest(id,name,photo) values(?,?,?)";
      PreparedStatement pstmt = con.prepareStatement(sql);
      pstmt.setString(1,"lena");
      pstmt.setString(2,"레나");
      pstmt.setBinaryStream(3, is, fileSize);//(index번호, inputStream, 파일사이즈);
      
      int result = pstmt.executeUpdate();
      if(result>1)
    	  out.print("입력완료");
      else
    	  out.print("입력실패");
%>
</body>
</html>