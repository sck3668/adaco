<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#delete{
	margin-right: 30px;
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
			mnos: ar,
			_method: 'patch',
			_csrf:"${_csrf.token}"
		}
		console.log(params);
		alert("ss");
		$.ajax({
			url:"/adaco/message/isReciverMessage",
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
		<div>
			<ul>
				<li><a href="/adaco/user/read" style="color: black;">내정보보기</a></li>
				<li><a href="/adaco/user/orderList"style="color: black;">주문내역</a></li>
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
	 <div>
	<h1>받은쪽지함</h1>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th><th>보낸사람</th><th>제목</th><th>보낸날짜</th><th>읽음여부</th><th></th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="message">
					<tr>
						<td>${message.mno }</td>
						<td>${message.sendId }</td>
						<td><a href="/adaco/message/read?mno=${message.mno }">${message.title}</a></td>
						<td>${message.writeDate }</td>					
						<td>
							<c:choose>
								<c:when test="${message.msgCheck==true }">O</c:when>
								<c:otherwise>X</c:otherwise>
							</c:choose>
						</td>
						<td><input type="checkbox" class="mno" value="${message.mno}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br><br><br><br><br><br><br><br><br><br>
		<input type="hidden" value="${_csrf.token}">
		<a href="/adaco/message/listSender"><button  class="btn btn-primary" style="float:right;">보낸 쪽지함 으로 이동</button></a>
		<button id="delete" class="btn btn-primary" style="float:right;">쪽지삭제</button> 
	</div>
	</section> 
</body>
</html>