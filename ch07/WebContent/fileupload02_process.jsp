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
String name1=multi.getParameter("name1");
String subject1 = multi.getParameter("subject1");

String name2=multi.getParameter("name2");
String subject2 = multi.getParameter("subject2");

String name3=multi.getParameter("name3");
String subject3 = multi.getParameter("subject3");

//<input type='file'>인 경우
Enumeration files = multi.getFileNames();//파라미터로 전송된 파일 명들을 추출

String file1=(String)files.nextElement();//첫번째 파일명 얻기
String filename1=multi.getFilesystemName(file1);//서버에 저장된 파일명
String original1=multi.getOriginalFileName(file1);//파일의 원이름

String file2=(String)files.nextElement();//두 번째 파일명 얻기
String filename2=multi.getFilesystemName(file2);//서버에 저장된 파일명
String original2=multi.getOriginalFileName(file2);//파일의 원이름

String file3=(String)files.nextElement();//세 번째 파일명 얻기
String filename3=multi.getFilesystemName(file3);//서버에 저장된 파일명
String original3=multi.getOriginalFileName(file3);//파일의 원이름

%>
<table border=1>
   <tr><th width="100">이름</th><th width="100">제목</th><th width="100">원본파일명</th><th width="100">서버파일명</th>
   </tr>
   <%
       out.print("<tr><td>"+name1+"</td>");
	   out.print("<td>"+subject1+"</td>");
	   out.print("<td>"+filename1+"</td>");
	   out.print("<td>"+original1+"</td></tr>");
	   
	   out.print("<tr><td>"+name2+"</td>");
	   out.print("<td>"+subject2+"</td>");
	   out.print("<td>"+filename2+"</td>");
	   out.print("<td>"+original2+"</td></tr>");
   
	   out.print("<tr><td>"+name3+"</td>");
	   out.print("<td>"+subject3+"</td>");
	   out.print("<td>"+filename3+"</td>");
	   out.print("<td>"+original3+"</td></tr>");
	   
   %>
</table>

</body>
</html>