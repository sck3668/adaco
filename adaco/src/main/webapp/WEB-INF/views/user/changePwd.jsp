<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
	background: linear-gradient(to bottom right, #F6F6F6, #FFFFFF);
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.my-hr3 {
	asd border: 0;
	height: 3px;
	background: #ccc;
}
</style>
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
<!-- 		<form action="/adaco/user/changePwd" method="post"> -->
<!-- 		비밀번호:<input type="password" name="password" id="password"><br> -->
<!-- 		새 비밀번호:<input type="password" name="newPassword" id="newPassword"><span id="pwd_msg"></span><br> -->
<!-- 		<!-- csrf 토큰을 되돌려야 한다 --> 
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
<!-- 		<button>비밀번호 변경</button> -->
<!-- 	</form> -->
<body>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/image/hanstory.png"
		style="width: 350px; height: 150px;" alt="">
	<br>
	<br>
	<hr class="my-hr3">
	<br>
	<br>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">
	<form action="/adaco/user/changePwd" method="post">
		<div class="card align-middle"
			style="width: 30rem; border-radius: 20px;">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">비밀번호 변경</h2>
			</div>
			<div class="form-group">
			<div class="card-body">&nbsp;비밀번호
				<input type="password" name="password" id="password" class="form-control" placeholder="발급 받은 비밀번호 입력"><BR>&nbsp;새 비밀번호
				<div>
			</div>
				<input type="password" name="newPassword" id="newPassword" class="form-control"><span id="pwd_msg"></span><BR>
				</div>
				<input type="hidden" name="_csrf" value="${_csrf.token }">
				&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" style="width: 437px;" >비밀번호 변경</button>
			</div>
		</div>
	</form>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>