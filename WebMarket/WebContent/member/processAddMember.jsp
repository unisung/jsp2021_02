<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="dbconn.jsp" %>
<%
      /* 현재 페지이 문자셋에 맞게 설정 */
       request.setCharacterEncoding("utf-8");
       String savePath="c:/upload/profile/";
     //저장경로 설정
       String filename="";
     
       int maxSize = 5 * 1024 * 1024;
       String enctype="utf-8";
       
       //upload처리 객체 생성
       MultipartRequest multi=
          new MultipartRequest(request, savePath,maxSize, enctype, new DefaultFileRenamePolicy());

      /* 파라미터 값 얻기 */
      String id = multi.getParameter("id");
      String password = multi.getParameter("password");
      String name = multi.getParameter("name");
      String gender= multi.getParameter("gender");
      
      String year=multi.getParameter("birthyy");
      String month=multi.getParameter("birthmm");
      String day=multi.getParameter("birthdd");
      String birth=year + "/"+month+"/"+day;
      
      String mailId=multi.getParameter("email");
      String domain=multi.getParameter("domain");
      String email=mailId+"@"+domain;
      
      String phone1=multi.getParameter("phone1");
      String phone2=multi.getParameter("phone2");
      String phone3=multi.getParameter("phone3");
      String phone=phone1 + "-" + phone2+"-" +phone3;
      
      String postcode=multi.getParameter("postcode");
      String address=multi.getParameter("roadAddress");
      String addressDetail=multi.getParameter("detailAddress");
      String addressJibun=multi.getParameter("jibunAddress");
      String addressExtra=multi.getParameter("extraAddress");
      //등록일자 데이타 생성
      Date currentDatetime = new Date(System.currentTimeMillis());
      java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
      Timestamp timestamp = new Timestamp(currentDatetime.getTime());
      
      //업로드된 파일정보 얻기
      Enumeration files = multi.getFileNames();
      String fname = (String)files.nextElement();
      //12라인에서 선언한 String filename="";의 변수명을 사용하여 파일명을 받기
     filename = multi.getFilesystemName(fname);
    
%>
<p><%=id %><p><%=password %><p><%=name %><p><%=gender %><p><%=birth %>
<p><%=email %><p><%=phone %><p><%=postcode %><p><%=address %><p><%=addressDetail %>
<p><%=addressJibun %><p><%=addressExtra %><p><%=currentDatetime%><p><%=sqlDate%>
<p><%=timestamp%>

<sql:setDataSource var="dataSource"  url="jdbc:oracle:thin:@localhost:1521:xe" 
                             driver="oracle.jdbc.driver.OracleDriver"
                             user="jspbook"    password="jspbook" />
                             
<sql:update dataSource="${dataSource}" var="resultSet">
		insert into webMember(id, password, name, gender, birth, mail, phone, postcode, 
		                                 address,addressDetail,addressJibun,addressExtra,regist_day) 
		          values(?,?,?,?,?,?,?,?,?,?,?,?,?)
		<sql:param value="<%=id %>"/> 
		<sql:param value="<%=password %>"/> 
		<sql:param value="<%=name %>"/> 
		<sql:param value="<%=gender %>"/>                
		<sql:param value="<%=birth %>"/> 
		<sql:param value="<%=email %>"/> 
		<sql:param value="<%=phone %>"/> 
		<sql:param value="<%=postcode %>"/> 
		
		<sql:param value="<%=address %>"/> 
		<sql:param value="<%=addressDetail %>"/> 
		<sql:param value="<%=addressJibun %>"/> 
		<sql:param value="<%=addressExtra %>"/>                
		<sql:param value="<%=timestamp %>"/> 
</sql:update>


<%
		File file = new File(savePath+filename);
        InputStream is = new FileInputStream(file);
		int fileSize =(int)file.length();

	String sql = "update webmember set profile=? where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setBinaryStream(1, is, fileSize);//(index번호, inputStream, 파일사이즈);
	pstmt.setString(2,id);
	
	
	int result = pstmt.executeUpdate();
%>

<c:if test="${resultSet>=1}">
       <c:redirect url="resultMember.jsp?msg=1"/>
</c:if>




