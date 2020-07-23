<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	#section {
	width: 730px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#delete{
	margin-right: 20px;
	}
	    table, th, td {
        text-align: center;
  }  
</style>
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
	
	
	
	
	$("#delete").on("click", function() {
		var ar = "";
		$(".mno").each(function(idx) {
			if($(this).prop("checked")) {
				ar = ar + ($(this).val()) + "," ;
			}
		});
		if(ar.length==0)
			return;
		var params ={
			_method: "patch",
			mnos: ar,
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url:"/adaco/message/isSendMessage",
			method:"post",
			data: params,
		}).done(()=>{location.reload(); })
		.fail((xhr)=>{console.log(xhr)})
	});
})
</script>
</head>
<body>
<aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div class="col-sm-3">
				<!-- side menu (link) -->
				<h3>
					<strong><a href="/adaco/user/mypage" style="text-decoration: none; color: black;">
						MY Menu</a></strong>
				</h3>
				<ul class="list-group" id="navi" >
					<li class="list-group-item list-group-item-action" ><a
						href="/adaco/user/read"
						style="color: black; text-decoration: none;">내 정보 보기</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/user/orderList"
						style="color: black; text-decoration: none;">주문내역</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/user/reviewList"
						style="color: black; text-decoration: none;">내 리뷰 보기</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/user/favoriteList"
						style="color: black; text-decoration: none;">즐겨찾기 목록</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/user/pointList"
						style="color: black; text-decoration: none;">포인트함</a></li>
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
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 받은 쪽지함 </a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
	</div>
</aside>
<section id="section">
	<div>
	<h1>보낸쪽지함</h1>
		<table id="list" class="table table-hover">
			<thead>
				<tr><th>받는이</th><th>제목</th><th>보낸 날짜</th><th>읽음</th><th></th>
			</thead>
			<c:forEach items="${list}" var="message">
				<tr>
					<td>${message.recipientId}</td>
					<td><a href="/adaco/message/read?mno=${message.mno}">${message.title}</a></td>
					<td>${message.writeDate}
					<td>
						<c:choose>
							<c:when test="${message.msgCheck==true}">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose>
					</td>
					<td><input type="checkbox" class="mno" value="${message.mno}"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<input type="hidden" value="${_csrf.token}">
	<a href="/adaco/message/listReceiver"><button  class="btn btn-primary" style="float:right;">보낸 쪽지함 으로 이동</button></a>
	<button id="delete" class="btn btn-primary" style="float:right;">쪽지삭제</button>
</section>
</body>
</html>