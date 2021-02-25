<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 //MultipartRequest()를 이용한 업로드 처리
 // 클라이언트로부터 서버로 파일이 제대로 전송되면, multipart객체가 제대로 생성됨
 MultipartRequest multi = new MultipartRequest(request, //request객체
				                                                          "c:\\upload", //저장위치
				                                                          5*1024*1024,//전송최대사이즈
				                                                          "utf-8", //문자셋 
				                                                           new DefaultFileRenamePolicy());//중복파일명 처리 객체
//전송된 데이타 분석
//<input type=text> 인 파라미터인 경우
String title = multi.getParameter("title");
out.print("<h3>"+title+"</h3>");

//<input type='file'>인 경우
Enumeration files = multi.getFileNames();//파라미터로 전송된 파일 명들을 추출
String name=(String)files.nextElement();//첫번째 파일명 얻기

String filename=multi.getFilesystemName(name);//서버에 저장된 파일명
String original=multi.getOriginalFileName(name);//파일의 원이름

  out.print("실제파일명: "+original+"<br>");
  out.print("저장 파일명: " + filename+"<br>");

%>

</body>
</html>