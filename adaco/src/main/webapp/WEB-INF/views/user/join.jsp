<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tel1 {width:50px;}
	#tel2 {width:50px;}
	#tel3 {width:50px;}
	#email1 {width:80px;}
	#email2 {width:100px;}
</style>
<script>
function printSuccessMsg(target,msg) {
	target.text(msg).css("color","green").css("font-size","0.75em");
}
function printErrorMsg(target,msg) {
	target.text(msg).css("color","red").css("font-size","0.75em");
}

let $username = undefined;
let $password = undefined;
let $password2 = undefined;
let $irum = undefined;
let $email = undefined;
let $tel = undefined;

function loadImage() {
	var file = $("#sajin")[0].files[0];	
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin").val("");
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_profile").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}


// 아이디 체크
function checkUsername() {
		$("#username_msg").text("");
		$username = $("#username").val();
		const patt = /^[A-Za-z0-9]{6,10}$/;
		if($username.length==0)
			return printErrorMsg($("#username_msg"), "아이디는 필수입력입니다");
		if(patt.test($username)==false) 
			return printErrorMsg($("#username_msg"), "아이디는 영숫자 6~10자입니다");
		ajaxCheckUsername();
		return true;
	}
// ajax로 아이디 사용여부 확인
function ajaxCheckUsername() {
	$.ajax({
		url: "/adaco/user/check_id",
		method: "get",
		data : "username=" + $("#username").val(),
		success: function() {
			$("#username_msg").text("좋은 아이디네요").css({"color":"green", "font-size":"0.75em"});
		},
		error: function() {
			$("#username_msg").text("사용중인 아이디입니다").css({"color":"red", "font-size":"0.75em"});
		}
	});
}

// 이메일 체크
function checkEmail() {
		$("#email_msg").text("");
		const email1 = $("#email1").val();
		const email2 = $("#email2").val();
		const $email = 'email1+"@"+email2';
		console.log("email==="+$email);
		const patt = /^[A-Za-z][A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9\.]+$/;
		$('<input>').attr('type','text').attr('name',"email").val(email).appendTo($("#joinForm"));
		if($email.length==0)
			return printErrorMsg($("#email_msg"),"이메일은 필수입력입니다")
		if(patt.test($email)==false)
			return printErrorMsg($("#email_msg"),"이메일 형식에 어긋납니다")
		ajaxCheckEmail();
		return true;
	}
	
// ajax : 비동기(지멋대로 병렬 실행) -> 동기화(jQuery then, done, fail)
function ajaxCheckEmail() {
	$.ajax({
		url: "/adaco/user/check_email",
		method: "get",
		data : "email=" + '$("#email").val()'
	})
	.done(()=>{$("#email_msg").text("사용가능합니다").css({"color":"green", "font-size":"0.75em"})})
	.fail(()=>{$("#email_msg").text("사용중입니다").css({"color":"red", "font-size":"0.75em"})});
}

//이름 체크
function checkIrum() {
		$("#irum_msg").text("");
		$irum = $("#irum").val();
		const patt = /^[가-힣	]{2,10}$/;
		if($irum.length==0)
			return printErrorMsg($("#irum_msg"),"이름은 필수입력입니다")
		if(patt.test($irum)==false)
			return printErrorMsg($("#irum_msg"),"이름은 한글 2~10자입니다")
		return true;
	}


//연락처 체크
function checkTel() {
		$("#tel_msg").text("");
		const tel1 = $("#tel1").val();
		const tel2 = $("#tel2").val();
		const tel3 = $("#tel3").val();
		const tel = tel1+tel2+tel3;
		$('<input>').attr('type','text').attr('name',"tel").val(tel).appendTo($("#joinForm"));
		const patt = /^[0-9]{10,11}$/;
		if(tel.length==0)
			return printErrorMsg($("#tel_msg"),"전화번호는 필수 입력입니다.");
		if(patt.test(tel)==false)
			return printErrorMsg($("#tel_msg"),"전화번호는 숫자10~11자입니다.");
		return true;
	}
//비밀번호 체크, 확인
	function checkPassword() {
		$("#pwd_msg").text("");
		$password = $("#password").val();
		const patt = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
		if($password.length==0)
			return printErrorMsg($("#pwd_msg"),"비밀번호는 필수 입력입니다")
		if(patt.test($password)==false)
			return printErrorMsg($("#pwd_msg"),"비밀번호는 특수문자를 포함한 8~10자입니다")
		return true;
	}

	function checkPassword2() {
		$("#pwdCheck_msg").text("");
		$password = $("#password").val();
		$password2 = $("#password2").val();
		if($password2.length==0)
			return printErrorMsg($("#pwdCheck_msg"),"비밀번호확인은 필수입력입니다")
		if($password!=$password2)
			return printErrorMsg($("#pwdCheck_msg"),"비밀번호가 일치하지 않습니다")
		return true;
	}
	
//생년월일 체크
function checkBirthDate() {
		$("#birthDate_msg").text("");
		
	}
	
$(function() {
	/* $("#sajin").on("change", loadImage); */
	$("#username").on("blur", function() {
		checkUsername();
	});
	$("#email").on("click", function() {
		checkEmail();
	});
	$("#tel").on("click", checkTel);
	$("#irum").on("blur", checkIrum);
	$("#password").on("blur", checkPassword);
	$("#password2").on("blur", checkPassword2);
	$("#birth_date").on("blur", checkBirthDate);
	
	$("#join").on("click", function() {
		console.log($("#joinForm").serialize());
		alert("AAA");
		// ajax 통신에서 multipart 넘기기위한 자바스크립트 객체
		/* var formData = new FormData(document.getElementById("joinForm"));
		alert("AAASSSSS");
		for(var key of formData.keys())
			alert("AAA==========");
			console.log(key);
		for(var value of formData.values())
			alert("aaaa===========");
			console.log(value); */
		var r1 = checkUsername();
		var r2 = checkEmail();
		var r3 = checkPassword();
		var r4 = checkPassword2();
		var r5 = checkTel();
		var r6 = checkBirthDate();
		var r7 = checkIrum();
		console.log($("#joinForm").serialize());
		alert("CCCC");
		
		var result = r1 && r2 && r3 && r4 && r5 && r6 && r7;
		if(result===true) {
			alert("DDD");
			$.when($.ajax("/adaco/user/check_id?username=" + $("#username").val()),
				$.ajax("/adaco/user/check_email?email=" + $("#email").val())
			).done(()=>{ $("#joinForm").submit(); })
		}
	})	
	
});
</script>
</head>
<body>
      <!--  <article class="container"> -->
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <hr><h4>회원가입에 오신걸 환영합니다</h4><hr>
                </div>
            </div>
            <form action="/adaco/user/join" method="post" id="joinForm">
            <div id="wrap">
                
                    <input type="hidden" name="_csrf" value="${_csrf.token }">
                    <div class="form-group">
                        <label for="irum">이름</label>
                        <input type="text" class="form-control" name="irum" id="irum" placeholder="이름을 입력해 주세요">
                    	<span id="irum_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="username">아아디</label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="아이디를 입력해주세요">
                        <span id="username_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요">
                    	<span id="pwd_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="ppassword2">비밀번호 확인</label>
                        <input type="password" class="form-control" name="password2" id="password2" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    	<span id="pwdCheck_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label><br>
                        <input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">&nbsp;&nbsp;
					<select id="selectEmail">
						<option selected="selected">직접 입력</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select>
					<button id="email" type="button">확인</button>
                    	<span id="email_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="tel">연락처</label><br>
                        <input type="text" name="tel1" id="tel1" maxlength="3">&nbsp-&nbsp;
						<input type="text" name="tel2" id="tel2" maxlength="4">&nbsp-&nbsp;
						<input type="text" name="tel3" id="tel3" maxlength="4">
                    	<button id="tel" type="button">확인</button>
                    	<span id="tel_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="birthDay">생년월일</label>
                        <input type="tel" class="form-control" id="birthDay" placeholder="생년월일을 입력해 주세요">
                    	<span id="birthDay_msg"></span>
                    </div>

                    <div class="form-group">
                    <label>약관 동의</label>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" checked>
                    </label>
                    <a href="#">이용약관</a>에 동의합니다.
                    </div>
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" id="join" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
            </div>
            </form>
   <!--      </article> -->
</body>
</html>