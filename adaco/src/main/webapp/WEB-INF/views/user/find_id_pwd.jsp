<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						else if (result == "2")
							location.href = "/adaco/user/findIdPwd";
						else
							location.href = "/adaco/user/resetPwd";
					},
					error : function() {
						alert("noooo");
					}
				})
			}
		}
		if (radio_btn_check == 0) {
			alert("아이디찾기,비밀번호 찾기를 선택해주세요");
			return;
		}
	}
</script>
</head>
<body>
	<!--  핸드폰 인증api(rest)-->
	<!-- <form action="/adaco/user/findIdPwd" method="post" id="findIdForm"> -->
	<form id="findIdForm">
		<div>
			<div>
				<hr>
				<h1>휴대폰 인증</h1>
				<hr>
			</div>
			<input type="radio" name="radio_btn" value="findId">아이디찾기 <input
				type="radio" name="radio_btn" value="findPwd">비밀번호찾기
			<div>
				<input type="text" id="tel" name="tel" placeholder="가입하신 연락처를 입력하세요">
			</div>
			<input type="button" value="인증하기" onclick="radio_chk();" />
		</div>
	</form>
</body>
</html>