// 아이디, 비번, 이메일, 전화 등에 대한 정규식을 검증해서 오류가 있을 경우 메시지를 출력
// function check(입력값, 패턴, 에러메시지출력할 곳, 에러메시지)
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
//이름 확인
function checkIrum() {
	var pattern = /^[가-힣]{2,5}$/;
	return check($("#irum").val(), pattern, $("#irum_msg"), "이름은 한글 2~10자입니다");
}

//아이디 확인
function checkUsername() {
	var pattern = /^[A-Za-z][A-Za-z0-9]{6,9}$/;
	return check($("#username").val(), pattern, $("#username_msg"), "아이디는 영숫자 7~10자입니다")
}

//비밀번호 확인
function checkPassword() {
	// 전방탐색 ()는 하나의 조건
	var pattern = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	var username = $("#username");
	return check($("#password").val(), pattern, $("#password_msg"), "비밀번호는 영숫자와 특수문자 8~10자입니다")
}

//비밀번호 일치
function checkPassword2() {
	$("#password2_msg").text("");
	var pwd1 = $("#password").val();
	var pwd2 = $("#password2").val();
	if(pwd1!==pwd2) {
		$("#password2_msg").text("비밀번호가 알치하지 않습니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true;
}

// 이메일 확인
function checkEmail() {
	// \의 역할 : 원래 의미를 빠져나온다(escape)
	// .은 정규식에서 임의의 글자. 점의 의미로 사용하려면 \.
	var pattern =  /^[A-Za-z][A-Za-z0-9]+@[A-Za-z\.]+$/;
	return check($("#email").val(), pattern, $("#email_msg"), "잘못된 이메일입니다");
}

//연락처 확인
function checkTel() {
	// 전화번호에 -가 있을 수도 없을 수도 있다
	var inputTel = $("#tel").val();
	// -를 찾아서 빈문자열로 변경(삭제)
	// 010-1111-2222 -> 01011112222
	// 옵션 g: 정규식은 찾으면 종료. 끝까지 찾아라
	var tel = inputTel.replace(/\-/g,'');
	$("#tel").val(tel);
	var pattern =  /^[0-9]{9,11}$/;
	return check(tel, pattern, $("#tel_msg"), "비밀번호는 영숫자와 특수문자 8~10자입니다")
}

function checkBirthDate() {
	$("#birth_date").text("")
	var value = $("#birth_date").val();
	var pattern =  /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
	return check(value, pattern, $("#birth_date_msg"), "정확한 날짜를 입력하세요")
}
