<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#tel1, #tel2, #tel3 {
	width: 125px;
}
	#section {
	width: 700px;
	padding: 5px;
	float: right;
	min-height: 600px;
}

#my {
	width: 750px;
	padding: 0px;
	height: 80px;
	background-color: gray;
	margin: 0px;
}

.list {
	margin-top: 0px;
	padding-top: 0px;
	display: inline-block;
	width: 240px;
	height: 50px;
	border: 1px solid red;
}

ul#navi {
	width: 200px;
	text-indent: 10px;
	cursor: pointer;
}

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

li.group div.title {
	height: 35px;
	line-height: 35px;
	/*         background:#9ab92e; */
	cursor: pointer;
}

ul.sub li {
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	/*         background:#f4f4f4; */
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: #f4f4f4;
 #user td { 
 	height: 60px; 
 	line-height: 60px; 
 } 

 #user td input { 
 	height: 25px; 
 } */

 .first { 
 	width: 250px; 
 	text-align: center; 
 } */

 .first1 { 
 	width: 200px; 
 	text-align: center; 
 } */

 #profile_sajin { 
 	line-height: 25px; 
 } 

 .key { 
 	width: 35%; 
 	display: inline-block; 
 } 
</style>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script>

function makePage(){
	// 비밀번호 변경 div를 보이지않도록 변경
	$("#passwordArea").hide();
	
	// 전화번호와 이메일 출력
	var email = "${user.email}";	
	// 이메일을 읽어와 @를 기준으로 분리
	var indexOfAt = email.indexOf("@");
	
	var email1 = email.substr(0, indexOfAt);
	var email2 = email.substr(indexOfAt+1);
	$("#email1").val(email1);
	$("#email2").val(email2);
	// #selectEmail에서 선택한 이메일 서버와 email2에 출력되는 서버를 동기화한다
	var $select = $("#selectEmail").find("option");
	$select.each(function(idx, option) {
		if($(option).text()==email2) {
			$($select[idx]).prop("selected", true);
		}
	});
	
	// 전화번호를 10자, 11자인 경우 각각 분리해서 출력
}


function loadImage() {
	
	var file = $("#sajin")[0].files[0];
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin").val("");
		return false;
	}
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_profile").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}
function page(){
	$("#passwordArea").hide();
	}

$(function(){
	makePage();
	page();
	
	 $("#delete").on("click",function(){
		var parmas = {
				_csrf:"${_csrf.token}",
				_method:"delete"
		}
		$.ajax({
			url:"/adaco/user/delete",
			method:"post",
			data:parmas
		}).done((r)=>{console.log(r),location.href="/adaco/"})
		  .fail((r)=>{console.log(r)})
	}) 
	
	
	$("#selectEmail").on("change",function(){
		var choice = $("#selectEmail").val();
	     if(choice!="직접 입력") {
	        $("#email2").val(choice);
	        $("#email2").prop("disabled", true);
	     }
	     if(choice=="직접 입력") {
	        // input 상자의 내용이 없어야 placeholder가 출력된다
	        $("#email2").val("");
	        $("#email2").attr("placeholder", choice);
	        $("#email2").prop("disabled", false);
	     }
		
		$email1 = $("#email1").val();
		$email2 = $("#email2").val();
	})


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
			password:$password,
			newPassword:$newPassword
		};
		console.log(parmas)
		$.ajax({
			data:parmas,
			method:"post",
			url:"/adaco/user/update"
		}).done(()=>{alert("비밀번호 변경 성공")})
		  .fail(()=>{alert("비밀번호 변경 실패")})
	})
		$("#sajin").on("change", loadImage);
	
	$("#update").on("click", function(){
		var email = $("#email1").val()+"@"+$("#email2").val();
		var tel = $("#tel").val();
		console.log(tel)
		var formData = new FormData();   //요소들이 없을수도 있을수도 있는상황이라 form이라는 전체로 바꾸는 객체는 사용할수없다
		formData.append("email", email);
		formData.append("tel", tel);
		if($("#sajin")[0].files[0]!=undefined)
			formData.append("sajin", $("#sajin")[0].files[0]);
		formData.append("_csrf", "${_csrf.token}");
		formData.append("_method", "put");
		
		for (var key of formData.keys()) {
			  console.log(key);
			}
		for (var value of formData.values()) {
			  console.log(value);
			}
		$.ajax({
				url:"/adaco/user/update",
				data: formData,
				method:"post",
				processData:false,
				contentType:false
			}).done((r)=> {console.log(r)})
			  .fail((r)=> {console.log(r)});
				
		});
	/* $("#update").on("click",function(){
		var $email1 = $("#email1").val();
		var $email2 = $("#email2").val();
		console.log($email1)
		console.log($email2)
		var $email = $email1+"@"+$email2;
		console.log($email)
		var $tel = $("#tel").val();
		console.log($tel)
		var $password = $("#password").val();
		var $newPassword=$("#newPassword").val();
		var $newPassword2=$("#newPassword2").val();
		var $sajin = $("#sajin").val();
		
		var params = {
				_method:"put",
				_csrf:"${_csrf.token}",
				tel:$tel,
				email:$email
		}
		console.log(params)
		console.log(profile)
		$.ajax({
			url:"/adaco/user/update",	
			data:params,
			method:"post"
		}).done((r)=>{console.log(r)})
		  .fail((r)=>{console.log(r)});
	}) */
});
$(function() {

	//모든 서브 메뉴 감추기
	$(".sub").css({display:"none"}); 
	//$(".sub").hide(); //위코드와 동일 

	$(".title").click(function(){
	    //일단 서브메뉴 다 가립니다.
	    $(".sub").css({display:"none"});
	    
	    //열린 서브메뉴에 대해서만 가립니다.
	    $(".sub").each(function(){
	        console.log($(this).css("display"));
	        if($(this).css("display")=="block") {
	            //$(".sub").css({display:"none"});
	            //$(this).hide();
	            $(this).slideUp("fast");
	        }
	    });

	    //현재 요소의 다음 요소를 보이게 합니다.
	    //$(this).next("ul").css({display:"block"});
	    //$(this).next("ul").show();
	    $(this).next("ul").slideDown("fast");


	})
	})

</script>
</head>
<body>
<div>
 <aside id="asideMain">
		<div class="col-sm-3">
				<!-- side menu (link) -->
				<h3>
					<strong>My Menu</strong>
				</h3>
				<ul class="list-group" id="navi">
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/shopPage" style="color: black; text-decoration: none;" >상점 정보</a>
					</li>
					<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;">작품 관리</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/art/listByArtist" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 작품 목록</a>
							</li>
							<li>
								<a href="/adaco/art/write" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 작품 등록</a>
							</li>
						</ul>
					</li>
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/artistRead" style="color: black; text-decoration: none;">내 정보 관리</a>
					</li>
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/orderList" style="color: black; text-decoration: none;">판매내역</a>
					</li>
					<li class="list-group-item list-group-item-action">
						<div class="title">
							<a style="color: black; text-decoration: none;">메세지함</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/message/listSender" style=" text-decoration: none;" >
									<i></i>보낸쪽지함</a>
							</li>
							<li>
								<a href="/adaco/message/listReceiver" style=" text-decoration: none;" >
									<i></i>받은쪽지함</a>
							</li>
						</ul>
					</li>
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/sales" style="color: black; text-decoration: none;">매출 관리</a>
					</li>
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/questionList" style="color: black; text-decoration: none;">문의내역</a>
					</li>
				</ul>
			</div>
	</aside>
	<section id="section">
		<div>
			<img id ="show_profile" height="200px;" src="${user.profile }">
		</div>
	
		<div>
			<input type="file" name="sajin" id="sajin">
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
			<td colspan="2">
				<input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">&nbsp;&nbsp;
				<select id="selectEmail">
					<option selected="selected">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</tr>
			<tr><td class="first">연락처</td>
			<td colspan="2">
				<input type="text" id="tel" value="${user.tel }" maxlength="11">
			</td>
			</tr>
		</table>	
		<button type="button" class="btn btn-info" id="update">변경</button>
		<button type="button" class="btn btn-info" id="delete">탈퇴</button>
	</section>
	</div>
</body>
</html>