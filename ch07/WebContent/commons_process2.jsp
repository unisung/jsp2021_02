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
		//파일 저장경로 설정
		String fileUploadPath = "c:\\upload";
     
       //업로드 처리 객체 생성
       DiskFileUpload upload = new DiskFileUpload();//default생성
       
       //파일 업로드 최대 사이즈 설정
       upload.setSizeMax(1000000);
       //한번에 메모리에 저장할 사이즈 지정
       upload.setSizeThreshold(4096);
       //파일업로드 경로 설정
       upload.setRepositoryPath(fileUploadPath);
       
       //전송된 파라미터 추출하여 list에 저장
       List items = upload.parseRequest(request);//요청객체인 내장객체 request를 매개변수로 받아서 파라미터 추출
       
       //items로 부터 반복자를 이용하여 데이타 추출
       Iterator params = items.iterator();
       
       //반복처리
       while(params.hasNext()){
    	    FileItem item=(FileItem)params.next();
    	    if(item.isFormField()){//<input type='text' 데이타 전송된거면
    	    	String title = item.getString("utf-8"); //문자셋 설정
    	    	out.print("<h3>"+title+"</h3>");
    	    }else if(!item.isFormField()){//<input type='file' 데이타가 전송된거면
    	    	String fileName = item.getName();//파일명 얻기
    	    	//파일전체경로명에서 디렉토리 부분제외한 순수파일명 추출
    	    	fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
    	    	
    	    	//파일크기 얻기
    	    	long fileSize = item.getSize();
    	    	
    	    	//저장할 디렉토리와 파일명 합친 저장전체 경로명으로 파일객체 생성
    	    	File file = new File(fileUploadPath+"/"+fileName);
    	    	//파일시스템에 저장하기
    	    	item.write(file);
    	    	//저장완료 후 파일명 출력
    	    	out.print("------------------------<br>");
    	    	out.print("요청 파라미터 이름: "+item.getName()+"<br>");
    	    	out.print("저장 파일명:"+fileName+"<br>");
    	    	out.print("파일콘텐츠 유형:"+item.getContentType()+"<br>");
    	    	out.print("파일크기: "+fileSize);
    	    }
       }
%>
</body>
</html>