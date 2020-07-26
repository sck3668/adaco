<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#aside {
	width: 110px;
	height: 500px;
	background-color: gray;
	float: left;
}

#profile {
	width: 200px;
	height: 200px;
}

#section {
	width: 850px;
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
}

table.type11 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
}

table.type11 th {
	width: 222px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #ce4869;
}

table.type11 td {
	width: 222px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
}

.my-hr3 {
	border: 0;
	height: 3px;
	background: #ccc;
}
</style>
<script>
	$(document).ready(function() {

		//모든 서브 메뉴 감추기
		$(".sub").css({
			display : "none"
		});
		//$(".sub").hide(); //위코드와 동일 

		$(".title").click(function() {
			//일단 서브메뉴 다 가립니다.
			$(".sub").css({
				display : "none"
			});

			//열린 서브메뉴에 대해서만 가립니다.
			$(".sub").each(function() {
				console.log($(this).css("display"));
				if ($(this).css("display") == "block") {
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
	});
</script>
</head>

<body>
	<div class="jumbotron text-center mb-0">
		<h1>
			<span id="irum">${user.irum }</span> 님의 페이지입니다.
		</h1>
		<br>
		<p>환영합니다.</p>
	</div>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
		</div>
	</nav>

	<!-- content -->
	<div class="container pt-3">
		<div class="row">
			<!-- left content -->
			<div class="col-sm-3">
				<!-- side menu (link) -->
				<h3>
					<strong> MY Menu</strong>
				</h3>
				<ul class="list-group" id="navi">
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/read" style="color: black; text-decoration: none;">내 정보 보기</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/questionList" style="color: black; text-decoration: none;">문의내역</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/orderList" style="color: black; text-decoration: none;">주문내역</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/reviewList" style="color: black; text-decoration: none;">내 리뷰 보기</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/favoriteList" style="color: black; text-decoration: none;">즐겨찾기 목록</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/pointList" style="color: black; text-decoration: none;">포인트함</a></li>
						<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;"> 메시지함 </a>
						</div>
						<ul class="sub">
							<li><a href="/adaco/message/listSender"
								style="color: black; text-decoration: none;"> <i
									class="fas fa-angle-right" style="opacity: 0.5;"></i> 보낸 쪽지함
							</a></li>
							<li><a href="/adaco/message/listReceiver"
								style="color: black; text-decoration: none;"> <i
									class="fas fa-angle-right" style="opacity: 0.5;"></i> 받은 쪽지함
							</a></li>
						</ul>
					</li>
				</ul>
			</div>


			<!--  추가해줘야 하는 부분 ============================ -->

			<div class="col-sm-9" style="height: 700px;">
				<br>
				<h2>나의 내역</h2>
				<hr class="my-hr3">
				<!-- 				<ul class="dashboard-list"> -->
				<%-- 					<li>포인트:<strong style="color: red;">${point }p</strong></li> --%>
				<%-- 					<li>리뷰수:<strong style="color: red;">${review }개</strong></li> --%>
				<%-- 					<li>즐겨찾기수:<strong style="color: red;">${favorite }개</strong></li> --%>
				<!-- 				</ul> -->
				<table class="type11">
					<thead>
						<tr>
							<th scope="cols">포 인 트</th>
							<th scope="cols">리 뷰 수</th>
							<th scope="cols">즐 겨 찾 기 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="/adaco/user/pointList">${point }p</a></td>
							<td><a href="/adaco/user/reviewList">${review }개</a></td>
							<td><a href="/adaco/user/favoriteList">${favorite }개</a></td>
						</tr>
				</table>
			</div>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br>
		</div>
	</div>
</body>
</html>