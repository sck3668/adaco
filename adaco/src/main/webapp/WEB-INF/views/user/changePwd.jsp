<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function printSuccessMsg(target,msg) {
	target.text(msg).css("color","green").css("font-size","0.75em");
}
function printErrorMsg(target,msg) {
	target.text(msg).css("color","red").css("font-size","0.75em");
}

function changeNewPassword() {
	$("#pwd_msg").text("굳 비밀번호").css("color","green").css("font-size","0.75em");
	$newPassword = $("#newPassword").val();
	const patt = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,15}$/;
	if($newPassword.length==0)
		return printErrorMsg($("#pwd_msg"),"비밀번호는 필수 입력입니다")
	if(patt.test($newPassword)==false)
		return  printErrorMsg($("#pwd_msg"),"비밀번호는 특수문자를 포함한 8~10자입니다")
		
	return true;
}
 $(function(){
	 $("#newPassword").on("blur",function(){
		 changeNewPassword();
	 })
})
</script>
</head>
<body>
		<form action="/adaco/user/changePwd" method="post">
		비밀번호:<input type="password" name="password" id="password"><br>
		새 비밀번호:<input type="password" name="newPassword" id="newPassword"><span id="pwd_msg"></span><br>
		<!-- csrf 토큰을 되돌려야 한다 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<button>비밀번호 변경</button>
	</form>
</body>
</html>