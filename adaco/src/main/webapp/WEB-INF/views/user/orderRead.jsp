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
	#detail{
		width:500px;
		float: right;
		
	}
   	.first {
		background-color: #f3f3f3;
		text-align: center;
		width: 100px;
	}
	.orderDetail{
		width: 450px;
	}
   
   #aside {
   width:110px;
   height:500px;
   background-color: gray;
   float: left;
  }
     #section {
   width: 850px;
   padding: 5px;
   float: right;
   min-height: 600px;
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
   
   
   
   #orderMain {
   }
   </style>
<script type="text/javascript">
$(function(){
   $("#search").on("click", function(){
      var username = $("#username").val();
      location.href = "/adaco/order/list?username="+username   
   });
   $(".category").on("change", function(){
      var $category = $(".category").val();
    /*   if($category == "유저")
         location.href = "/adaco/order/list"
      if($category == "아티스트")
         location.href = "/adaco/order/list" */
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
            <li><a href="/adaco/user/orderList"style="color: black;">주문내역</a></li>
            <li><a href="/adaco/user/reviewList" style="color: black;">내리뷰보기</a></li>
            <li><a href="/adaco/user/favoriteList" style="color: black;">즐겨찾기목록</a></li>
            <li><a href="/adaco/user/pointList" style="color: black;">포인트함 </a>
            <li><a href="/adaco/user/messageList" style="color: black;">메세지함</a>
         </ul>
      </div>
   </div>
   ${orderDetail }
   </aside>
   <body>
	<div>
		<img id="show_profile" height="200px;" src="${orderDetail.mainImg }">
	</div>
	<div>
	</div>
	<table class="table table-hover" id="detail">
		<tr>
		</tr>
		<tr>
			<td class="first">작품이름:</td><td colspan="2"><span class="orderDetail">${orderDetail.artName }</span></td>
		</tr>
		<tr>
			<td class="first">가격:</td><td colspan="2"><span class="orderDetail">${orderDetail.price }</span></td>
		</tr>
		<tr>
			<td class="first">옵션명:</td><td colspan="2"><span class="orderDetail">${orderDetail.optionName }</span></td>
		</tr>
		<tr>
			<td class="first">적립금</td><td colspan="2"><span class="orderDetail"></span>${orderDetail.addPoint }</td>
		</tr>
		<tr>
			<td class="first">상태</td><td colspan="2"><span class="orderDetail"></span>${orderDetail.orderState }</td>
		</tr>
		<tr>
<%-- 				<td class="first">상태</td><td colspan="2"><span class="orderDetail"></span>${orderDetail.adress}</td> --%>
		</tr>
		<tr><td class="first"></td>
			<td colspan="2">
			</td></tr>
	</table>
</body>
</body>
</html>