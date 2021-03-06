<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<%-------------------------- 파라미터 받기(ko/en)-------------------------%>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<%-- 메세지 파일 정보 얻기 --%>
<fmt:bundle basename="bundle.message">

<title><fmt:message key="shippingTitle"/></title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
</head>
<body>

  <jsp:include page="menu.jsp"/>
  <div class="jumbotron">
    <div class="container">
          <h1 class="display-3"><fmt:message key="shippingTitle"/></h1>
    </div>
  </div>
 <!-- 배송 정보 입력  --> 
 <div class="container">
 <%-- 현재 페이지에서 파라미터의 갯수를 확인 후 개수만큼 파라미터 지정을 해야 오류가 안남. --%>
			 <div class="text-right">
			       <a href="?language=ko&cartId=<%=request.getParameter("cartId")%>">Korean</a>|
			       <a href="?language=en&cartId=<%=request.getParameter("cartId")%>">English</a>
			 </div>
      <form action="./processShippingInfo.jsp" method="post" class="form-horizontal" name="frm">
           <!--  카트 id정보 -->
         <input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>">
         <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveName"/></label>
                <div class="col-sm-3">
                    <input name="name" class="form-control" required>
                </div>
                <div class="col-sm-3">
                    <a href="javascript:window.open('./addresslist.jsp');"  
                              class="btn btn-secondary" role="button">
                              <fmt:message key="buttonAddressList"/>
                     </a>
                </div>
         </div>
         <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveDate"/></label>
                <div class="col-sm-3">
                    <input  type="date" name="shippingDate" class="form-control" 
                                           placeholder="(yyyy-mm-dd)" required>(yyyy-mm-dd)
                </div>
         </div>
         <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveNation"/></label>
                <div class="col-sm-3">
                    <input name="country" class="form-control"  required>
                </div>
          </div>
          <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveZipcode" /></label>
                <div class="col-sm-3">
                    <input name="zipcode" id='zipcode' class="form-control"  required>
                </div>
                <input type="button" onclick="sample6_execDaumPostcode()" 
                         value="<fmt:message key='buttonZipcode'/>"><br>
          </div>
          <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveAddress"/></label>
                <div class="col-sm-3">
                    <input name="addressName" id='addressName' class="form-control" required>
                </div>
          </div>
     
          <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveAddressDetail"/></label>
                <div class="col-sm-3">
                    <input name="addressDetail" id='addressDetail' class="form-control"  required>
                </div>
          </div>
          <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="receiveAddressExtra"/></label>
                <div class="col-sm-3">
                    <input name="addressExtra" id='addressExtra' class="form-control" required>
                </div>
          </div>
          
          <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <!-- 이전페이지로 이동 -->
                     <a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" 
                                           class="btn btn-secondary" role="button"><fmt:message key="linkPrev" /></a>
                     <!-- submit버튼으로 구매확정 페이지로 이동  -->                      
                     <input type="submit" value="<fmt:message key='buttonSubmit'/>" class="btn btn-primary">  
                     <!-- 구매 취소 페이지로 이동  -->                    
                     <a href="./checkOutCandelled.jsp" 
                                           class="btn btn-secondary" role="button"><fmt:message key="linkCancel"/></a>
                </div>
                
          </div>
         
      </form>
 </div> 
 </fmt:bundle>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addressExtra").value = extraAddr;
                
                } else {
                    document.getElementById("addressExtra").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addressName").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addressDetail").focus();
            }
        }).open();
    }
</script>
</html>