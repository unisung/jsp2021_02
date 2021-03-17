<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html><html><head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>

<% 
       /* 세션으로 부터 로그인 한 id를 얻기 */
      String sessionId = (String) session.getAttribute("sessionId"); 
%>
  <sql:setDataSource var="dataSource"  url="jdbc:oracle:thin:@localhost:1521:xe" 
                             driver="oracle.jdbc.driver.OracleDriver"
                             user="jspbook"    password="jspbook" />                           
<%-- id에 해당하는 정보 출력 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
     select id, password, name, gender, birth, mail, phone, postcode, address,
              addressDetail, addressJibun, addressExtra, regist_day 
	   from webmember where id=?
	   <sql:param value="<%=sessionId%>"/>
</sql:query>

<meta charset="UTF-8">
<title>회원수정</title>
</head>
<script>
function retireMember(id){
	if(confirm("정말 탈퇴하시겠습니까?")){
		location.href="deleteMember.jsp?id="+id;
	}else{
		return;
	}
}
</script>
<script>
function selectValue(obj){
	var value=obj.options[obj.selectedIndex].value;

	 if(value=="직접입력")
		 document.newMember.domain.value="";
	 else
	 document.newMember.domain.value=value;
}
</script>
<script>
function checkMember(){
	//유효성 검정용 정규표현식 선언
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//영문대 소문자, 한글인지 체크
	var regExpName=/^[가-힣]*$/;//한글인지 체크
	var regExpPasswd=/^[0-9]*$/;//숫자로만 구성되어있는지 체크
	var regExpPhone=/^\d{3}-\d{3,4}-\d{4}$/;//숫자로 시작해서 숫자로 끝나는지 
	var regExpEmail=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;//이메일체크
	
	var form = document.newMember;
	
	var id=form.id.value;
	var name=form.name.value;
	var passwd=form.password.value;
	var password_confirm=form.password_confirm.value;
	var phone=form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
	var email=form.email.value+"@"+form.domain.value;
	
	//유효성 검증 
	//id 유효성 검증
	if(!regExpId.test(id)){
		alert("아이디는 문자로 시작해주세요");
		form.id.select();
		return;
	}
	//이름 비교(한글만)
	if(!regExpName.test(name)){
		alert("이름은 한글만 입력해주세요");
		form.name.value="";
		form.name.focus();
		return;
	}
	//비밀번호 비교(숫자만)
	if(!regExpPasswd.test(passwd)){
		alert("비밀번호는 숫자만 입력해주세요!");
		form.passwd.value="";
		form.passwd.focus();
		return;
	}
	if(passwd !=password_confirm){
		alert("비밀번호와 비밀번호 확인 입력값이 서로 다릅니다.");
		form.password.value="";
		form.password_confirm.value="";
		form.password.focus();
		return;
	}
	
	//전화번호 비교(숫자 갯수 비교)
	if(!regExpPhone.test(phone)){
		alert("연락처 입력을 확인해주세요.");
		return;
	}
	//email 비교
	if(!regExpEmail.test(email)){
		alert("이메일 입력을 확인해 주세요.");
		return;
	}
	
	//form을 action페이지로 전송
	form.submit();
}
</script>
<body>
<jsp:include page="/menu.jsp"/><%-- webContext root(/) 바로 밑의 menu.jsp 인클루드 --%>
<div class="jumbotron">
	<div class="container">
			<h1 class="display-3">회원 수정</h1>
	</div>
</div>
<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mail }"/>
	<c:set var="mail1" value="${mail.split('@')[0] }"/>
	<c:set var="mail2" value="${mail.split('@')[1] }"/>
	
	<c:set var="birth" value="${row.birth}"/>
	<c:set var="year"  value="${birth.split('/')[0]}"/>
	<c:set var="month"  value="${birth.split('/')[1]}"/>
	<c:set var="day"  value="${birth.split('/')[2]}"/>
	
	<c:set var="phone" value="${row.phone }"/>
	<c:set var="phone1" value="${phone.split('-')[0] }"/>
	<c:set var="phone2" value="${phone.split('-')[1] }"/>
	<c:set var="phone3" value="${phone.split('-')[2] }"/>

<div class="container">
     <form name="newMember" class="form-horizontal" 
              action="processUpdateMember.jsp" 
              method="post" 
              enctype="multipart/form-data" >
          <div class="form-group row">
          		<label class="col-sm-3">아이디</label>
             	  <div class="col-sm-4">	
	          		<input name="id" class="form-control" placeholder="id" 
	          		             value="<c:out value='${row.id}'/>"  readonly="readonly">
                  </div>
          </div>
	     <div class="form-group row">
	          		<label class="col-sm-3">비밀번호</label>
	          		<div class="col-sm-3">
	          		   <input type="password" name="password" class="form-control" placeholder="password" value="<c:out value='${row.password}'/>">
	     			</div>
	     </div>
	     <div class="form-group row">
	          		<label class="col-sm-3">비밀번호확인</label>
	          		<div class="col-sm-3">
	          		  <input type="password" name="password_confirm" class="form-control" placeholder="password">
	                </div>
	     </div>
	     <div class="form-group row">
	          		<label class="col-sm-3">성명</label>
	          		<div class="col-sm-3">
	          		  <input name="name" class="form-control" placeholder="name" value="<c:out value='${row.name}'/>">
	                </div>
	     </div>
	       <div class="form-group row">
	          		<label class="col-sm-3">성별</label>
	          		<div class="col-sm-3">
	          		   <c:set var="gender" value="${row.gender}"/>
	          		    <label><input type="radio" name="gender" value="남" 
	          		                   <c:if test="${gender.equals('남')}"><c:out value="checked"/></c:if>>남성</label>
				        <label><input	type="radio" name="gender" value="여" 
				                       <c:if test="${gender.equals('여')}"><c:out value="checked"/></c:if>>여성</label>
	                </div>
	     </div>
	     
	     <div class="form-group row">
	          		<label class="col-sm-3">생일</label>
	          		<div class="col-sm-3">
	          		    <select name="birthyy" class="form-control">
<%
	                   Calendar cal = Calendar.getInstance();
		%>
 <c:set var="yearBegin" value="<%=cal.get(Calendar.YEAR)-60 %>"/>	
 <c:set var="yearEnd" value="<%=cal.get(Calendar.YEAR)-10 %>"/>	
 <c:forEach var="yy" begin="${yearBegin }" end="${yearEnd }">   		    
   <option value="${yy}" <c:if test='${year==yy}'>selected</c:if>>${yy}</option>
 </c:forEach>
</select>

<select name="birthmm" class="form-control">
<c:forEach var="mm" begin="1" end="12">   		    
   <option value="<c:if test="${mm<10}">0${mm}</c:if><c:if test="${mm>=10}">${mm}</c:if>" 
          <c:if test='${month==mm}'>selected</c:if>>
          <c:if test="${mm<10}">0${mm}</c:if><c:if test="${mm>=10}">${mm}</c:if>
          </option>
 </c:forEach>
</select>

<select name="birthdd" class="form-control">
<c:forEach var="dd" begin="1" end="31">   		    
   <option value="<c:if test="${dd<10}">0${dd}</c:if><c:if test="${dd>=10}">${dd}</c:if>" 
              <c:if test='${dd==day}'>selected</c:if>>
   <c:if test="${dd<10}">0${dd}</c:if><c:if test="${dd>=10}">${dd}</c:if>
   </option>
 </c:forEach>
</select>

	           </div><%-- 년월일 끝. --%>	     
	     </div><%-- 년월일 끝. --%>
	     
	     <%
				List<String> domains=Arrays.asList("직접입력","naver.com","daum.net","google.com","seoulit.ac.kr");
		%>
		<div class="form-group row">
	          		<label class="col-sm-3">이메일</label>
	          		<div class="col-xs-8">
	          		  <input name="email" class="form-control" value="${mail1}">
	          		  @<input name="domain" class="form-control" value="${mail2}"><select  onchange="selectValue(this)" class="form-control">
						     <% for(String domain:domains){
						    	 		  out.print("<option value='"+domain+"'>"+domain+"</option>");
						     }
						    	 %>
							</select>	
	                </div>
	     </div>	<%-- 이메일 끝. --%>    
	      
	     <div class="form-group row">
	          		<label class="col-sm-3">전화번호</label>
	          		<div class="col-sm-7">
	          		  
	          		  
	          		  <select name="phone1" class="form-control">
		                   <option value="010" <c:if test="${'010'==phone1}">selected</c:if>>010</option>
		                   <option value="011" <c:if test="${'011'==phone1}">selected</c:if>>011</option>
		                   <option value="016" <c:if test="${'016'==phone1}">selected</c:if>>016</option>
		                   <option value="017" <c:if test="${'017'==phone1}">selected</c:if>>017</option>
		                   <option value="019" <c:if test="${'019'==phone1}">selected</c:if>>019</option>
		                 </select>
		                 
		                 
				      - <input type="text" maxlength="4" size="4" name="phone2" class="form-control" value="${phone2}"> 
				      - <input type="text" maxlength="4" size="4" name="phone3" class="form-control" value="${phone3}">
	                </div>
	     </div>
     
        <div class="form-group row">
	          		<label class="col-sm-3">우편번호</label>
	          		<div class="col-sm-3">
	          		  <input type="text" id="postcode" name="postcode" 
	          		                        placeholder="우편번호" class="form-control" value="${row.postcode }">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" >
	                </div>
	     </div>
	     <div class="form-group row">
	     			<label class="col-sm-3">도로명주소</label>
	          			<div class="col-sm-8">
	          		  		<input type="text" id="roadAddress"  name="roadAddress" 
	          		  		                  placeholder="도로명주소" class="form-control" value="${row.address}" >
	                	</div>
	     </div>
	     <div class="form-group row">
	     			<label class="col-sm-3">지번주소</label>
	          			<div class="col-sm-8">
	          		  		<input type="text" id="jibunAddress" name="jibunAddress" 
	          		  		                  placeholder="지번주소" class="form-control" value="${row.addressJibun}" >
	                	</div>
	     </div>
     	<div class="form-group row">
	     			<label class="col-sm-3">상세주소</label>
	          			<div class="col-sm-8">
	          			    <span id="guide" style="color:#999;display:none"></span>
	          		  		<input type="text" id="detailAddress" name="detailAddress" 
	          		  						placeholder="상세주소" class="form-control" value="${row.addressDetail }">
	                	</div>
	     </div>
	     <div class="form-group row">
	     			<label class="col-sm-3">참고주소</label>
	          			<div class="col-sm-8">
	          		  		<input type="text" id="extraAddress" name="extraAddress" 
	          		  		                  placeholder="참고항목" class="form-control" value="${row.addressExtra }">
	                	</div>
	     </div>
	     <div class="form-group row">
	     			<label class="col-sm-3">프로필사진</label>
	          			<div class="col-sm-8">
	          		  		<input type="file" id="photo" name="photo" class="form-control">
	          		  		<div class="col-md-5" >
	          		  		<img alt="image" style="width:100%;object-fit:fill;" id="newImg"  src="photo_out.jsp?id=${row.id}">
     	                   </div>
	          		  		
	                	</div>
	     </div>
     <div class="form-group row">
	          			<div class="col-sm-10 col-sm-offset-2">
	          		  		<input type="button" value="수정하기" onclick="checkMember()" class="btn btn-primary"> 
			                <input type="reset"	value="다시쓰기" class="btn btn-success">
			                <input type="button" value="회원탈퇴" onclick="retireMember('${row.id}')" class="btn btn-danger"> 
	                	</div>
	     </div>
     </form>


</div>
 </c:forEach><%-- 반복문 끝. --%>
</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>