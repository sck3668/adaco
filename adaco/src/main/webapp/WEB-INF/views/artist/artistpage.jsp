<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <style> -->
<!-- /* #aside { */ -->
<!-- /* 	width: 200px; */ -->
<!-- /* 	height: 500px; */ -->
<!-- /* 	background-color: white; */ -->
<!-- /* 	border: 1px solid red; */ -->
<!-- /* 	float: left; */ -->
<!-- /* } */ -->

<!-- /* #profile { */ -->
<!-- /* 	width: 200px; */ -->
<!-- /* 	height: 200px; */ -->
<!-- /* } */ -->

<!-- /* #section { */ -->
<!-- /* 	width: 850px; */ -->
<!-- /* 	padding: 5px; */ -->
<!-- /* 	float: right; */ -->
<!-- /* 	min-height: 600px; */ -->
<!-- /* } */ -->

<!-- /* #my { */ -->
<!-- /* 	width: 750px; */ -->
<!-- /* 	padding: 0px; */ -->
<!-- /* 	height: 80px; */ -->
<!-- /* 	background-color: gray; */ -->
<!-- /* 	margin: 0px; */ -->
<!-- /* } */ -->

<!-- /* .list { */ -->
<!-- /* 	margin-top: 0px; */ -->
<!-- /* 	padding-top: 0px; */ -->
<!-- /* 	display: inline-block; */ -->
<!-- /* 	width: 240px; */ -->
<!-- /* 	height: 50px; */ -->
<!-- /* 	border: 1px solid red; */ -->
<!-- /* } */ -->
<!-- </style> -->
<!-- <script> -->
	
	
<!-- </script> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<div> -->

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
<!-- </body> -->
<!-- </html> -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
   #aside {
      width:110px;
      height:500px;
      background-color: gray;
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
      border: 1px solid black;
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
            <li><a href="/adaco/user/read" style="color: black;">내정보보기</a></li>
            <li><a href="/adaco/order/artistSellList"style="color: black;">판매내역</a></li>
            <li><a href="/adaco/artist/shopPage" style="color: black;">내상점보기</a></li>
            <li><a href="/adaco/user/messageList" style="color: black;">메세지함</a>
         </ul>
      </div>
   </div>
   </aside>
   
   <section id="section">
      <div id="myInfo">
         <div id="my">
            <h2>작가 정보</h2>
         </div>
         <ul class="dashboard-list">
            <li class="list">포인트:<strong style="color: red;">${point }p</strong></li>
            <li class="list">리뷰수:<strong style="color: red;">${review }개</strong></li>
            <li class="list">즐겨찾기수:<strong style="color: red;">${favorite }개</strong></li>
         </ul>
         <div class = "form-group">
            <label for="introduction">작가 한줄 소개</label>
            <input type = "text" class = "form-control" name = "introduction" id = "introduction">
         </div>
         <div>
         
         </div>
      </div>
   </section>
   </div>
</body>
</html>