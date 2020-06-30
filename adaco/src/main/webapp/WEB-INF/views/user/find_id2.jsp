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
	<form id="findId2Form" method="post">
	<div>
		<hr><h1>질문</h1><hr>
		<h3>가입하신 이름을 선택하세요</h3>
	</div>
		<div>
			<div>
				<input type="radio" name=irum id="irum1" value="aaaa">aaaa<br>
			</div>
			<div>
				<input type="radio" name=irum id="irum2" value="성철훈">성철훈<br>
			</div>
			<div>
				<input type="radio" name="irum" id="irum3" value="송철훈">송철훈<br>
			</div>
			<div>
				<input type="radio" name="irum" id="irum4" value="icia">icia<br>
			</div>
			<div>
				<input type="radio" name="irum" id="irum5" value="송찬권">송찬권<br>
			</div>
			<br>
			<div>
			 <input type="button" value="인증하기" onclick="radio_chk();"/>
			</div>	
		</div>
	</form>
</body>
</html>