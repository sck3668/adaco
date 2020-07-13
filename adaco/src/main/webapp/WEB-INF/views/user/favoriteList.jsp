<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	    
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
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
<sec:authorize access="isAuthenticated()">
	<script>
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		var isLogin = false;
		var loginId = undefined;
	</script>
</sec:authorize>
<script>
	$(function(){
			$("#delete").on("click",function(){
			console.log($(this).next().val());
			var params={
					_method:"delete",
					_csrf:"${_csrf.token}",	
					favno :$(this).next().val()
			}
			console.log(params)
			$.ajax({
				url:"/adaco/user/favoriteDelete",
				data:params,
				method:"post"
			}).done((r)=>{console.log(r),location.href="/adaco/user/favoriteList"})
			  .fail((r)=>{console.log(r)})
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
				<li><a href="/adaco/order/list"style="color: black;">주문내역</a></li>
				<li><a href="/adaco/user/reviewList" style="color: black;">내리뷰보기</a></li>
				<li><a href="/adaco/user/favoriteList" style="color: black;">즐겨찾기목록</a></li>
				<li><a href="/adaco/user/pointList" style="color: black;">포인트함 </a>
				<li><a href="/adaco/user/messageList" style="color: black;">메세지함</a>
			</ul>
		</div>
	</div>
	</aside>
	<form action = "/adaco/user/favoriteDelete" method="post">
	<section id="section">
	
		 <div>
   <h1>즐겨찾기함</h1>
      <table class="table table-hover">
         <thead>
         <tr>
            <th>번호</th><th>상품번호</th><th>상품명</th><th>상품가격</th><th></th>
            <%-- <td><a href="/adaco/board/read?bno=${board.bno}" onclick="openWin()">${board.title}</a></td> --%>
         </tr>
         </thead>
         <tbody>
         <c:forEach items="${favorite }" var="list">
      		<tr class="tr"> 
                  <td>${list.favno }</td>
                  <td>${list.artno }</td>
                  <td><a href="/adaco/art/readByUser?artno=${list.artno }">${list.artName }</a></td>               
                  <td>${list.price }</td>
            	<td>
            		<button type="button" id="delete" class="btn btn-info">삭제</button>
            		<input type="hidden" value="${list.favno}">
            	</td>
           </tr>
          </c:forEach>
         </tbody>
      </table>
      <br><br><br><br><br><br><br><br><br><br><br>
   </div>		
	</section>
	</form>
	
	</div>
	
</body>
</html>