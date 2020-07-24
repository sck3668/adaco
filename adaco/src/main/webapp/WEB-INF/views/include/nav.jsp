<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
		$("#artistPage").on("click", function() {
			var params = {
				_csrf : '${_csrf.token}',
			}
			$.ajax({
				url : "/adaco/artist/checkShop",
				method : "post",
				data : params,
				success : function(result) {
					if (result == "1") {
						Swal.fire({
							  icon: 'warning',
							  title: '이미 상점이 있습니다.',
							  footer: '<a href>도움이 필요한가요?</a>'
							})
					} else {
						location.href = "/adaco/artist/shopMade"
					}
				}
			})
		});
		
		$(".logout").on("click", function() {
			var param = {
				_csrf : "${_csrf.token}"
			}
			$.ajax({
				url : "/adaco/user/logout",
				method : "post",
				data : param,
				success : function() {
					location.href = "/adaco";
				}
			});
		});

	})
</script>
</head>
<body>
	<div class="container">
		<a class="navbar-brand" href="/adaco/" style="color: black"><strong>HandStory</strong>
			<!-- <img src="image/hanstory.png" style="width:25px; height:25px;" alt=""> -->
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 		<div class="collapse navbar-collapse" id="navbarResponsive"> -->
		<!-- 			<ul class="navbar-nav ml-auto"> -->
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
<!-- 비로그인상태 nav -->
				<sec:authorize access="isAnonymous()">

					<!-- 				<li class="nav-item"> -->
					<!--          		   <a class="nav-link" href="/adaco/user/login">로그인</a> -->
					<!--          		</li> -->
					<!--          		<li class="nav-item"> -->
					<!-- 					<a class="nav-link" href="/adaco/user/join">회원가입</a> -->
					<!-- 				</li> -->
					<!--          		<li class="nav-item"> -->
					<!-- 					<a class="nav-link" href="/adaco/bag/view">장바구니</a> -->
					<!-- 				</li> -->
					<!-- 				<li class="nav-item"> -->
					<!-- 					<a class="nav-link" href="/adaco/user/mypage">마이페이지</a> -->
					<!-- 				</li> -->
					<!-- 				<li class="nav-item" id="aa"> -->
					<!-- 					<button type="button" class="btn-dropdown" id="gogak">고객센터</button> -->
					<!-- 					<ul class="menu-dropdown" id="gogak-d"> -->
					<!-- 						<li><a href="#">공지사항</a></li> -->
					<!-- 						<li><a href="#">자주 묻는 질문</a></li> -->
					<!-- 						<li><a href="#">메일로 문의</a></li> -->
					<!-- 					</ul> -->
					<!-- 				</li> -->
					<li id="navbar-page"><a href="/adaco/user/login"
						style="text-decoration: none; color: #007BFF;"> <i
							class="fas fa-sign-in-alt"></i> 로그인
					</a></li>
					&emsp;
					<li id="navbar-tag"><a href="/adaco/user/join"
						style="text-decoration: none;"><i class="fas fa-user-plus"></i>
							회원가입</a></li>
					&emsp;
					<li id="navbar-guestbook"><a href="/adaco/bag/view"
						style="text-decoration: none;"> <i class="fas fa-shopping-bag"></i>
							장바구니
					</a></li>
					&emsp;
					<li id="navbar-guestbook"><a href=/adaco/user/mypage
						style="text-decoration: none;"> <i class="fas fa-user"></i>
							마이페이지
					</a></li>
					&emsp;


					<li class="dropdown"><a href="#" class="dropdown-category"
						style="text-decoration: none; color: red;"
						id="dropdownCategoryMenu" data-toggle="dropdown"><i
							class="fas fa-bell"></i> 고객센터 <i class="caret"></i></a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownCategoryMenu">
							<li><a href="/adaco/user/noticeList" style="text-decoration: none;"><i
									class="fas fa-exclamation"></i> 공지사항</a></li>
							<li class="#"></li>
							<li><a href="/adaco/user/faqList" style="text-decoration: none;"><i
									class="fas fa-question"></i> 자주 묻는 질문</a></li>
							<li><a href="/adaco/user/questionWrite" style="text-decoration: none;"><i
									class="far fa-paper-plane"></i> 1:1 문의</a></li>
						</ul></li>
				</sec:authorize>

<!-- 일반회원  nav -->
				
				<sec:authorize access="hasRole('ROLE_USER')">
					<!-- 					<li class="nav-item"><a class="nav-link logout" href="#">로그아웃</a> -->
					<!-- 					</li> -->
					<!-- 					<li class="nav-item"><a class="nav-link" -->
					<!-- 						href="/adaco/bag/view">장바구니</a></li> -->
					<!-- 					<li class="nav-item"><a class="nav-link" -->
					<!-- 						href="/adaco/user/mypage">마이페이지</a></li> -->
					<!-- 					<li class="nav-btn ui-dropdown" id="aa"> -->
					<!-- 						<button type="button" class="btn-dropdown" id="gogak">고객센터</button> -->
					<!-- 						<ul class="menu-dropdown" id="gogak-d"> -->
					<!-- 							<li><a href="#">공지사항</a></li> -->
					<!-- 							<li><a href="#">자주 묻는 질문</a></li> -->
					<!-- 							<li><a href="#">메일로 문의</a></li> -->
					<!-- 						</ul> -->
					<!-- 					</li> -->
					<li id="navbar-page"><a class="nav-link logout" href="#"
						style="text-decoration: none; color: #007BFF;"> <i
							class="fas fa-lock-open"></i> 로그아웃
					</a></li>
					&emsp;
					<li id="navbar-guestbook" class="nav-link"><a
						href="/adaco/bag/view" style="text-decoration: none;"> <i
							class="fas fa-shopping-bag"></i> 장바구니
					</a></li>
					&emsp;
					<li id="navbar-guestbook" class="nav-link"><a
						href=/adaco/user/mypage style="text-decoration: none;"> <i
							class="fas fa-user"></i> 마이페이지
					</a></li>
					&emsp;

					<li class="dropdown"><a class="nav-link" href="#"
						class="dropdown-category"
						style="text-decoration: none; color: red;"
						id="dropdownCategoryMenu" data-toggle="dropdown"><i
							class="fas fa-bell"></i> 고객센터 <i class="caret"></i></a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownCategoryMenu">
							<li><a href="/adaco/user/noticeList" style="text-decoration: none;"><i
									class="fas fa-exclamation"></i> 공지사항</a></li>
							<li class="#"></li>
							<li><a href="/adaco/user/faqList" style="text-decoration: none;"><i
									class="fas fa-question"></i> 자주 묻는 질문</a></li>
							<li><a href="/adaco/user/questionWrite" style="text-decoration: none;"><i
									class="far fa-paper-plane"></i> 1:1 문의</a></li>
						</ul></li>



				</sec:authorize>
				<!-- 작가 nav -->
				<sec:authorize access="hasRole('ROLE_SELLER')">
					<!-- 					<li class="nav-item"><a class="nav-link logout" href="#">로그아웃</a> -->
					<!-- 					</li> -->
					<!-- 					<li class="nav-item"><a class="nav-link" -->
					<!-- 						href="/adaco/artist/artistpage">작가페이지</a></li> -->
					<!-- 					<li class="nav-item"><a class="nav-link" -->
					<!-- 						href="/adaco/artist/shopMade" id="artistPage">상점 개설하기</a></li> -->
					<!-- 					<li class="nav-btn ui-dropdown" id="aa"> -->
					<!-- 						<button type="button" class="btn-dropdown" id="gogak">고객센터</button> -->
					<!-- 						<ul class="menu-dropdown" id="gogak-d"> -->
					<!-- 							<li><a href="/w/board/notice">공지사항</a></li> -->
					<!-- 							<li><a href="/w/board/faq">자주 묻는 질문</a></li> -->
					<!-- 							<li><a href="mailto:support@idus.me">메일로 문의</a></li> -->
					<!-- 						</ul> -->
					<!-- 					</li> -->
					<li id="navbar-page" class="nav-link logout"><a href="#"
						style="text-decoration: none; color: #007BFF;"> <i
							class="fas fa-lock-open"></i> 로그아웃
					</a></li>
					&emsp;
					<li id="navbar-guestbook" class="nav-link"><a
						href="/adaco/artist/artistpage" style="text-decoration: none;">
							<i class="fas fa-user"></i> 작가페이지
					</a></li>
					&emsp;
					<li id="navbar-guestbook" class="nav-link"><a
						href="javascript:void(0);" id="artistPage"
						style="text-decoration: none;"> <i class="fas fa-store"></i>
							상점개설
					</a></li>
					&emsp;
					<li class="dropdown"><a class="nav-link" href="#"
						class="dropdown-category"
						style="text-decoration: none; color: red;"
						id="dropdownCategoryMenu" data-toggle="dropdown"><i
							class="fas fa-bell"></i> 고객센터 <i class="caret"></i></a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownCategoryMenu">
							<li><a href="/adaco/user/noticeList" style="text-decoration: none;"><i
									class="fas fa-exclamation"></i> 공지사항</a></li>
							<li class="#"></li>
							<li><a href="/adaco/user/faqList" style="text-decoration: none;"><i
									class="fas fa-question"></i> 자주 묻는 질문</a></li>
							<li><a href="/adaco/user/questionWrite" style="text-decoration: none;"><i
									class="far fa-paper-plane"></i> 1:1 문의</a></li>
						</ul></li>
				</sec:authorize>
				<!-- 관리자 nav -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a class="nav-link" href="/adaco/admin/">관리</a>
					</li>
					<li class="nav-item"><a class="nav-link logout" href="#">로그아웃</a>
					</li>
				</sec:authorize>
				<!--  -->

			</ul>
		</div>
	</div>
</body>
</html>