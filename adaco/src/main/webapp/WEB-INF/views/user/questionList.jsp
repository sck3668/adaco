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
				<li><a href="/adaco/order/read"style="color: black;">주문내역</a></li>
				<li><a href="/adaco/user/reviewList" style="color: black;">내리뷰보기</a></li>
				<li><a href="/adaco/user/favoriteList" style="color: black;">즐겨찾기목록</a></li>
				<li><a href="/adaco/user/pointList" style="color: black;">포인트함 </a>
				<li><a href="/adaco/user/messageList" style="color: black;">메세지함</a>
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
      <br><br><br><br><br><br><br><br><br><br><br>
   </div>		
			
	</section>
	</div>
</body>
</html>