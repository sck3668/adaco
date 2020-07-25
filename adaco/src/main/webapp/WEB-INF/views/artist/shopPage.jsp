<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
    
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
});
</script>
</head>
<style>
 
</style>
<body>
<section id="section">
<div class="container">
  <h1 class="my-4">상점 정보보기
    <small></small><!-- 글씨 쓸수 있는 칸 -->
  </h1>
  <div class="row">
    <div class="col-md-8">
    <img id="show_profile" src="${shop.image }">
      <img class="img-fluid" id="shop_profile" src="#" alt="">
    </div>
    <div class="col-md-4">
      <h3 class="my-3"><strong>상점 이름</strong></h3>
      <span id="shopName">${shop.shopName }</span>
     <h3 class="my-3"> <strong>상점 소개</strong></h3>
      <span id="shopIntro">${shop.shopIntro }</span>
      <p></p>
      <h3><strong><a href="/adaco/artist/artistpage" style="text-decoration: none; color: black;" >MY Menu</a></strong></h3>
      <ul>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/orderList">주문 및 배송 관리</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/sales">매출관리</a></li>
        <li>
			<div class="title">
				<a style="color: black; text-decoration: none;">메세지함</a>
			</div>
			<ul class="sub"> 
				<li>
					<a href="/adaco/message/listSender" style=" text-decoration: none;" >
						<i></i>보낸쪽지함</a>
				</li>
				<li>
					<a href="/adaco/message/listReceiver" style=" text-decoration: none;" >
						<i></i>받은쪽지함</a>
				</li>
			</ul>
		</li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/shopRead">상점 관리 및 변경</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/story/listStory?artistno=${shop.artistno }">스토리보기</a></li>
        <li><a style="text-decoration: none; color: black;" href="/adaco/artist/artistpage">작가페이지</a></li>
      </ul>
      <input type="hidden" name="_csrf" value="${_csrf.token }">
    </div>
  </div>
  <h3 class="my-4">작가 작품</h3>

  <div class="row">

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="${shop.image }" alt="">
          </a>
    </div>
    <div class="col-md-3 col-sm-6 mb-4">
      <a href="/adaco/art/readByArtist?artno=${shop.artno[1] }">
            <img class="img-fluid" src="${shop.img[1] }" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
     <a href="/adaco/art/readByArtist?artno=${shop.artno[2] }">
            <img class="img-fluid" src="${shop.img[2] }" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
     <a href="/adaco/art/readByArtist?artno=${shop.artno[3] }">
            <img class="img-fluid" src="${shop.img[3] }" alt="">
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