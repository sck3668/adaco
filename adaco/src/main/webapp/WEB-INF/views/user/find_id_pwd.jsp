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
<script>
	function radio_chk() {
		//라디오 버튼 Name 가져오기
		var radio_btn = document.getElementsByName("radio_btn");
		var radio_btn_check = 0;
		for (var i = 0; i < radio_btn.length; i++) {
			//만약 라디오 버튼이 체크가 되어있다면 true
			if (radio_btn[i].checked == true) {
				//라디오 버튼 값
				radio_btn_check++;
				if($("#tel").val()=="") {
// 					alert("핸드폰 번호를 입력해주세요");
Swal.fire({
  icon: 'error',
  title: '인증 오류',
  text: '휴대폰 번호를 입력해주세요!',
  footer: 'Please enter your cell phone number.'
})
					return false;
				}
				var params = {
					findIdPwd : radio_btn[i].value,
					tel : $("#tel").val(),
					_csrf:'${_csrf.token}'
				};
				$.ajax({
					url : "/adaco/user/findIdPwd",
					data : params,
					method : "post",
					success : function(result) {
						if (result == "1")
							location.href = "/adaco/user/findId2";
						else if (result == "2") {
// 							alert("핸드폰번호를 정확히 입력해주세요");
Swal.fire({
  icon: 'error',
  title: '인증 오류',
  text: '휴대폰 번호를 정확히 입력해주세요!',
  footer: 'Please enter your cell phone number correctly'
})
// 							location.href = "/adaco/user/findIdPwd";
						}
						else if(result=="3") {
							location.href = "/adaco/user/resetPwd";
						}
						else {
// 							alert("체크해주세요");
Swal.fire({
  icon: 'error',
  title: '인증 오류',
  text: '아이디 또는 비밀번호 찾기를 선택해주세요',
  footer: 'Please select Find ID or Password'
})
						}
					},
				})
			}
		}
		if (radio_btn_check == 0) {
// 			alert("아이디찾기,비밀번호 찾기를 선택해주세요");
Swal.fire({
  icon: 'error',
  title: '인증 오류',
  text: '아이디 또는 비밀번호 찾기를 선택해주세요',
  footer: 'Please select Find ID or Password'
})
			return;
		}
	}
</script>
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
</head>
<body>
	<!--  핸드폰 인증api(rest)-->
	<!-- <form action="/adaco/user/findIdPwd" method="post" id="findIdForm"> -->
<!-- 	<form id="findIdForm"> -->
<!-- 		<div> -->
<!-- 			<div> -->
<!-- 				<hr> -->
<!-- 				<h1>휴대폰 인증</h1> -->
<!-- 				<hr> -->
<!-- 			</div> -->
<!-- 			<input type="radio" name="radio_btn" value="findId">아이디찾기 <input -->
<!-- 				type="radio" name="radio_btn" value="findPwd">비밀번호찾기 -->
<!-- 			<div> -->
<!-- 				<input type="text" id="tel" name="tel" placeholder="가입하신 연락처를 입력하세요"> -->
<!-- 			</div> -->
<!-- 			<input type="button" value="인증하기" onclick="radio_chk();" /> -->
<!-- 		</div> -->
<!-- 	</form> -->
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
	<img src="${pageContext.request.contextPath}/image/hanstory.png"
		style="width: 350px; height: 150px;" alt="">
	<br>
	<br>
	<hr class="my-hr3">
	<br>
	<br>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">
	<form id="findIdForm">
		<div class="card align-middle"
			style="width: 30rem; border-radius: 20px;">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">휴대폰
					인증</h2>
			</div>
			<div class="card-body">
				<h5 class="form-signin-heading">가입하신 휴대폰 번호를 입력하세요</h5>
				<label for="inputEmail" class="sr-only"></label> <input type="text"
					id="tel" name="tel" class="form-control" placeholder="(-)를 제외"
					required autofocus><BR>
				<div class="checkbox">
					<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
						name="radio_btn" value="findId"> 아이디 찾기
					</label>&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label> <input type="radio" name="radio_btn"
						value="findPwd"> 비밀번호 찾기
					</label>
				</div>
				<input type="button" value="인 증 하 기"
					class="btn btn-lg btn-primary btn-block" onclick="radio_chk();" />
			</div>
		</div>
	</form>
	<div class="modal"></div>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</html>