<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원정보 입력처리 </title>
</head>
<body>
   <%@ include file="dbconn.jsp" %> 
   <%
         /* 파라미터로 넘어온 한글 깨짐 방지 처리 */
   		 request.setCharacterEncoding("utf-8");
         
         String id=request.getParameter("id");
         String passwd=request.getParameter("passwd");
         String name=request.getParameter("name");
         
         /* db에 저장 */
         /* 쿼리객체 생성 */
         Statement stmt=null;
         try{
        	 String sql="insert into member values("+id+",'"+name+"','"+passwd+"')";
        	 stmt=con.createStatement();
        	 stmt.executeUpdate(sql);
        	 out.print("Member 테이블에 삽입 성공했습니다.");
         }catch(Exception e){
        	 out.print("Member 테이블에 삽입 실패했습니다.");
        	 out.print("SQLException: "+e.getMessage());
         }finally{
        	 if(stmt !=null) stmt.close();
        	 if(con !=null) con.close();
         }
   %>
   
</body>
</html>