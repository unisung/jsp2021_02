<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>select</title>
</head>

<script>
function checkMember(){
	//유효성 검정용 정규표현식 선언
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;//영문대 소문자, 한글인지 체크
	var regExpName=/^[가-힣]*$/;//한글인지 체크
	var regExpPasswd=/^[0-9]*$/;//숫자로만 구성되어있는지 체크
	var regExpPhone=/^\d{3}-\d{3,4}-\d{4}$/;//숫자로 시작해서 숫자로 끝나는지 
	var regExpEmail=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;//이메일체크
	
	var form = document.member;
	
	var id=form.id.value;
	var name=form.name.value;
	var passwd=form.passwd.value;
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
<h3>회원가입</h3>
	<form action="validation05_process.jsp" name="member" method="post">
		<p>아이디 : <input type="text" name="id"> <input type="button" value="아이디 중복검사">
		<p>비밀번호 : <input type="password" name="passwd">
		<p>이름 : <input type="text" name="name">
		<!-- 생년월일 선택 select,  -->
		<%
	                   Calendar cal = Calendar.getInstance();
		%>
		<%-- <%=cal.get(Calendar.YEAR)-60%>,<%=cal.get(Calendar.MONTH)+1 %>,<%=cal.get(Calendar.DAY_OF_MONTH) %>
		,<%=cal.getMaximum(Calendar.DAY_OF_MONTH) %>,
		<%=cal.getActualMaximum(Calendar.DAY_OF_MONTH) %> --%>
		<p>생년월일: <select name="year">
<%
 for(int y=(cal.get(Calendar.YEAR)-60);y<=(cal.get(Calendar.YEAR)-10);y++){
		 if(y==1980)
		   out.print("<option value="+y+" 'checked=checked' >"+y+"</option>");
		else
		   out.print("<option value="+y+">"+y+"</option>");
}
 %>
</select>
<select name="month">
<%
		for(int i=1;i<=12;i++){
		      out.print("<option value="+(String.valueOf(i).length()==1?"0"+String.valueOf(i):String.valueOf(i))+">"
		                    +(String.valueOf(i).length()==1?"0"+String.valueOf(i):String.valueOf(i))+"</option>");
		       }
%>
</select>
<select name="date">
	<%
		   for(int i=1;i<=(cal.getMaximum(Calendar.DAY_OF_MONTH));i++){
		          out.print("<option value="+(String.valueOf(i).length()==1?"0"+String.valueOf(i):String.valueOf(i))+">"
		          +(String.valueOf(i).length()==1?"0"+String.valueOf(i):String.valueOf(i))+"</option>");
		}
 %>
</select>
		<%-- 주소  --%>
		
<p>주소:<input type="text" id="postcode" name="postcode" placeholder="우편번호">
<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="roadAddress"  name="roadAddress" placeholder="도로명주소">
<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소"> <br>
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
		
		<p>연락처 : <select name="phone1">
                   <option value="010" >010</option>
                   <option value="011">011</option>
                   <option value="016" selected="selected">016</option>
                   <option value="017">017</option>
                   <option value="019">019</option>
                 </select>
				- <input type="text" maxlength="4" size="4" name="phone2"> -
				<input type="text" maxlength="4" size="4" name="phone3">
		<%
				List<String> domains=Arrays.asList("직접입력","naver.com","daum.net","google.com","seoulit.ac.kr");
		%>		
		<p>이메일:<input name="email">@<input name="domain"><select  onchange="selectValue(this)">
		     <% for(String domain:domains){
		    	 		  out.print("<option value='"+domain+"'>"+domain+"</option>");
		     }
		    	 %>
		</select>		
		<p>성별 : <label><input type="radio" name="sex" value="남성" checked>남성 </label>
				        <label><input	type="radio" name="sex" value="여성" >여성</label>
		<p>취미 : <label>독서<input type="checkbox" name="hobby" checked value="독서"></label>
				        <label>운동<input type="checkbox" name="hobby" value="운동"></label> 
				        <label>영화<input type="checkbox" name="hobby" value="영화"></label>
		<p><textarea rows="3" cols="30" placeholder="가입인사를 입력해주세요" wrap="soft" 
		           name="comment"></textarea>		        
				        
				        
		<p><input type="button" value="가입하기" onclick="checkMember()"> 
			<input type="reset"	value="다시쓰기">
	</form>


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