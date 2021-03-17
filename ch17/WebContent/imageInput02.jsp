<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%><%@page import="java.io.InputStream"%><%@page import="java.io.File"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	//이미지 정보 얻기
	File file = new File("c:/temp/lena.png");
	InputStream is = new FileInputStream(file);
	int fileSize =(int)file.length();
	
	 String sql = "insert into imgTest(id,img) values(?,?)";
     PreparedStatement pstmt = con.prepareStatement(sql);
     pstmt.setString(1,"lena");
     pstmt.setBinaryStream(2, is, fileSize);
     
     pstmt.executeUpdate();
     
     out.print("완료");
     
    
%>


</body>
</html>