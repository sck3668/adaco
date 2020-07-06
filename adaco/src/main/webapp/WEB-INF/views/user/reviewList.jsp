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