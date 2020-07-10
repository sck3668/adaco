<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/adaco/user/find_pwd" method="post">
      <input type="text" name="username" placeholder="아이디"><br>
      <input type="text" name="email" placeholder="이메일"><br>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"><br>
      <button>비밀번호 찾기</button>
	</form>
</body>
</html>