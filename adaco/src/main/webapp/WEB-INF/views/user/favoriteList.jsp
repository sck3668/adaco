<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<style>
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
}
</style>
<sec:authorize access="isAuthenticated()">
	<script>
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		var isLogin = false;
		var loginId = undefined;
	</script>
</sec:authorize>
<script>
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
	
	$(function(){
			$("#delete").on("click",function(){
			console.log($(this).next().val());
			var params={
					_method:"delete",
					_csrf:"${_csrf.token}",	
					favno :$(this).next().val()
			}
			console.log(params)
			$.ajax({
				url:"/adaco/user/favoriteDelete",
				data:params,
				method:"post"
			}).done((r)=>{console.log(r),location.href="/adaco/user/favoriteList"})
			  .fail((r)=>{console.log(r)})
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
		<form action="/adaco/user/favoriteDelete" method="post">
			<section id="section">
				<div>
					<h1>즐겨찾기함</h1>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>상품가격</th>
								<th></th>
								<%-- <td><a href="/adaco/board/read?bno=${board.bno}" onclick="openWin()">${board.title}</a></td> --%>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${favorite }" var="list">
								<tr class="tr">
									<td>${list.favno }</td>
									<td>${list.artno }</td>
									<td><a href="/adaco/art/readByUser?artno=${list.artno }">${list.artName }</a></td>
									<td>${list.price }</td>
									<td>
										<button type="button" id="delete" class="btn btn-info">삭제</button>
										<input type="hidden" value="${list.favno}">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</div>
			</section>
		</form>

	</div>

</body>
</html>