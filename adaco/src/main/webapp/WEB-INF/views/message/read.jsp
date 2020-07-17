<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

</style>
<script>
$(function() {
	$("#btnSend").on("click", function() {
		location.href = "/adaco/message/listSender";
	});
	$("#btnReceive").on("click", function() {
		location.href = "/adaco/message/listReceiver";
	});	
	
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
</script>
</head>
<body>
<aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
				<li><a href="/adaco/user/read" style="color: black;">내정보보기</a></li>
				<li><a href="/adaco/order/read"style="color: black;">주문내역</a></li>
				<li><a href="/adaco/user/reviewList" style="color: black;">내리뷰보기</a></li>
				<li><a href="/adaco/user/favoriteList" style="color: black;">즐겨찾기목록</a></li>
				<li><a href="/adaco/user/pointList" style="color: black;">포인트함 </a>
				<li>
						<div class="title">
							<a style="color: black; text-decoration: none;">
							메세지함
							</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/message/listSender" style=" text-decoration: none;" >
									<i></i>빋은쪽지함</a>
							</li>
							<li>
								<a href="/adaco/message/listReceiver" style=" text-decoration: none;" >
									<i></i>보낸쪽지함</a>
							</li>
						</ul>
				</li>
			</ul>
		</div>
	</div>
</aside>
<section id="section">
	 <table>
		<tr><td>${msg.writeDate}에 ${msg.sendId }님이 ${msg.recipientId }님에게 보낸 메모</td></tr>
		<tr><td>${msg.title }</td></tr> 
		<tr><td>${msg.content }</td></tr>
	</table>
	<button id="btnSend">보낸쪽지함으로</button>
	<button id="btnReceive">받은쪽지함으로</button>
	</section>
</body>
</html>