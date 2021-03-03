<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>commons-io를 이용한 파일업로드 처리</title>
</head>
<body>
<%
      String fileUploadPath="c:\\upload";
      //파일 업로드 객체 생성
      DiskFileUpload upload = new DiskFileUpload();
      //request로 넘어온 파라미터들을 리스트로 저장
      List items=upload.parseRequest(request);
      //반복자 생성
      Iterator params = items.iterator();
      
      //반복처리작업
      while(params.hasNext()){
    	  FileItem item=(FileItem)params.next();
    	  if(item.isFormField()){//<input type="text">값이면
    		  String title=item.getString("utf-8");//utf-8문자셋 설정
    	      out.print("<h3>"+title+"</h3>");
    	      System.out.println("파라미터:"+title);
    	  }else if(!item.isFormField()){//<input type="file">값이면
    		  String fileName=item.getName();
    	  fileName=fileName.substring(fileName.lastIndexOf("\\")+1);//전체파일경로에서 디렉토리 제외한 순수파일명
    	  File file=new File(fileUploadPath+"/"+fileName);
    	  //c:\\upload\\에 파일명으로 저장
    	  item.write(file);
    	  out.print("파일이름: "+fileName+"<br>");
    	  }
      }
%>
</body>
</html>