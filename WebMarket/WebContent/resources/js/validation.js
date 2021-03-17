/**
 *  상품등록 유효성 검사 
 */

function CheckAddProduct(){
	//addProduct.jsp페이지의 요소들을 id로  얻기
	var productId = document.getElementById("productId");
	var name=document.getElementById("name");
	var unitPrice=document.getElementById("unitPrice");
	var unitsInstock=document.getElementById("unitsInstock");
	//
	var description=document.getElementById("description");
	var manufacturer=document.getElementById("manufacturer");
	var category=document.getElementById("category");
	
		
	//상품아이디 체크
	if(!check(/^P[0-9]{4,11}$/, productId, 
	      "[상품코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 입력하세요"))
       return false;
	
	//상품명 유효성 체크
	if(name.value.length < 4 || name.value.length > 50){
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	
	//상품가격 유효성 체크
	//1)숫자길이 비교, 숫자인지 문자인지 비교
	if(unitPrice.value.length ==0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	//2)음수여부 확인
	if(unitPrice.value<0){
		alert("[가격]\n음수를 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitPrice,"[가격]\n소수점 둘째 자리까지만 입력하세요.")){//3)소수점 2자리까지만 입력 허용
	  return false;
	}
	
	//재고 수량 체크
	if(unitsInstock.value==0){
	  alert("[재고 수]\n재고수량을 입력하세요");
	   unitsInstock.select();
	   unitsInstock.focus();
	  return false;
	 }

	if(isNaN(unitsInstock.value)){
	  alert("[재고 수]\n숫자만 입력하세요");
	   unitsInstock.select();
	   unitsInstock.focus();
	  return false;
	 }

    //상세 설명 유효성 체크
	if(description.value.length==0){
		alert("[상세정보]\n최소 1자 이상 입력하세요");
		description.select();
		description.focus();
		return false;
	}
	
	//제조사 유효성 체크
	if(manufacturer.value.length ==0){
		alert("[제조사]\n제조사 정보를 입력하세요");
		manufacturer.select();
		manufacturer.focus();
		return false;
	}
	
	//카테고리 유효성 체크
	if(category.value.length ==0){
		alert("[제조사]\n카테고리 정보를 입력하세요");
		category.select();
		category.focus();
		return false;
	}
	
	//정규표현식과 요소의 값을 비교체크 후 메세지 출력 함수
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	//위 유효성 검증 결과 이상이 없으면 서버로 form데이타를 전송
	document.newProduct.submit();
	
}