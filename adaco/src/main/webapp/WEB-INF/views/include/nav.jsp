<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function init() {
	$("#gogak-d").hide();
}
$(function() {
	init();
	$("#gogak").on("click",function() {
		$("#gogak-d").toggle();
		}); 
	
	$(".logout").on("click", function(){
		var param = {
			_csrf : "${_csrf.token}"						
		}
		$.ajax({
			url: "/adaco/user/logout",
			method: "post",
			data: param,
			success: function(){
				location.href = "/adaco";
			}
		});
	});
	 
	$("#artistPage").on("click",function() {
		var  params = {
				_csrf:'${_csrf.token}',
		}
		$.ajax({
			url:"/adaco/artist/checkShop",
			method:"post",
			data:params,
			success:function(result) {
				if(result=="1"){
					alert("상점이 이미 존재합니다")
					location.href="/adaco/"
				} else {
					location.href="/adaco/artist/shopMade"
				}
			}
		})
	})
	
	
	}) 
</script>
</head>
<body>
    <div class="container">
		<a class="navbar-brand" href="/adaco/"><!-- <img src="image/hanstory.png" style="width:25px; height:25px;" alt=""> -->HandStory</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
<!-- 비로그인상태 nav -->
			<sec:authorize access="isAnonymous()">
				<li class="nav-item">
         		   <a class="nav-link" href="/adaco/user/login">로그인</a>
         		</li>
         		<li class="nav-item">
					<a class="nav-link" href="/adaco/user/join">회원가입</a>
				</li>
         		<li class="nav-item">
					<a class="nav-link" href="/adaco/bag/view">장바구니</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/adaco/user/mypage">마이페이지</a>
				</li>
				<li class="nav-item" id="aa">
					<button type="button" class="btn-dropdown" id="gogak">고객센터</button>
					<ul class="menu-dropdown" id="gogak-d">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">자주 묻는 질문</a></li>
						<li><a href="#">메일로 문의</a></li>
					</ul>
				</li>
				
			</sec:authorize>
			
<!-- 일반회원  nav -->          
			<sec:authorize access="hasRole('ROLE_USER')">
				<li class="nav-item">
         		   <a class="nav-link logout" href="#">로그아웃</a>
         		</li>
         		<li class="nav-item">
					<a class="nav-link" href="/adaco/bag/view">장바구니</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/adaco/user/mypage">마이페이지</a>
				</li>
				<li class="nav-btn ui-dropdown" id="aa">
					<button type="button" class="btn-dropdown" id="gogak">고객센터</button>
					<ul class="menu-dropdown" id="gogak-d">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">자주 묻는 질문</a></li>
						<li><a href="#">메일로 문의</a></li>
					</ul>
				</li>
				
			</sec:authorize>
<!-- 작가 nav -->
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<li class="nav-item">
         		   <a class="nav-link logout" href="#">로그아웃</a>
         		</li>
         		<li class="nav-item">
         		   <a class="nav-link" href="/adaco/artist/artistpage">작가페이지</a>
         		</li>
         		<li class="nav-item">
         		   <a class="nav-link" href="/adaco/artist/shopMade" id="artistPage">상점 개설하기</a>
         		</li>
         		<li class="nav-btn ui-dropdown" id="aa">
					<button type="button" class="btn-dropdown" id="gogak">고객센터</button>
					<ul class="menu-dropdown" id="gogak-d">
						<li><a href="/w/board/notice">공지사항</a></li>
						<li><a href="/w/board/faq">자주 묻는 질문</a></li>
						<li><a href="mailto:support@idus.me">메일로 문의</a></li>
					</ul>
				</li>
			</sec:authorize>
<!-- 관리자 nav -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item">
         		   <a class="nav-link" href="/adaco/admin/">관리</a>
         		</li>
         		<li class="nav-item">
         		   <a class="nav-link logout" href="#">로그아웃</a>
         		</li>
			</sec:authorize>
<!--  -->
			
			</ul>
      </div>
    </div>
</body>
</html>