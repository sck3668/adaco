<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="alert alert-danger alert-dismissible" id="msg" style="display:none;">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
  	</div>
  	<form action="/abaco/user/find_pwd" method="post">
		<div class="form-group">
			<label for="login_username">아이디</label>
			<input id="login_username" type="text" name="username" class="form-control" >
			<span class="helper-text" id="login_username_helpler"></span>
		</div>
		<div class="form-group">
			<label for="login_email">이메일</label>
			<input id="login_email" type="text" name="email" class="form-control" >
		<span class="helper-text" id="login_email_helper"></span>
		</div>
		<input type="hidden" name="_csrf" value="${_csrf.token }">
		<button class="btn btn-success" id="find_pwd_btn">비밀번호 찾기</button>
	</form>
</body>
</html>