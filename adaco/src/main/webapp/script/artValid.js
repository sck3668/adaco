function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수 입력입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	} else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}

// 셀렉트 박스 카테고리 체크
function SelectCheckCategory(value, area){
	area.text("");
	var value = $("#category option:selected").val();
	if(value=="카테고리 선택") { 
		area.text("카테고리를 선택해주세요").css({"color":"red", "font-size":"0.75em"});
		return false;
	} 
	return true
}

//셀렉트 박스 배송사 체크
function SelectCheckCourier(value, area){
	area.text("");
	var value = $("#Courier option:selected").val();
	if(value=="택배사") { 
		area.text("택배사를 선택해주세요").css({"color":"red", "font-size":"0.75em"});
		return false;
	} 
	return true
}

//작품 이미지 수  체크
function SelectCheckSajin(value, area){
	area.text("");
	var cnt = $("input[name='artSajin']").length;
	if(cnt<3) { 
		area.text("이미지는 3개이상 업로드 해주세요.").css({"color":"red", "font-size":"0.75em"});
		return false;
	} 
	return true
}

//카테고리 확인
function checkCategory() {
	var value = $("#category option:selected" ).val();
	return SelectCheckCategory($("#category option:selected").val(),$("#category_msg"));
}

//작품명 확인
function checkIrum() {
	var pattern = /^[A-Za-z0-9가-힣\s]{1,30}$/;
	return check($("#artName").val(), pattern, $("#artName_msg"), "작품 이름은 1~30자입니다.");
}

//작품 이미지 수 
function checkSajin() {
	var cnt = $("input[name='artSajin']").length;
	return SelectCheckSajin($("input[name='artSajin']").length,$("#artSajin_msg"));
}

//작품 가격 확인
function checkPrice() {
	var pattern = /^[0-9,]{1,7}$/;
	return check($("#price").val(), pattern, $("#artPrice_msg"), "숫자로 1~9,999,999까지 입력 가능합니다.")
}

//작품 수량 확인
function checkStock() {
	var pattern = /^[0-9,]{1,5}$/;
	return check($("#stock").val(), pattern, $("#artStock_msg"), "숫자로 1~99,999까지 입력 가능합니다.")
}

//옵션명 확인
function checkOptionIrum() {
	var pattern = /^[A-Za-z0-9가-힣\s]{1,10}$/;
	return check($("#optionName").val(), pattern, $("#optionName_msg"), "옵션명은 1~10자입니다.");
}

//옵션값 확인
function checkOptionValue() {
	var pattern = /^[A-Za-z0-9가-힣]{1,10}$/;
	return check($("#optionValue").val(), pattern, $("#optionValue_msg"), "옵션값은 1~10자입니다.");
}

//옵션 추가 가격 확인
function checkOptionPrice() {
	var pattern = /^[0-9,]{1,5}$/;
	return check($("#optionPrice").val(), pattern, $("#optionPrice_msg"), "숫자로 1~99,999까지 입력가능합니다. 추가 가격이 없을 시 '0'을 입력해주세요.")
}

//옵션 수량 확인
function checkOptionStock() {
	var pattern = /^[0-9,]{1,5}$/;
	return check($("#optionStock").val(), pattern, $("#optionStock_msg"), "숫자로 1~99,999까지 입력 가능합니다.")
}

//작품 상세설명
function checkArtDetail() {
	var pattern = /^[A-Za-z0-9가-힣\s]{1,200}$/;
	return check($("#artDetail").val(), pattern, $("#artDetail_msg"), "200자 까지 입력 가능합니다.")
}

//검색 태그 확인
function checkArtTag() {
	var pattern = /^[A-Za-z0-9가-힣\s]{1,10}$/;
	return check($("#tag").val(), pattern, $("#artTag_msg"), "검색태그는 1~10자입니다.");
}

//배송사 확인
function checkCourier() {
	var value = $("#Courier option:selected" ).val();
	return SelectCheckCourier($("#Courier option:selected").val(),$("#Courier_msg"));
}

//배송 가격 확인
function checkCouriPrice() {
	var pattern = /^[0-9',']{1,4}$/;
	return check($("#couriPrice").val(), pattern, $("#artCouriPrice_msg"), "숫자로 1~9,999까지 입력 가능합니다.")
}


