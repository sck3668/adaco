<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#aside {
		width:200px;
		height:500px;
		background-color: white;
		border: 1px solid red;
		float: left;
	}
	#profile {
		width:200px;
		height:200px;
	}
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#my {
		width:750px;
		padding: 0px;
		height:80px;
		background-color: gray;
		margin: 0px;
	}
	
	.list {
		margin-top:0px;
		padding-top:0px;
		display:inline-block;
		width:240px;
		height:50px;
		border: 1px solid red;
	}
	#user td {
		height: 60px;
		line-height: 60px;
	}
	
	#user td input {
		height: 25px;
	}
	
	#tel1, #tel2, #tel3 {
		width: 125px;
	}
	
	.first {
		width:100px;
		text-align: center;
	}
	.first1{
		width:200px;
		text-align: center;
	}
	#profile_sajin {
		line-height: 25px;
	}
	.key {
		width: 35%;
		display: inline-block;
	}
</style>
<script>
function page(){
	$("#passwordArea").hide();
}

$(function(){
	page();
	//토글 
	$("#pwdbtn").on("click",function(){	
		$("#passwordArea").toggle();
	})
	$("#changePwd").on("click",function(){
		var $password = $("#password").val();
		var $newPassword=$("#newPassword").val();
		var $newPassword2=$("#newPassword2").val();
			
		if($newPassword!==$newPassword2)
			return false;
		var parmas = {
			_method:"put",
			_csrf:"${_csrf.token}",
			password : $password,
			newPassword : $newPassword
		};
		console.log(parmas)
		$.ajax({
			data:parmas,
			method:"post",
			url:"/adaco/user/update"
		}).done(()=>{toastr.info("비밀번호 변경 성공")})
		  .fail(()=>{toastr.info("비밀번호 변경 실패")})
	})
	$("#update").on("click",function(){
		var formData = new FormData();
		console.log(formData);
		if($("#password").val()!=="")
			formData.append("password", $("#password").val());
		if($("#newPassword").val()===$("#newPassword2"))
			formData.append("newPassword",$("#newPassword"));
		$.ajax({
			url:"/adaco/user/update",
			data:formData,
			method:"post",
			processData:false,
			contentType:false
		}).done(()=>{toastr.info("변경성공")})
		.fail(()=>{toastr.info("변경실패")});
	})
});

</script>


</head>
<body>
<div>
 <aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
				<li><a href="/adaco/user/read">내정보보기</a></li>
				<li><a href="#">주문내역</a></li>
				<li><a href="#">내리뷰보기</a></li>
				<li><a href="#">즐겨찾기목록</a></li>
				<li><a href="#"> </a>
			</ul>
		</div>
	</div>
	</aside>
	
	<section id="section">
		<div>
			<img id ="show_profile" height="200px;"src="${user.profile }">
		</div>
		<div>
			<input type="file">
		</div>
		<table class="table table-hover" id="user">
			<tr>
				<td class="first">이름:</td>
				<td><span id="irum">${user.irum }</span></td>
			</tr>	
			<tr>
				<td class="first1">아이디:</td>
				<td><span id="username">${user.username }</span></td>
			</tr>
			<tr>
				<td class="first1">생년월일:</td>
				<td><span id="birthDate">${user.birthDateStr }</span></td>
			</tr>
			<tr>
				<td class="first">비밀번호:<span id="passwordspan"></span></td>
				<td><button type="button"class="btn btn-info" id="pwdbtn">비밀번호 수정</button>
				<div id ="passwordArea">
					<span class="key">현재비밀번호:</span><input type="password" id="password"><br>
					<span class="key">새 비밀번호 : </span><input type="password" id="newPassword"><br>     
					<span class="key">새 비밀번호 확인 : </span><input type="password" id="newPassword2">
					<button type="button" class="btn btn-info" id="changePwd">변경</button>
				</div>
				</td>
			</tr>
			<tr>
			<td class="first">이메일</td>
			<td><span id="email"value="${user.email }">${user.email }</span>
			</tr>
			<tr>
				<td class="first">연락처</td>
				<td><span id="password" value="${user.tel}">${user.tel }</span></td>
			</tr>
		</table>	
		<button class="btn btn-info" id="update">변경하자</button>
	</section>
	</div>
		
<body>
		
</body>
</html>