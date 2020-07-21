<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
    rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/shop-homepage.css" rel="stylesheet">
<style rel="stylesheet">
html {
  width: 100%;
  height: 100%;
}

body {
  background: -webkit-linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
  background: linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%);
  color: rgba(0, 0, 0, 0.6);
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  line-height: 1.6em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.overlay, .form-panel.one:before {
  position: absolute;
  top: 0;
  left: 0;
  display: none;
  background: rgba(0, 0, 0, 0.8);
  width: 100%;
  height: 100%;
}

.form {
  z-index: 15;
  position: relative;
  background: #FFFFFF;
  width: 600px;
  border-radius: 4px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  margin: 100px auto 10px;
  overflow: hidden;
}
.form-toggle {
  z-index: 10;
  position: absolute;
  top: 60px;
  right: 60px;
  background: #FFFFFF;
  width: 60px;
  height: 60px;
  border-radius: 100%;
  -webkit-transform-origin: center;
      -ms-transform-origin: center;
          transform-origin: center;
  -webkit-transform: translate(0, -25%) scale(0);
      -ms-transform: translate(0, -25%) scale(0);
          transform: translate(0, -25%) scale(0);
  opacity: 0;
  cursor: pointer;
  -webkit-transition: all 0.3s ease;
          transition: all 0.3s ease;
}
.form-toggle:before, .form-toggle:after {
  content: '';
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 30px;
  height: 4px;
  background: #4285F4;
  -webkit-transform: translate(-50%, -50%);
      -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
}
.form-toggle:before {
  -webkit-transform: translate(-50%, -50%) rotate(45deg);
      -ms-transform: translate(-50%, -50%) rotate(45deg);
          transform: translate(-50%, -50%) rotate(45deg);
}
.form-toggle:after {
  -webkit-transform: translate(-50%, -50%) rotate(-45deg);
      -ms-transform: translate(-50%, -50%) rotate(-45deg);
          transform: translate(-50%, -50%) rotate(-45deg);
}
.form-toggle.visible {
  -webkit-transform: translate(0, -25%) scale(1);
      -ms-transform: translate(0, -25%) scale(1);
          transform: translate(0, -25%) scale(1);
  opacity: 1;
}
.form-group {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  margin: 0 0 20px;
}
.form-group:last-child {
  margin: 0;
}
.form-group label {
  display: block;
  margin: 0 0 10px;
  color: rgba(0, 0, 0, 0.6);
  font-size: 12px;
  font-weight: 500;
  line-height: 1;
  text-transform: uppercase;
  letter-spacing: .2em;
}
.two .form-group label {
  color: #FFFFFF;
}
.form-group input {
  outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
  width: 100%;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 12px 20px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-group input:focus {
  color: rgba(0, 0, 0, 0.8);
}
.two .form-group input {
  color: #FFFFFF;
}
.two .form-group input:focus {
  color: #FFFFFF;
}
.form-group button {
  outline: none;
  background: #4285F4;
  width: 100%;
  border: 0;
  border-radius: 4px;
  padding: 12px 20px;
  color: #FFFFFF;
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  text-transform: uppercase;
  cursor: pointer;
}
.two .form-group button {
  background: #FFFFFF;
  color: #4285F4;
}
.form-group .form-remember {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
}
.form-group .form-remember input[type='checkbox'] {
  display: inline-block;
  width: auto;
  margin: 0 10px 0 0;
}
.form-group .form-recovery {
  color: #4285F4;
  font-size: 12px;
  text-decoration: none;
}
.form-panel {
  padding: 60px calc(5% + 60px) 60px 60px;
  box-sizing: border-box;
}
.form-panel.one:before {
  content: '';
  display: block;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-panel.one.hidden:before {
  display: block;
  opacity: 1;
  visibility: visible;
}
.form-panel.two {
  z-index: 5;
  position: absolute;
  top: 0;
  left: 95%;
  background: #4285F4;
  width: 100%;
  min-height: 100%;
  padding: 60px calc(10% + 60px) 60px 60px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
  cursor: pointer;
}
.form-panel.two:before, .form-panel.two:after {
  content: '';
  display: block;
  position: absolute;
  top: 60px;
  left: 1.5%;
  background: rgba(255, 255, 255, 0.2);
  height: 30px;
  width: 2px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-panel.two:after {
  left: 3%;
}
.form-panel.two:hover {
  left: 93%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
.form-panel.two:hover:before, .form-panel.two:hover:after {
  opacity: 0;
}
.form-panel.two.active {
  left: 10%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  cursor: default;
}
.form-panel.two.active:before, .form-panel.two.active:after {
  opacity: 0;
}
.form-header {
  margin: 0 0 40px;
}
.form-header h1 {
  padding: 4px 0;
  color: #4285F4;
  font-size: 24px;
  font-weight: 700;
  text-transform: uppercase;
}
.two .form-header h1 {
  position: relative;
  z-index: 40;
  color: #FFFFFF;
}

.pen-footer {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 600px;
  margin: 20px auto 100px;
}
.pen-footer a {
  color: #FFFFFF;
  font-size: 12px;
  text-decoration: none;
  text-shadow: 1px 2px 0 rgba(0, 0, 0, 0.1);
}
.pen-footer a .material-icons {
  width: 12px;
  margin: 0 5px;
  vertical-align: middle;
  font-size: 12px;
}

.cp-fab {
  background: #FFFFFF !important;
  color: #4285F4 !important;
}

</style>
<!-- <!-- <script> --> 
<!-- // function checkUsername() { -->
<!-- // 	$("#username_msg").text(""); -->
<!-- // 	$username = $("#username").val(); -->
<!-- // 	const patt = /^[A-Za-z0-9]{6,10}$/; -->
<!-- // 	if($username.length==0) -->
<!-- // 		return false; -->
<!-- // 	if(patt.test($username)==false)  -->
<!-- // 		return false -->
<!-- // 	return true; -->
<!-- // } -->
<!-- // function checkPassword() { -->
<!-- // 	$("#pwd_msg").text(""); -->
<!-- // 	$password = $("#password").val(); -->
<!-- // 	const patt = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/; -->
<!-- // 	if($password.length==0) -->
<!-- // 		return false; -->
<!-- // 	if(patt.test($password)==false) -->
<!-- // 		return false; -->
<!-- // 	return true; -->
<!-- // } -->

<!-- // 	$(function() { -->
<%-- // 		var msg = "${msg}"; --%>
<!-- // 		if(msg!="") { -->
<!-- // 			$("#alert").text(msg); -->
<!-- // 			$("#msg").show(); -->
<!-- // 		} -->
		
<!-- // 		$("#login").on("click", function() { -->
<!-- // 			if(checkUsername()==false) -->
<!-- // 				return; -->
<!-- // 			if(checkPassword()==false) -->
<!-- // 				return; -->
<!-- // 			$("#loginForm").submit(); -->
<!-- // 		}); -->
		
<!-- // 		$("#password").on("keypress", function(key) { -->
<!-- // 			if(key.keyCode!=13) -->
<!-- // 				return; -->
<!-- // 			if(checkUsername()==false) -->
<!-- // 				return; -->
<!-- // 			if(checkPassword()==false) -->
<!-- // 				return; -->
<!-- // 			$("#loginForm").submit(); -->
<!-- // 		}); -->
<!-- // 	}) -->
<!-- <!-- </script> --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">



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
		//
		$("#login").on("click", function() { 
// 			if(checkUsername()==false) 
// 				return; 
// 			if(checkPassword()==false) 
// 				return; 
 			$("#loginForm").submit(); 
 		}); 
		
		$("#password").on("keypress", function(key) { 
 			if(key.keyCode!=13) 
				return; 
// 			if(checkUsername()==false) 
// 				return; 
// 			if(checkPassword()==false) 
//  				return; 
			$("#loginForm").submit(); 
		}); 
	}) 
	//<button type="button" class="btn btn-outline-primary" id="login">로그인</button>
	function ps(){
if (this.forms.password.type="password")
box.innerHTML="<input type=\"html\" id=\"password\" required=\"required\" name=\"password\" size=\"100\" value="+this.forms.password.value+">" ;
click.innerHTML="<a href=\"javascript:txt()\" style=\"text-decoration: none\"><i class=\"fas fa-eye-slash\"></i></a> "}
function txt(){
if (this.forms.password.type="text")
box.innerHTML="<input type=\"password\" id=\"password\" required=\"required\"  name=\"password\" size=\"100\"  value="+this.forms.password.value+">";
click.innerHTML="<a href=\"javascript:ps()\" style=\"text-decoration: none\"><i class=\"far fa-eye\"></i></a>"}
</script>
</head>
<body>
	<div class="cotainer">
	<div class="row justify-content-center"> 
	<div class="col-md-8">
	<div class="alert alert-success alert-dismissible" id="msg" style="display:none;">
    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
  	</div>
	<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
      <h1>HandStory Login</h1>
    </div>
    
    <div class="form-content">
      <form action="/adaco/user/login" method="post" id="loginForm" name="forms">
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="username" required="required" autofocus/>
        </div>
        <div class="form-group">
          <label for="password">Password</label><span id=click><a href="javascript:ps()" style="text-decoration: none;"><i class="far fa-eye"></i></a></span>
<!--           <input type="password" id="password" name="password" required="required"/> -->
   <span id=box style="width: 450px;">
   <input type="password" id="password"  name="password" required="required" style="width: 450px;"></span>
        </div>
        <div class="form-group">
          <label class="form-remember">
          </label><a href="/adaco/user/findIdPwd" id="findIdPwd" class="form-recovery">계정을 잃어버렸나요?</a>
        </div>
         <div>
         <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group">
         <button type="button" class="btn btn-outline-primary" id="login">로그인</button>
        </div>
        <div class="form-group">
 			<a href="/adaco/user/join"><button type="button" class="btn btn outline primary"  id="join" style="width: 450px;" >회원가입</button></a>
         </div>
         </div>
      </form>
    </div>
  </div>
</div>
</div>
</div>
</div>

</body>
</html>