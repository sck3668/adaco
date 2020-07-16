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
<style>
	#a {text-decoration: none;}
</style>
<script>
function checkUsername() {
	$("#username_msg").text("");
	$username = $("#username").val();
	const patt = /^[A-Za-z0-9]{6,10}$/;
	if($username.length==0)
		return false;
	if(patt.test($username)==false) 
		return false
	return true;
}
function checkPassword() {
	$("#pwd_msg").text("");
	$password = $("#password").val();
	const patt = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	if($password.length==0)
		return false;
	if(patt.test($password)==false)
		return false;
	return true;
}

	$(function() {
		var msg = "${msg}";
		if(msg!="") {
			$("#alert").text(msg);
			$("#msg").show();
		}
		
		$("#login").on("click", function() {
			if(checkUsername()==false)
				return;
			if(checkPassword()==false)
				return;
			$("#loginForm").submit();
		});
		
		$("#password").on("keypress", function(key) {
			if(key.keyCode!=13)
				return;
			if(checkUsername()==false)
				return;
			if(checkPassword()==false)
				return;
			$("#loginForm").submit();
		});
	})
</script>
</head>
<body>
	<div class="alert alert-success alert-dismissible" id="msg" style="display:none;">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
  	</div>

<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">로그인</div>
                    <div class="card-body">
                        <form action="/adaco/user/login" method="post" id="loginForm">
                            <div class="form-group row">
                                <span for="username" class="col-md-4 col-form-label text-md-right">
                                	username
                                </span>
                                <div class="col-md-6">
                                    <input type="text" id="username" class="form-control" name="username" required autofocus>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">
                                	password
                                </label>
                                <div class="col-md-6">
                                    <input type="password" id="password" class="form-control" name="password" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-6 offset-md-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember"> 아이디저장하기
                                        </label>
                                        
                                        <div class="custom-control custom-checkbox mb-1">
											<input type="checkbox" class="custom-control-input" 
    											name="remember-me" value="True"
												id="customCheck1">
											<label class="custom-control-label" for="customCheck1">로그인 유지</label>
										</div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 offset-md-4">
                              	<input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="button" class="btn btn-primary" id="login">
                           		         로그인
                                </button>
                                <div style="width:300px; height:30px; background-color: white; text-align: center; border: 1px solid black;">
                                	<a id="join" href="/adaco/user/join" class="btn btn-link">회원가입</a>
                                </div>
                                <div style="width:300px; height:30px; background-color: white; text-align: center; border: 1px solid black;">
                                	<a id="findIdPwd" href="/adaco/user/findIdPwd" class="btn btn-link">아이디/비밀번호 찾기</a>
                            	</div>
                            	
                            </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </main>
</body>
</html>