<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	
	#aside {
	width:110px;
	height:500px;
	background-color: gray;
	float: left;
  }
    table, th, td {
        border: 1px solid #bcbcbc;
  }  
      table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  th {
    background-color: #bbdefb;
  } 
   td { 
     background-color: #e3f2fd; 
   } 
   </style>
<script type="text/javascript">
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
	
$(function(){
	$("#search").on("click", function(){
		var username = $("#username").val();
		location.href = "/adaco/admin/artist_list?username="+username	
	});
	$(".category").on("change", function(){
		var $category = $(".category").val();
		if($category == "유저")
			location.href = "/adaco/admin/user_list"
		if($category == "아티스트")
			location.href = "/adaco/admin/artist_list"
	});
});	
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
	<h3>주문 내역</h3>
	<div>
	<input type="text" id="username" name="username" placeholder="사용자 검색">
	<button type = "button" id = "search">검색</button>
	</div>
	<div>
		<select class="category">
				<option value="선택">선택</option>
				<option value="유저">모든 유저</option>
				<option value="아티스트">판매자</option>
		</select>
	</div>	
	<section>
		<%-- <c:choose>
			<a>${user.username } 나오나? </a>
			<li>${order.orderno} 이러면?</li>
		</c:choose>		
	</section> --%>
	<table>
		<colgroup>
				<col width="6%">
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
			</colgroup>
	 <caption><strong> <h3>주문 내역</h3></strong></caption>
<!-- 		<thead> -->
<!-- 			<tr id="thead"> -->
<!-- 				<th>번호</th> -->
<!-- 				<th>주문일자</th> -->
<!-- 				<th>작품명</th> -->
<!-- 				<th>금액</th> -->
<!-- 				<th>배송비</th> -->
<!-- 				<th>주문상태</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
		<tbody id = "list">
		<c:forEach items="${order.orderno}" var = "artist">
			<tr>
				<td>${artist.orderDate}</td>
				<td><a href="/adaco/order_read?artName=${art.artName}">${art.artName}</a></td>
				<td>${art.price}</td>
				<td>${art.couriPrice}</td>
				<td>${orderdetail.state}</td>
			</tr>					
		</c:forEach>
		</tbody>
	</table>
 	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${artistPage.prev==true}">
				<li><a href="/adaco/admin/artist_list?pageno=${artistPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${artistPage.startPage}" end="${artistPage.endPage}" var="i">
				<c:choose>
					<c:when test="${artistPage.pageno eq i }">
						<li class="active">
							<a href="/adaco/admin/artist_list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/admin/artist_list?username=&pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${artistPage.next==true}">
				<li><a href="/adaco/admin/artist_list?username=${artistPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>