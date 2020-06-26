<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/shop-homepage.css" rel="stylesheet">
</head>
<body>
	<div class="alert alert-success alert-dismissible" id="msg" style="display:none;">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
  	</div>
	<form action="/adaco/user/login" method="post">
		아이디:<input type="text" name="username"><br>
		비밀번호:<input type="password" name="password"><br>
		<!-- csrf토큰을 되돌려야 한다 -->
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button>로그인</button>
	</form>
</body>
</html>