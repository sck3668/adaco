<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#aside {
	width: 200px;
	height: 500px;
	background-color: white;
	border: 1px solid red;
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
</style>
<script>
	function loadImage() {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#show_profile").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
		return true;
	}
</script>
</head>
<body>
	<div>

		<aside id="asideMain">
			<div id="aside">
				<div id="profile"></div>
				<div>
					<ul>
						<li class="list"><a href="/adaco/message/listReceiver">쪽지함</a></li>
						<li class="list"><a href="/adaco/artist/shopRead">상점 정보보기</a></li>
						<li class="list"><a href="#">스토리</a></li>
					</ul>
				</div>
			</div>
		</aside>
		<section id="section">
			<div id="myInfo">
				<div id="my">
					<h2>작가님의 정보</h2>
				</div>
				<div>
					<img id="show_profile" height="200px;" src="${shop.image }">
				</div>
				<div></div>
				<table class="table table-hover" id="user">
					<tr>
						<td><img width="120px" id="profile"></td>
					</tr>
					<tr>
						<td class="first">상점 이름</td>
						<td colspan="2"><span id="shopName">${shop.shopName }</span></td>
					</tr>
					<tr>
						<td class="first">상점소개</td>
						<td colspan="2"><span id="shopIntro">${shop.shopIntro }</span></td>
					</tr>
				</table>
					<input type="hidden" value="${_csrf.token }">
			</div>
		</section>
	</div>
</body>
</html>