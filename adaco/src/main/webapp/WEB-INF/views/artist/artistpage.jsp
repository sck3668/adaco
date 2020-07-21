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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    ul#navi {
        width: 200px;
        text-indent: 10px;
        cursor:pointer;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 35px;
        line-height: 35px;
/*         background:#9ab92e; */
        cursor:pointer;
}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
/*         background:#f4f4f4; */
        cursor:pointer;
}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
}
    ul.sub li:hover {
         background:#f4f4f4; 
}


/*    #aside { */
/*       width:110px; */
/*       height:500px; */
/*       background-color: gray; */
/*       float: left; */
/*    } */
/*    #profile { */
/*       width:200px; */
/*       height:200px; */
/*    } */
/*    #section { */
/*    width: 850px; */
/*    padding: 5px; */
/*    float: right; */
/*    min-height: 600px; */
/*    } */
/*    #my { */
/*       width:750px; */
/*       padding: 0px; */
/*       height:80px; */
/*       background-color: gray; */
/*       margin: 0px; */
/*    } */

/*    .list { */
/*       margin-top:0px; */
/*       padding-top:0px; */
/*       display:inline-block; */
/*       width:240px; */
/*       height:50px; */
/*       border: 1px solid black; */
/*    } */

</style>
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
<script type="text/javascript"> 
	var msg = '${msg}'; 
	if(msg=="msg") {
		var confirm_val = confirm("상점을 개설하시겠습니까?");
		if(confirm_val) {
			document.location.href = "/adaco/artist/shopMade"
		}
	}
	
	
	
	
	
</script>
</head>
<body>
	<!-- header -->
	<div class="jumbotron text-center mb-0">
		<h1>
			<span id="irum">${user.irum }</span> 님의 페이지입니다.
		</h1>
		<br>
		<p>환영합니다 작가님</p>
	</div>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="/adaco/story/writeStory" class="nav-link">
				스토리 작성</a></li>
				<li class="nav-item"><a href="/adaco/art/write" class="nav-link">작품 등록</a></li>
			</ul>
		</div>
	</nav>
	<!-- content -->
	<div class="container pt-3">
		<div class="row">
			<!-- left content -->
			<div class="col-sm-3">
				<!-- side menu (link) -->
				<h3><strong><a href="/adaco/artist/artistpage" style="text-decoration: none; color: black;" >MY Menu</a></strong></h3>
				<ul class="list-group" id="navi">
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/shopPage"
						style="color: black; text-decoration: none;" >상점 정보</a></li>
					<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;">
							작품 관리
							</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/art/listByArtist" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 작품 목록</a>
							</li>
							<li>
								<a href="/adaco/art/write" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 작품 등록</a>
							</li>
						</ul>
					</li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/artistRead"
						style="color: black; text-decoration: none;">내 정보 관리</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/orderList"
						style="color: black; text-decoration: none;">판매내역</a></li>
					<li class="list-group-item list-group-item-action">
						<div class="title">
							<a style="color: black; text-decoration: none;">
							메세지함
							</a>
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
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/sales"
						style="color: black; text-decoration: none;">매출 관리</a></li>
				</ul>
			</div>
			<!-- right content -->
			<div class="col-sm-8">
				<h2>나의 작품 보기</h2>
				<p>2018년 8월 6일, 여름 미니 2집 Summer Magic</p>
				<img src="banner.jpg" class="img-fluid rounded">
				<hr>
				<!-- side menu (link) -->
				<h3>오늘의 소식!</h3>
				<p>레드벨벳(Red Velvet)의 'Power Up'(파워 업)이 인기 고공행진 중이다.</p>
				<p>지난 6일 공개된 레드벨벳 여름 미니앨범 타이틀 곡 'Power Up'은 9일 오전 10시 기준 멜론, 지니,
					엠넷뮤직, 벅스뮤직, 올레뮤직, 네이버뮤직, 소리바다 등 각종 음원 차트 1위를 올킬함은 물론, 중국 샤미뮤직 종합
					차트도 정상을 차지하며 4일 연속 1위를 기록하고 있어 레드벨벳 파워를 실감케 했다.</p>
				<div class="text-center">
					<img src="banner2.jpg" class="img-fluid rounded mb-3">
				</div>
				<p>또 지난 7일부터 인스타그램, 트위터, 페이스북 등 레드벨벳 공식 SNS에는 초강력 서머송 'Power
					Up'의 포인트 안무 '파도춤'과 '아기상어춤'을 선보이는 SM 소속 아티스트들의 영상이 순차 공개돼 화제를 모으고
					있다.</p>
				<p>이번 영상에는 동방신기 유노윤호, 슈퍼주니어 희철, 소녀시대 태연, 효연, 윤아, 샤이니 민호, 엑소 수호,
					NCT 등 SM 아티스트들이 'Power Up' 포인트 안무를 함께 추며 레드벨벳의 컴백을 응원하는 모습을 만날 수 있어
					훈훈함을 더한다. 레드벨벳은 'Power Up'으로 활발한 활동을 펼친다.</p>
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
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			</div>
		</div>
	</div>
	<!-- footer -->

	<!-- <div> -->
	<!--  <aside id="asideMain"> -->
	<!--    <div id="aside"> -->
	<!--       <div id="profile"> -->
	<!--       </div> -->
	<!--       <div> -->
	<!--          <ul> -->
	<!--             <li><a href="/adaco/order/artistSellList"style="color: black; text-decoration: none;">판매내역</a></li> -->
	<!--             <li><a href="/adaco/artist/shopPage" style="color: black; text-decoration: none;">내상점보기</a></li> -->
	<!--             <li><a href="/adaco/#" style="color: black; text-decoration: none;">메세지함</a></li> -->
	<!--             <li><a href="/adaco/artist/sales" style="color: black; text-decoration: none;" >매출 관리</a></li> -->
	<!--             <li><a href="/adaco/story/writeStory" style="color: black; text-decoration: none;" >스토리 작성</a></li> -->
	<!--              <li><a href="/adaco/art/write" style="color: black; text-decoration: none;" >작품 등록</a></li> -->
	<!--          </ul> -->
	<!--       </div> -->
	<!--    </div> -->
	<!--    </aside> -->
	<!--    <section id="section"> -->
	<!--       <div id="myInfo"> -->
	<!--          <div id="my"> -->
	<!--             <h2>작가 정보</h2> -->
	<!--          </div> -->
	<!--          <div class = "form-group"> -->
	<!--             <label for="introduction">작가 한줄 소개</label> -->
	<!--             <input type = "text" class = "form-control" name = "introduction" id = "introduction"> -->
	<!--          </div> -->
	<!--          <div> -->

	<!--          </div> -->
	<!--       </div> -->
	<!--    </section> -->
	<!--    </div> -->
</body>
</html>