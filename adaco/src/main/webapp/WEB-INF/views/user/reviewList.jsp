<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="EUC-KR">
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
		border: 1px solid red;
	}
</style>
<script>
$(function(){
	$("#delete").on("click",function(){
	var parmas={
			_method : "put",
			_csrf:"${_csrf.token}",
			rno:$(this).next().val()
	}
		console.log(parmas)
	$.ajax({
		url:"/adaco/user/reviewDelete",
		method:"post",
		data:parmas
	}).done((r)=>{console.log(r),location.href="/adaco/user/reviewList"})
	  .fail((r)=>{console.log(r)})
	})
})
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
})

</script>
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
   <h1>리뷰리스트</h1>
      <table class="table table-hover">
         <thead>
         <tr>
            <th>번호</th><th>상품</th><th>내용</th>
         </tr>
         </thead>
         <tbody>
          <c:forEach items="${Review}" var="list">
      		<tr> 
                  <td>${list.rno }</td>
                  <td>${list.artno }</td>
                  <td>${list.content }</td>
                  <td><button type="button" id="delete">삭제</button>
                  	  <input type="hidden" value="${list.rno }">
                  </td>
           </tr>
          </c:forEach>
         </tbody>
      </table>
      <br><br><br><br><br><br><br><br><br><br><br>
   </div>		
			
	</section>
	</div>
</body>
</html>