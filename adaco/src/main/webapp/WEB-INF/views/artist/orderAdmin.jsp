<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div>
	<section id="section">
	<div>
   <h1>주문/배송관리</h1>
	<div>
		<input type="radio" name="radio_btn" value="findId">주문 관리
		<input type="radio" name="radio_btn" value="findPwd">배송 관리
		<div>
			<input type="text"placeholder="사용자 아이디"><br>
		</div>
		<input type="button" value="조회하기" onclick="radio_chk();"/>
	</div>
	</div>
	</section>
	</div>
</body>
</html>