
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

#my {
	width: 750px;
	padding: 0px;
	height: 80px;
	background-color: gray;
	margin: 0px;
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
   #state{
   	font-size: small;
   }
     #section {
   width: 730px;
   padding: 5px;
   float: right;
   min-height: 600px;
   }
    table, th, td {
        border: 1px solid #bcbcbc;
        text-align: center;
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
					<strong><a href="/adaco/user/mypage" style="text-decoration: none; color: black;">
						MY Menu</a></strong>
				</h3>
				<ul class="list-group" id="navi">
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/read" style="color: black; text-decoration: none;">내 정보 보기</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/questionList" style="color: black; text-decoration: none;">문의내역</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/orderList" style="color: black; text-decoration: none;">주문내역</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/reviewList" style="color: black; text-decoration: none;">내 리뷰 보기</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/favoriteList" style="color: black; text-decoration: none;">즐겨찾기 목록</a></li>
					<li class="list-group-item list-group-item-action"><a href="/adaco/user/pointList" style="color: black; text-decoration: none;">포인트함</a></li>
					<li class="list-group-item list-group-item-action" id="group">
						<div class="title">
							<a style="color: black; text-decoration: none;">
							메시지함
							</a>
						</div>
						<ul class="sub"> 
							<li>
								<a href="/adaco/message/listSender" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 보낸 쪽지함</a>
							</li>
							<li>
								<a href="/adaco/message/listReceiver" style="color: black; text-decoration: none;" >
									<i class="fas fa-angle-right" style="opacity: 0.5;"></i> 받은 쪽지함</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
</aside>
   <section id="section">
   <h3>주문 내역</h3>
   <hr>
   <table>
      <colgroup>
            <col width="10%">
            <col width="20%">
            <col width="40%">
            <col width="10%">
            <col width="10%">
            <col width="20%">
         </colgroup>	
      <thead>
         <tr id="thead">
            <th>번 호</th>
            <th>주 문 일 자</th>
            <th>작 품 명</th>
            <th>금 액</th>
            <th>배 송 비</th>
            <th>주 문 상 태</th>
         </tr>
      </thead>
      
      <tbody id = "list">
      <c:forEach items="${page.orderList}" var = "list">
                <tr>
                	<td>${list.orderno }</td>
                	<td>${list.orderDateStr}</td>
                	<td><a href="/adaco/user/orderRead?orderno=${list.orderno }">${list.artName }</a></td>
                	<td>${list.artPrice }</td>
                	<td>${list.shippingCharge }</td>
                	<td id="state">${list.orderstate }</td>
                </tr>
                
      </c:forEach>
      </tbody>
   </table>
     <div style="text-align:center;">
      <ul class="pagination">
         <c:if test="${page.prev==true}">
            <li><a href="/adaco/user/orderList?pageno=${page.startPage-1}">이전</a></li>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                  <li class="active" style="text-align: center;">
                     <a href="/adaco/user/orderList?pageno=${i}">${i}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li><a href="/adaco/user/oderList?username=&pageno=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>	
            
         </c:forEach>
         <c:if test="${Page.next==true}">
            <li><a href="/adaco/order/list?username=${page.endPage+1}">다음</a></li>
         </c:if>
      </ul>
   </div>
   </section>
</div>
</body>
</html>