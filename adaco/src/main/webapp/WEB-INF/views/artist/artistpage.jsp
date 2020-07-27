
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
	
	var msg = '${msg}'; 
	if(msg=="writeMsg") {
		var confirm_val = Swal.fire({
			  icon: 'error',
			  title: '작품 등록 실패',
			  text: '상점을 먼저 만들어야 합니다. 아래 링크를 눌러주세요',
			  footer: '<a href="/adaco/artist/shopMade">상점 개설하기!</a>'
			})
// 		if(confirm_val) {
// 			document.location.href = "/adaco/artist/shopMade"
// 		}
	}
	
	var msg = '${msg}'; 
	if(msg=="StoryWriteMsg") {
		var confirm_val =Swal.fire({
			  icon: 'error',
			  title: '스토리 작성 실패',
			  text: '상점을 먼저 만들어야 합니다. 아래 링크를 눌러주세요',
			  footer: '<a href="/adaco/artist/shopMade">상점 개설하기!</a>'
// 		if(confirm_val) {
// 			document.location.href = "/adaco/artist/shopMade"
// 		}
	})
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
				<h3>
					<strong>My Menu</strong>
				</h3>
				<ul class="list-group" id="navi">
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/shopPage" style="color: black; text-decoration: none;" >상점 정보</a>
					</li>
					<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;">작품 관리</a>
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
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/artistRead" style="color: black; text-decoration: none;">내 정보 관리</a>
					</li>
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/orderList" style="color: black; text-decoration: none;">판매내역</a>
					</li>
					<li class="list-group-item list-group-item-action">
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
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/sales" style="color: black; text-decoration: none;">매출 관리</a>
					</li>
					<li class="list-group-item list-group-item-action">
						<a href="/adaco/artist/questionList" style="color: black; text-decoration: none;">문의내역</a>
					</li>
				</ul>
			</div>
			<!-- right content -->
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
</body>
</html>