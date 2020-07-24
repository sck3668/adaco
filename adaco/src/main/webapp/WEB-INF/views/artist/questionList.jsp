<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	#section {
	width: 700px;
	padding: 5px;
	float: right;
	min-height: 600px;
}

#my {
	width: 750px;
	padding: 0px;
	height: 80px;
	background-color: gray;
	margin: 0px;
}

.list {
	margin-top: 0px;
	padding-top: 0px;
	display: inline-block;
	width: 240px;
	height: 50px;
	border: 1px solid red;
}

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

li.group {
	margin-bottom: 3px;
}

li.group div.title {
	height: 35px;
	line-height: 35px;
	/*         background:#9ab92e; */
	cursor: pointer;
}

ul.sub li {
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	/*         background:#f4f4f4; */
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: #f4f4f4;
</style>
<script>
$(function(){
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
		</div>
	</aside>
	<section id="section">
		<div>
		<h1>1:1 문의목록</h1>
   		  <table class="table table-hover">
               <colgroup>
				<col width="10%">
				<col width="30%">
				<col width="8%">
				<col width="20%">
				<col width="20%">
			</colgroup>
		<thead>
			<tr style="text-align: center;">
				<th>문의번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items = "${questionPage.adminQuestionList}" var = "question">
			<tr style="text-align: center;">
				<td>${question.qno}</td>
				<td><a href="/adaco/admin/question_read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writer}</td>
				<td>${question.writeDateStr}</td>
				<td>${question.state}</td>
			</tr>	
		</c:forEach>
		</tbody>
       </table>
	
		  <ul class="pagination" style="text-align: center; margin: 0 auto; width: 0px; text-align: center;">
		<c:if test="${questionPage.prev==true}">
			<li class="page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/user/questionList?searchType=${questionPage.state}&writer=${questionPage.search }&pageno=${questionPage.startPage-1}">이전</a></li>
		</c:if>
		<c:forEach begin="${questionPage.startPage}" end="${questionPage.endPage}" var="i">
			<c:choose>
				<c:when test="${questionPage.pageno eq i }">
					<li class="page-item active">
						<a class = "page-link" href="/adaco/user/questionList?pageno=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class = "page-item"><a class = "page-link" href="/adaco/user/questionList?searchType=${questionPage.state}&writer=${questionPage.search }&pageno=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${questionPage.next==true}">
			<li class = "page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/user/questionList?searchType=${questionPage.state}&writer=${questionPage.search }&pageno=${questionPage.endPage+1}">다음</a></li>
		</c:if>
	</ul>
	</div>
	</section>
</div>
</body>
</html>