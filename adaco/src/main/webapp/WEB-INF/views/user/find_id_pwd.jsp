<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  핸드폰 인증api(rest) -->
<!-- <form action="/adaco/user/findIdPwd" method="post" id="findIdForm"> -->
<form action="/adaco/user/findId2" method="get" id="findIdForm">
	<div>
		<div>
			<hr>
				<h1>휴대폰 인증</h1>
			<hr>
		</div>
		<input type="radio" name="findIdPwd" value="findId">아이디찾기
		<input type="radio" name="findIdPwd" value="findPwd">비밀번호찾기
		<div>
			<input type="text" id="tel" name="tel" placeholder="가입하신 연락처를 입력하세요">
		</div>
		<div>
			<input type="text" id="telCheck" name="telCheck" placeholder="인증번호를 입력하세요">
		</div>
		<button>인증하기</button>
	</div>
</form>
</body>
</html>