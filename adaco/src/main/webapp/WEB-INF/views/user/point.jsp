<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	span{
		font-size: xx-large;
	}
	strong{
		font-size: xx-large;	
	}
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
   <h1>포인트</h1>
   
   <strong>포인트 합계:</strong>&nbsp;&nbsp;<span>${totalPoint }</span>
   
      <table class="table table-hover">
         <thead>
         <tr>
            <th>적립일</th><th>적립금</th><th>적립만료일</th>
         </tr>
         </thead>
         <tbody> 
         	<c:forEach items="${point}" var="list">
         	<tr>
         	      <td>${list.startDateStr }</td>
                  <td>${list.point }</td>
           	      <td>${list.endDateStr }</td>
           </tr> 
			 </c:forEach>
         </tbody>
      </table>
      <br><br><br><br><br><br><br><br><br><br><br>
   </div>
	</section>
	</div>
</html>