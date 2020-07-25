<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	#profileUpdate{
		float: right;	
		}
	
#section {
	width: 750px;
	padding: 5px;
	float: right;
	min-height: 600px;
}
</style>
<script>

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

$(function(){
		$("#sajin").on("change", loadImage);
		$("#profileUpdate").on("click", function(){
			var formData = new FormData();
			if($("#sajin")[0].files[0]!=undefined)
			formData.append("sajin", $("#sajin")[0].files[0]);
			formData.append("_csrf", "${_csrf.token}");
			formData.append("_method", "put");
			formData.append("shopno",$("#shopno").val());
			for (var key of formData.keys()) {
				  console.log(key);
				}
			for (var value of formData.values()) {
				  console.log(value);
				}

		$.ajax({
			url:"/adaco/artist/update",
			data: formData,
			method:"post",
			processData:false,
			contentType:false
		}).done((r)=> {console.log(r)})
		  .fail((r)=> {console.log(r)});
		});
		
	});



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
		
		$.ajax({
			url:"/adaco/artist/updateByShop",	
			data:params,
			method:"post"
		}).done((r)=>{console.log(r)})
		  .fail((r)=>{console.log(r)});
	});
});


$(function(){
	$("#delete").on("click",function(){
		var parmas = {
				_csrf:"${_csrf.token}",
				_method:"delete",
		}
		console.log(parmas);
		alert("ss");
		$.ajax({
			url:"/adaco/artist/delete",
			data:parmas,
			method:"post"
		}).done((r)=>{console.log(r),location.href="/adaco/"})
		  .fail((r)=>{console.log(r)})
	});
});



</script>
</head>
</head>
<body>
<div>
 <aside id="asideMain">
	<div id="aside">
		<div class="col-sm-3">
				<!-- side menu (link) -->
				<h3><strong><a href="/adaco/artist/artistpage" style="text-decoration: none; color: black;" >MY Menu</a></strong></h3>
				<ul class="list-group" id="menu">
					<li class="list-group-item list-group-item-action" style="width: 175px;"><a
						href="/adaco/artist/shopPage"
						style="color: black; text-decoration: none; ">상점 정보</a></li>
					<li class="list-group-item list-group-item-action" style="width: 175px;" ><a
						href="/adaco/artist/artistRead"
						style="color: black; text-decoration: none;">내 정보 관리</a></li>
					<li class="list-group-item list-group-item-action" style="width: 175px;" ><a
						href="/adaco/order/artistSellList"
						style="color: black; text-decoration: none;">판매내역</a></li>
					<li class="list-group-item list-group-item-action"style="width: 175px;" ><a
						href="#" style="color: black; text-decoration: none;">메세지함</a></li>
					<li class="list-group-item list-group-item-action"style="width: 175px;" ><a
						href="/adaco/artist/sales"
						style="color: black; text-decoration: none;">매출 관리</a></li>
				</ul>
			</div>
	</div>
	</aside>
	<section id="section">
	<h3>상점 수정</h3>
	<form action="/adaco/artist/updateByShop" method="post"  id="joinForm" enctype="multipart/form-data">
		<div>
			<img id ="show_profile" height="200px;" src="${shop.image }"><br><br>
			 <input type="hidden" name="_csrf" value="${_csrf.token }">
			 <input type="hidden" id="shopno" value="${shop.shopno }"><br><br>
			<button type="button" id="profileUpdate" class="btn btn-success">프로필사진 업데이트</button>
		</div>
		<div>
			<input type="file" name="sajin" id="sajin" style="margin-bottom: 5px;"><br><br>
		</div>
		<table class="table table-hover" id="user">
			<tr>
				<td class="first">상점 이름:</td>
				<td><span>
				<input class="form-control" type="text" value="${shop.shopName}" name="shopName" id="shopName" style="width: 300px;"></span></td>
			</tr>
				<!-- ================================================================ -->
			<tr>
				<td class="first1">상점 소개:</td>
				<td><span>
				<input class="form-control" type="text" value="${shop.shopIntro }" name="shopIntro" id="shopIntro"></span></td>
			</tr>
				<!-- ================================================================ -->
			<tr>
				<td class="first1">사업자번호:</td>
				<td><span>${shop.businessno }</span></td>
			</tr>
			<tr>
				<td class="first1">계좌번호:</td>
				<td><span>
				<input class="form-control" type="text" value="${shop.account}" name="account" id="account"></span></td>
			</tr>
			<tr>
				<td class="first1">출고지</td>
				<td><span id="birthDate">${shop.forwarding }</span></td>
			</tr>
			<tr>
				<td class="first1">반품지:</td>
				<td><span id="birthDate">${shop.back }</span></td>
			</tr>
		</table><br><br>
		<button type="button" class="btn btn-info" id="update">변 경 하 기</button>
		<button type="button" class="btn btn-danger" id="delete" style="margin-left: 500px;">삭 제 하 기</button>
		</form>
	</section>
	</div>
</body>
</html>