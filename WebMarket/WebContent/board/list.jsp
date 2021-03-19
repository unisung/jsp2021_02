<%@page import="java.util.List"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head><meta charset="UTF-8">
<!-- bootstrap라이브러리 연결 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>BoardList</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
    <div class="jumbotron">
         <div class="container">
         		<h1 class="display-3">게시판</h1>
         </div>
       </div>
	<div class="container">
  <form action="<c:url value="./BoardListAction.do"/>" method="post">
  	<div>
  		<div class="text-right">
  			<span class="badge badge-success">전체 ${total_record}건</span>
  		</div>
  	</div>
  	<div style="padding-top:50px">
  	   <table class="table table-hover">
  	           <tr>
  	           		<th>번호</th>
  	           		<th>제목</th>
  	           		<th>작성일</th>
  	           		<th>조회</th>
  	           		<th>글쓴이</th>
  	           </tr>
  	           
  	           <!--  현재 페이지의 글 목록 -->
  	        <c:forEach var="notice"  items="${boardlist }">   
  	           <tr>
  	                 <td>${notice.num}</td>
  	                 <td><a href="./BoardViewAction.do?num=${notice.num}">${notice.subject}</a></td>
  	                 <td>${notice.register_day}</td>
  	                 <td>${notice.hit}</td>
  	                 <td>${notice.name}</td>
  	           </tr>
  	         </c:forEach>  
  	     </table>
  	   </div>
  	   
  		<!--  page navigation  -->
  	  <div align="center">
  	         <c:set var="pageNum" value="${pageNum}"/>
  	        <nav aria-label="...">
			  <ul class="pagination">
				   <li class="page-item disabled">
				    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
				   </li>
				   
	        <c:forEach var="i" begin="1" end="${total_page}">
				    <c:if test="${pageNum!=i}">
				       <li class="page-item"><a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">${i}</a></li>
				    </c:if>
				    <c:if test="${pageNum==i }">
				    	<li class="page-item active" aria-current="page"><a class="page-link" href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">${i}</a></li>
                    </c:if>
	          </c:forEach>
				    
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
            </ul>
        </nav>
    </div>

  	   <!-- 검색  -->        
  	   <div align="left">
  	        <table>
  	        	<tr>
  	        		<td width="100%" align="left">&nbsp;&nbsp;
  	        		 <select name="items" class="txt">
  	        		         <option value="subject">제목에서</option>
  	        		         <option value="content">본문에서</option>
  	        		         <option value="name">글쓴이에서</option>
  	        		 </select>
  	        		 <input name="text">
  	        		 <input type="submit" id="btnAdd" class="btn btn-primary" value="검색">
  	        	
  	        	 <td width="100%" align="right">
  	        	 		<a href="#" onclick="return checkForm();" class="btn btn-primary">&laquo;글쓰기</a>
  	        	 </td>
  	        	</tr>
  	        </table>
  	   </div>
  </form>

  </div>
</body>
</html>
<%-- <% 		session.setAttribute("sessionId", "hong"); %> --%>
<%--  ${속성(변수)==null}  --%>
<script>
function checkForm(){
  if(${sessionId==null}){ //로그인 전에 글쓰기 불가 처리,
	  alert("로그인 해주세요.");
	  return false;
  }else{ //로그인한 아이디로 글쓰기 폼으로 이동.
	  location.href="./BoardWriteForm.do?id=${sessionId}";//get방식으로 전달
  }	
}
</script>