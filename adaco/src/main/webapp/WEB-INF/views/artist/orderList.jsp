<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
 	#aside { 
 		width:100px;
		height:500px;
		float: left;
	} 
	#section {
	width: 750px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
/* 	#profile { */
/*       width:200px; */
/*       height:200px; */
/*    } */
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
     font-size: small;
  }
  th {
    background-color: #bbdefb;
  }
  
  #th{
  text-align: center;
  font-size: small;
  }
  
/*   td { */
/*     background-color: #e3f2fd; */
/*   } */

    ul#navi {
        width: 200px;
        text-indent: 10px;
        cursor:pointer;
	}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
        cursor:pointer;
	}
    li.group {
        margin-bottom: 3px;
	}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        cursor:pointer;
	}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        cursor:pointer;
	}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
        cursor:pointer;
	}
    ul.sub li:hover {
         background:#f4f4f4; 
	}
#menu {
	width: 180px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
    
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
                $(this).slideUp("fast");
            }
        });

        //현재 요소의 다음 요소를 보이게 합니다.
        $(this).next("ul").slideDown("fast");

    })
});

	// select box에 주문상태 값 받아오기
	$(function() {
		var $orderstate = $("#orderstate").val(); 
		var $select = $(".State").find("option");
// 		$orderstate.each(function(){
			
		$select.each(function(idx, option) {
		if($(option).text()==$orderstate) {
		$($select[idx]).prop("selected", true);
		}
		});
			
// 		})
	});
	
		// select box값으로 주문상태 변경
		$(function() {
			
			$("#OrderState").on("change", function() {
		
			var choice = $("#OrderState").val();
			var $orderstate = $("#orderstate").val(); 
			var $select = $("#OrderState").find("option");
			
			$select.each(function(idx, option) {
			if(choice!="주문상태 선택") {
			$("#orderstate").val(choice);
			$("#orderstate").prop("disabled", true);
			}
			if(choice=="주문상태 선택") {
			alert("주문상태를 선택해주세요");
			}
			})
		});

		});

	// '저장'버튼으로 주문상태만 수정
// 	$("#update_Btn").on("click", function() {
// 		var $orderstate = $("#orderstate").val();
// 		var params = {
// 			_method: "put",
// 			_csrf: "${_csrf.token}",
// 			orderno : ${OrderDto.DtoForList.orderno},
// 			orderstate: $orderstate
// 		};
// 		console.log(orderno);
// 		console.log(params);
// 		alert("SS");
		
// 		$.ajax({
// 			url: "/adaco/artist/updateOrderDetail",
// 			method: "post",
// 			data: params
// 		}).done(()=>{alert("주문상태가 변경 되었습니다.");})
// 		.fail(()=>{alert("주문상태 변경이 실패했습니다.");});
// 	})



$(function(){
	$("#search").on("click", function(){
		var username = $("#username").val();
		location.href = "/adaco/admin/artist_list?username="+username	
// 		adaco/art/listByArtist?category="+category;
	});
// 	$(".category").on("change", function(){
// 		var $category = $(".category").val();
// 		if($category == "유저")
// 			location.href = "/adaco/admin/user_list"
// 		if($category == "아티스트")
// 			location.href = "/adaco/admin/artist_list"
// 	});
});	
	
</script>
</head>
<body>
<aside id="asideMain">
   <div id="aside">
<!--       <div id="profile"> -->
<!--       </div> -->
      <div class="col-sm-3">
				<h3>MY Menu</h3>
				<ul class="list-group" id="menu">
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/shopPage"
						style="color: black; text-decoration: none;">상점 정보</a></li>
					<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;">
							작품 관리
							</a>
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
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/artistRead"
						style="color: black; text-decoration: none;">내 정보 관리</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/orderList"
						style="color: black; text-decoration: none;">판매내역</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="#" style="color: black; text-decoration: none;">메세지함</a></li>
					<li class="list-group-item list-group-item-action"><a
						href="/adaco/artist/sales"
						style="color: black; text-decoration: none;">매출 관리</a></li>
				</ul>
			</div>
   </div>
   </aside>
 <section id="section">
<%--  ${page.orderList } --%>
<h3>주문 목록</h3>
<!-- <hr> -->
	<div id="idSearch" style="float:right;">
	<input type="text" id="username" name="username" placeholder="구매자 ID 검색">
	<button type = "button" id = "search">검색</button>
	</div>
<!-- 	<div> -->
<!-- 		<select class="category"> -->
<!-- 				<option value="선택">선택</option> -->
<!-- 				<option value="유저">모든 유저</option> -->
<!-- 				<option value="아티스트">판매자</option> -->
<!-- 		</select> -->
<!-- 	</div> -->
	<br><br>	
	<form role="form" method="post" autocomplete="off">
	<table>
		<colgroup>
				<col width="13%">
				<col width="15%">
				<col width="12%">
				<col width="10%">
				<col width="27%">
				<col width="12%">
				<col width="12%">
			</colgroup>
<%-- 	 <caption><strong><h3>주문 목록</h3></strong></caption> --%>
		<thead id="th">
			<tr>
				<th>주문 번호</th>
				<th>주문일</th>
				<th>구매자 ID</th>
				<th>수취인</th>
				<th>작품명/옵션</th>
				<th>총 결제액</th>
				<th>주문 상태</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items="${page.orderList}" var = "list">
			<tr>
				<td><a href="/adaco/artist/orderDetail?orderno=${list.orderno}">${list.orderno }</a></td>
				<td>${list.orderDateStr}</td>
				<td>${list.username}</td> 
				<td>${list.recipient}</td> 
				<td>${list.artName} / ${list.optionName}:${list.optionValue}</td>
				<td>${list.price+list.shippingCharge}</td> 
				<td>${list.orderstate}
<!-- 					<select id="OrderState" class="State"> -->
<!-- 						<option selected="selected">주문상태 선택</option> -->
<!-- 						<option>입금대기</option> -->
<!-- 						<option>입금완료</option> -->
<!-- 						<option>배송준비중</option> -->
<!-- 						<option>배송중</option> -->
<!-- 						<option>배송완료</option> -->
<!-- 					</select>  -->
<%-- 					<input type="text" class="state" name="orderstate"  id="orderstate" value="${list.orderstate}"  style="width:100px"/> --%>
				</td> 
			</tr>					
		</c:forEach>
		</tbody>
	</table>
	</form>
		<div class="inputArea" align="center">
			<button type="button" id="update_Btn">변경</button>
		</div>
 	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${page.prev==true}">
				<li><a href="/adaco/artist/orderList?pageno=${page.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
				<c:choose>
					<c:when test="${page.pageno eq i }">
						<li class="active">
							<a href="/adaco/artist/orderList?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/artist/orderList?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.next==true}">
				<li><a href="/adaco/artist/orderList?pageno=${page.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	</section>
</body>
</html>