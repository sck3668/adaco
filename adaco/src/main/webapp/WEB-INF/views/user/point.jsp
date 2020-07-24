<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#section {
	width: 700px;
	padding: 5px;
	float: right;
	min-height: 600px;
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
</style>
<script>
	$(function() {

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
	})
</script>
</head>
<body>
	<div>
		<aside id="asideMain">
			<div class="col-sm-3">
				<!-- side menu (link) -->
				<h3>
					<strong><a href="/adaco/user/mypage" style="text-decoration: none; color: black;">
						MY Menu</a></strong>
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
							<a style="color: black; text-decoration: none;">
							메시지함
							</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/message/listSender" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 보낸 쪽지함</a>
							</li>
							<li>
								<a href="/adaco/message/listReceiver" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 받은 쪽지함</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</aside>
		<section id="section">
			<div>
				<h1>포인트</h1>

				<strong>포인트 합계:</strong>&nbsp;&nbsp;<span>${totalPoint }</span>

				<table class="table table-hover">
					<thead>
						<tr>
							<th>적립일</th>
							<th>적립금</th>
							<th>적립만료일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${point}" var="list">
							<tr>
								<td>${list.startDateStr }</td>
								<td>${list.point }</td>
								<td>${list.endDateStr }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<br>
				<br>
				<br>
			</div>
		</section>
	</div>
</html>