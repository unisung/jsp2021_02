<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>파일다운로드</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
        //파일업로드된 경로
        String root = getServletContext().getRealPath("/");
        String savePath=root+"upload";
        
        //서버에 실제 저장된 파일명
        String filename="Penguins.jpg";
        
        //실제 내보낼 파일명
        String orgfilename="펭귄.jpg";
        
         InputStream in =null;
         OutputStream os=null;
         File file=null;
         boolean skip=false;
         String client = "";
         
      try{
        	     //파일을 읽어서 스트림에 담기
        	  try{   
        	    file = new File(savePath, filename);
        	    in = new FileInputStream(file);
		       }catch(Exception e){
		        	  skip=true;//오류발생시 skip=true
		      }
         //Head정보 설정(explorer와 다른브라우저 구분용 )
         client = request.getHeader("User-Agent");
        // 파일 다운로드 헤더 지정
        response.reset() ;
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Description", "JSP Generated Data");
        
        //explorer와 다른브라우저구분하여 처리
         if(!skip){//오류가 안났으면.
        	  //IE
	        	if(client.indexOf("MSIE")!=-1){
	        		response.setHeader ("Content-Disposition", 
	        				                          "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
	        	}else{
	        		//한글 파일명 처리
	        		orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
	        		 
	                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
	                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	        	}     
                
                response.setHeader ("Content-Length", ""+file.length() );
                
                //아래 오류 처리를 위한 부분
                //java.lang.IllegalStateException: getOutputStream() has already been called for this response
                  out.clear();//스트림 비우기
                  out=pageContext.pushBody();//비운 스트림에 jsp페이지 정보 다시 저장하기.
                		
                	//다운로드 실행
                 os = response.getOutputStream();
                byte[] b=new byte[(int)file.length()];//다운로드할 파일 크기만큼의 버퍼 생성
                int leng=0;
                
                //다운로시 파일길이만큼 write처리
                while((leng=in.read(b))>0){
                	     os.write(b,0,leng);
                }
        }else{
        	response.setContentType("text/html;charset=UTF-8");
            out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
        }
        in.close();
        os.close(); 
        }catch(Exception e){
        	e.printStackTrace();
        }
%>
 <%-- <%=root%><br><%=savePath %><br> --%>
<%-- <%=client %><%=client.indexOf("MSIE") %> --%>

</body>
</html>