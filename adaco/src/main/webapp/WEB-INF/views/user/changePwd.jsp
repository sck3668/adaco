<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="/adaco/user/changePwd" method="post">
		비밀번호:<input type="password" name="password"><br>
		새 비밀번호:<input type="password" name="newPassword"><br>
		<!-- csrf 토큰을 되돌려야 한다 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<button>비밀번호 변경</button>
	</form>
</body>
</html>