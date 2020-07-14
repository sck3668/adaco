<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
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
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#profile {
      width:200px;
      height:200px;
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
/*   td { */
/*     background-color: #e3f2fd; */
/*   } */
    </style>
<script type="text/javascript">
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
            <li><a href="/adaco/order/artistSellList"style="color: black; text-decoration: none;">판매내역</a></li>
            <li><a href="/adaco/artist/shopPage" style="color: black; text-decoration: none;">내상점보기</a></li>
            <li><a href="/adaco/#" style="color: black; text-decoration: none;">메세지함</a></li>
            <li><a href="/adaco/artist/sales" style="color: black; text-decoration: none;" >매출 관리</a></li>
            <li><a href="/adaco/story/writeStory" style="color: black; text-decoration: none;" >스토리 작성</a></li>
             <li><a href="/adaco/art/write" style="color: black; text-decoration: none;" >작품 등록</a></li>
         </ul>
      </div>
   </div>
   </aside>
 <section id="section">
<h3>주문 목록</h3>
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
	<table>
		<colgroup>
				<col width="6%">
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
			</colgroup>
	 <caption><strong><h3>주문 목록</h3></strong></caption>
		<thead>
			<tr>
				<th>번호</th>
				<th>주문일자</th>
				<th>작품명</th>
				<th>금액</th>
				<th>배송비</th>
				<th>주문상태</th>
			</tr>
		</thead>
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
	</section>
</body>
</html>