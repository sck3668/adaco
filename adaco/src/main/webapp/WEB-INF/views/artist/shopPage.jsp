<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 	#aside { */
/* 		width:110px; */
/* 		height:500px; */
/* 		background-color: gray; */
/* 		float: left; */
/* 	} */
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#profile {
		width:200px;
		height:200px;
	}
	#menu {
	width: 180px;
}
</style>
<body>
<aside id="asideMain">
   <div id="aside">
      <div id="profile">
      </div>
      <div class="col-sm-3">
				<!-- side menu (link) -->
				<h3>MY Menu</h3>
				<ul class="list-group" id="menu">
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/shopPage"
						style="color: black; text-decoration: none;">상점 정보</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/artistRead"
						style="color: black; text-decoration: none;">내 정보 관리</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/order/artistSellList"
						style="color: black; text-decoration: none;">판매내역</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="#" style="color: black; text-decoration: none;">메세지함</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/sales"
						style="color: black; text-decoration: none;">매출 관리</a></li>
				</ul>
			</div>
   </div>
   </aside>
<section id="section">
<div class="container">
  <h1 class="my-4">상점 정보보기
    <small></small><!-- 글씨 쓸수 있는 칸 -->
  </h1>
  <div class="row">
    <div class="col-md-8">
    <%--<img id="show_profile" src="${shop.image }"> --%>
      <img class="img-fluid" id="shop_profile" src="${shop.image }" alt="">
    </div>
    <div class="col-md-4">
      <h3 class="my-3">상점 이름</h3>
      <span id="shopName">${shop.shopName }</span>
      <h3 class="my-3">상점 소개</h3>
      <span id="shopIntro">${shop.shopIntro }</span>
      <p></p>
      <h3 class="my-3">Project Details</h3>
      <ul>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/orderAdmin">주문 및 배송 관리</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/sales">매출관리</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/#">쪽지함</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/shopRead">상점 관리 및 변경</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/#">스토리보기</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/artistPage">작가페이지</a></li>
      </ul> 
    </div>
  </div>
  <h3 class="my-4">또 다른 작품</h3>

  <div class="row">

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

  </div>
  <!-- /.row -->

</div>
</section>
<!-- /.container -->
<!-- <div> -->

<!-- 		<aside id="asideMain"> -->
<!-- 			<div id="aside"> -->
<!-- 				<div id="profile"></div> -->
<!-- 				<div> -->
<!-- 					<ul> -->
<!-- 						<li class="list"><a href="/adaco/message/listReceiver">쪽지함</a></li> -->
<!-- 						<li class="list"><a href="/adaco/artist/shopRead">상점 정보보기</a></li> -->
<!-- 						<li class="list"><a href="#">스토리</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 		</aside> -->
<!-- 		<section id="section"> -->
<!-- 			<div id="myInfo"> -->
<!-- 				<div id="my"> -->
<!-- 					<h2>작가님의 정보</h2> -->
<!-- 				</div> -->
<!-- 			<ul class="dashboard-list"> -->
<!-- 				<li><a href="/adaco/artist/orderAdmin">주문 배송관리</a></li> -->
<!-- 				<li><a href="/adaco/artist/sales">매출 관리</a></li> -->
<!-- 				<li><a href="/adaco/artist/shopMade">상점 개설</a></li> -->
<!-- 				<li><a href="/adaco/artist/#">정보변경</a></li> -->
<!-- 			</ul> -->
<!-- 				<div> -->
<%-- 					<img id="show_profile" height="200px;" src="${shop.image }"> --%>
<%-- 					<input type="hidden" value="${_csrf.token }"> --%>
<!-- 					 <div class="form-group"> -->
<!-- 						<label for="sajin">상점사진</label> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<table class="table table-hover" id="user"> -->
<!-- 					<tr> -->
<!-- 						<td><img width="120px" id="profile"></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td class="first">상점 이름</td> -->
<%-- 						<td colspan="2"><span id="shopName">${shop.shopName }</span></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td class="first">상점소개</td> -->
<%-- 						<td colspan="2"><span id="shopIntro">${shop.shopIntro }</span></td> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 		</section> -->
<!-- 	</div> -->
</body>
</html>