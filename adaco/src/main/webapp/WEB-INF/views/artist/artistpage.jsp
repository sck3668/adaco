<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>

</head>
<body>
<div>
<aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
			<li class="list"><a href="/adaco/message/listReceiver">쪽지함</a></li>
				<li class="list"><a href="#">상점 정보보기</a></li>
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
			<ul class="dashboard-list">
				<li><a href="/adaco/artist/orderAdmin">주문 배송관리</a></li>
				<li><a href="/adaco/artist/sales">매출 관리</a></li>
				<li><a href="/adaco/artist/shopMade">상점 개설</a></li>
			</ul>
		</div>
	</section>
	</div>
</body>
</html>