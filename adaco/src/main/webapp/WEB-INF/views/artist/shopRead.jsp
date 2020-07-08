<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#profileUpdate{
		float: right;	
		}
</style>
<script>
/* $(function(){
	$("#profileUpdate").on("click",function(){
		FormData formData =new FormData();
		
	})
}) */
$(function(){
	$("#update").on("click",function(){
		var $shopName = $("#shopName").val();
		var $shopIntro = $("#shopIntro").val();
		var $businessno = $("#businessno").val();
		var $account =$("#account").val();
		var params = {
				_method:"put",
				_csrf:"${_csrf.token}",
				shopName:$shopName,
				shopIntro:$shopIntro,
				shopno:${shop.shopno},
				account: $account
		}
		console.log(params)
		$.ajax({
			url:"/adaco/artist/updateByShop",	
			data:params,
			method:"post"
		}).done((r)=>{console.log(r)})
		  .fail((r)=>{console.log(r)});
	})
})

</script>
</head>
</head>
<body>
<form> 
<div>
${shop }
 <aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
				<li><a href="/adaco/user/read">내정보보기</a></li>
				<li><a href="#">주문내역</a></li>
				<li><a href="/adaco/user/reviewList">내리뷰보기</a></li>
				<li><a href="/adaco/user/favoriteList">즐겨찾기목록</a></li>
				<li><a href="/adaco/user/pointList">포인트함 </a>
			</ul>
		</div>
	</div>
	</aside>
	<section id="section">
		<div>
			<img id ="show_profile" height="200px;" src="${shop.image }">
			<input type="hidden" id="profile" value="${shop.image}">
			<button type="button" id="profileUpdate">프로필사진 업데이트</button>
		</div>
		<div>
			<input type="file" name="sajin" id="sajin">
		</div>
		<table class="table table-hover" id="user">
			<tr>
				<td class="first">이름:</td>
				<td><span>
				<input type="text" value="${shop.shopName}" name="shopName" id="shopName"></span></td>
			</tr>
				<!-- ================================================================ -->
			<tr>
				<td class="first1">상점 소개:</td>
				<td><span>
				<input type="text" value="${shop.shopIntro }" name="shopIntro" id="shopIntro"></span></td>
			</tr>
				<!-- ================================================================ -->
			<tr>
				<td class="first1">사업자번호:</td>
				<td><span>${shop.businessno }</span></td>
			</tr>
			<tr>
				<td class="first1">계좌번호:</td>
				<td><span>
				<input type="text" value="${shop.account}" name="account" id="account"></span></td>
			</tr>
			<tr>
				<td class="first1">출고지</td>
				<td><span id="birthDate">${shop.forwarding }</span></td>
			</tr>
			<tr>
				<td class="first1">반품지:</td>
				<td><span id="birthDate">${shop.back }</span></td>
			</tr>
		</table>	
		<button type="button" class="btn btn-info" id="update">변경하자</button>
	</section>
	</div>
</form>
</body>
</html>