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
<!-- <body> -->
<!-- 		<div class="alert alert-danger alert-dismissible" id="msg" style="display:none;"> -->
<!--     	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
<!--     	<strong>서버 메시지 </strong><span id="alert"></span> -->
<!--   	</div> -->
<!--   	<form action="/adaco/user/resetPwd" method="post"> -->
<!-- 		<div class="form-group"> -->
<!-- 			<label for="login_username">아이디</label> -->
<!-- 			<input id="login_username" type="text" name="username" class="form-control" > -->
<!-- 			<span class="helper-text" id="login_username_helpler"></span> -->
<!-- 		</div> -->
<!-- 		<div class="form-group"> -->
<!-- 			<label for="login_email">이메일</label> -->
<!-- 			<input id="login_email" type="text" name="email" class="form-control" > -->
<!-- 		<span class="helper-text" id="login_email_helper"></span> -->
<!-- 		</div> -->
<%-- 		<input type="hidden" name="_csrf" value="${_csrf.token }"> --%>
<!-- 		<button class="btn btn-success" id="find_pwd_btn">비밀번호 찾기</button> -->
<!-- 	</form> -->
<!-- </body> -->
<body>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/image/hanstory.png"
		style="width: 350px; height: 150px;" alt="">
	<br>
	<br>
	<hr class="my-hr3">
	<br>
	<br>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">
	<form action="/adaco/user/resetPwd" method="post">
	
		<div class="card align-middle"
			style="width: 30rem; border-radius: 20px;">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">가입 정보 입력</h2>
			</div>
			
			<div class="form-group">
			<div class="card-body">&nbsp;아이디
				<label for="login_username" class="sr-only"></label> 
				<input type="text" id="login_username" name="username" class="form-control" required autofocus><BR>&nbsp;이메일
				<div>
			</div>
				<label for="login_email" class="sr-only"></label> 
				<input type="text" id="login_email"  name="email" class="form-control" required autofocus><BR>
				<span class="helper-text" id="login_email_helper"></span>
				</div>
				<input type="hidden" name="_csrf" value="${_csrf.token }">
				&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" id="find_pwd_btn" style="width: 437px;" >비밀번호 찾기</button> 
			</div>
		</div>
	</form>
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