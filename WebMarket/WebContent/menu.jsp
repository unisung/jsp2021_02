<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
        /*  모든 웹 페이지에서 세션정보 존재 여부 확인 하기 위해 menu.jsp에 추가 */
		String sessionId = (String) session.getAttribute("sessionId");
       /* 현재 jsp페이지의 정보 얻기- uri root경로 얻기 */
        String contextPath =getServletContext().getContextPath();
       /* 현재 jsp 페이지에서 사용하도록  pageContext에 속성으로 저장 */
        pageContext.setAttribute("contextPath", contextPath);
%>
 <nav class="navbar  navbar-expand navbar-dark bg-dark">
         <div>
         		<div>
         			<a  class="navbar-brand" href="${contextPath }/welcome.jsp">Home</a>
         	    </div>
         	    <div>
	         	     <ul class="navbar-nav mr-auto">		
	         			  <c:choose>
	         			  		<c:when test="${empty sessionId }"> <%-- ${sessionId==null} --%>
	         			  		  <li class="nav-item">
	         			  		   <a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
	         			  		  </li>
	         			  		  <li class="nav-item">
	         			  		   <a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원 가입</a>
	         			  		  </li>
	         			  		</c:when>
	         			        <c:otherwise><%-- ${not empty sessionId} --%>
	         			        <li style="padding-top:7px; color:white;">[<%=sessionId %>님]</li>
	         			         <li class="nav-item">
	         			  		   <a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
	         			  		  </li>
	         			  		  <li class="nav-item">
	         			  		   <a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a>
	         			  		  </li>
	         			  		  <li class="nav-item">
	         			  		   <a class="nav-link" href="<c:url value="/member/deleteMember.jsp?id=${sessionId}"/>">회원 탈퇴</a>
	         			  		  </li>
	         			        </c:otherwise>
	         			  </c:choose>
	         			
	         			<li class="nav-item">
	         				<a  class="nav-link" href="${contextPath}/products.jsp">상품목록</a>
	         			</li>
	         			<li class="nav-item">
	         			<a  class="nav-link" href="${contextPath}/addProduct.jsp">상품등록</a>
	         			</li>
	         			<li class="nav-item">
	         			<a  class="nav-link" href="${contextPath}/editProduct.jsp?edit=update">상품 수정</a>
	         			</li>
	         			<li class="nav-item">
	         			<a class="nav-link" href="${contextPath}/editProduct.jsp?edit=delete">상품 삭제</a>
	         			</li>
	         			<%-- 게시판 메뉴 --%>
	         			<li class="nav-item">
	         			<a class="nav-link" href="/BoardListAction.do?pageNum=1">게시판</a>
	         			</li>
	         		</ul>
         		</div>
         </div>
</nav>