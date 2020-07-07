function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	} else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}
//작품명 확인
function checkIrum() {
	var pattern = /^[A-Za-z0-9가-힣]{1,30}$/;
	return check($("#artName").val(), pattern, $("#artName_msg"), "작품 이름은 1~30자입니다.");
}

//작품 가격 확인
function checkPrice() {
	var pattern = /^[0-9]{1,7}$/;
	return check($("#artPrice").val(), pattern, $("#artPrice_msg"), "1~9,999,999까지 입력 가능합니다.")
}

//작품 수량 확인
function checkStock() {
	var pattern = /^[0-9]{1,5}$/;
	return check($("#artStock").val(), pattern, $("#artStock_msg"), "1~99,999까지 입력 가능합니다.")
}

//옵션명 확인
function checkOptionIrum() {
	var pattern = /^[A-Za-z0-9가-힣]{1,10}$/;
	return check($("#optionName").val(), pattern, $("#optionName_msg"), "옵션명은 1~10자입니다.");
}

//옵션값 확인
function checkOptionValue() {
	var pattern = /^[A-Za-z0-9가-힣]{1,10}$/;
	return check($("#optionName").val(), pattern, $("#optionName_msg"), "옵션값은 1~10자입니다.");
}

//옵션 추가 가격 확인
function checkOptionPrice() {
	var pattern = /^[0-9]{1,5}$/;
	return check($("#optionPrice").val(), pattern, $("#optionPrice_msg"), "1~99,999까지 입력 가능합니다.")
}

//옵션 수량 확인
function checkOptionStock() {
	var pattern = /^[0-9]{1,5}$/;
	return check($("#optionStock").val(), pattern, $("#optionStock_msg"), "1~99,999까지 입력 가능합니다.")
}

//검색 태그 확인
function checkOptionValue() {
	var pattern = /^[A-Za-z0-9가-힣]{1,10}$/;
	return check($("#artTag").val(), pattern, $("#artTag_msg"), "검색태그는 1~10자입니다.");
}

//배송 가격 확인
function checkPrice() {
	var pattern = /^[0-9]{1,4}$/;
	return check($("#artCouriPrice").val(), pattern, $("#artCouriPrice_msg"), "1~9,999까지 입력 가능합니다.")
}


