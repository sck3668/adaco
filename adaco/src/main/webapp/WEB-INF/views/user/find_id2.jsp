<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- irum값 랜덤으로 출력
	체크한 값만 controller로 넘겨서 확인
 -->
	<form id="findId2Form" action="/adaco/user/findId2" method="post">
	<div>
		<hr><h1>질문</h1><hr>
		<h3>가입하신 이름을 선택하세요</h3>
	</div>
		<div>
			<div>
				<input type="radio" name="irum">
				<input type="text" id="irum1" value="aaaa" disabled="disabled">
			</div>
			<div>
				<input type="radio" name="irum">
				<input type="text" id="irum2" value="성철훈" disabled="disabled">
			</div>
			<div>
				<input type="radio" name="irum">
				<input type="text" id="irum3" value="송철훈" disabled="disabled">
			</div>
			<div>
				<input type="radio" name="irum">
				<input type="text" id="irum4" value="icia" disabled="disabled">
			</div>
			<br>
			<button>아이디찾기</button>	
		</div>
	</form>
</body>
</html>