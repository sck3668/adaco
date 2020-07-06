<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
 <style>
	#aside {
		width:200px;
		height:500px;
		background-color: white;
		border: 1px solid red;
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
		console.log(${favorite})
		console.log($favno)
		$("#delete").on("click",function(){
			var params={
					_method:"put",
					_csrf:"${_csrf.token}",
					favno : 1
			}
			
			console.log(params)
			$.ajax({
				url:"/adaco/user/favoriteDelete",
				data:params,
				method:"post"
			}).done((r)=>{console.log(r)})
			  .fail((r)=>{console.log(r)})
		})//ㄴㄴ
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
				<li><a href="/adaco/user/read">내정보보기</a></li>
				<li><a href="/adaco/user/">주문내역</a></li>
				<li><a href="/adaco/user/reviewList">내리뷰보기</a></li>
				<li><a href="/adaco/user/favoriteList">즐겨찾기목록</a></li>
				<li><a href="/adaco/user/messageList">메세지함</a></li>
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
            
         </tr>
         </thead>
         <tbody>
         <c:forEach items="${favorite }" var="list">
      		<tr> 
                  <td>${list.favno }</td>
                  <td>${list.artno }</td>
                  <td>${list.artName }</td>               
                  <td>${list.price }</td>
            <td><button type="button" id="delete" class="btn btn-info">삭제</button></td>
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