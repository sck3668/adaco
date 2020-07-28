<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h3{
	text-align: center;
}

p{
	text-align: right;
}

table {
	width: 100%;
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
	text-align: center;
}

th{
 	padding: 10px; 
}

th {
	background-color: #bbdefb;
}
/*    td {  */
/*      background-color: #e3f2fd;  */
/*    }  */

.main {
	width : 800px;
	hight: 800px;
}

/*  #button{  */
/*  	text-align: center;  */
/*  	width: 800px;  */
/*  	hight: 800px;  */
/*  }  */

 ol {
     list-style:none; 
     margin:0; 
     padding:0; 
     float:right;
} 

 li { 
   display:inline
 } 


</style>

<script>
// function Test(){
// var pnum = $("#price");

// 	alert(Math.floor(pnum));
	
		
// $("#price").Math.floor("#price");
// $("#price").Math.floor(price);
// 	console(price);
// 	console("#price");
// 	console(Math.floor);

// alert ("price.Math.floor(0)");
// console("Math.floor(0)");
// var b = price
// alert(Math.floor(price));
// console(price.Math.floor(price));
// Math.floor(0);

// }

// 	소수점자리 제거
// $(function(){
// 	var text = ${order.price*0.01}+"";
// 	text = text.split(".");
// 	console.log(text[0]);
// 	$("#ddd").text(text[0]+"원");
// 	})
//       var test = $("#ddd").text();
//     	test = test.split(".");
//       	console.log(test[0]);
//       	alert(test[0]);

// 결제창에서 주문상세로 이동
	$("#orderRead").on("click",function(){
		
		var params  ={
			_csrf: '${_csrf.token}',
			username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
// 			orderno : ${ordering.orderno},
// 			orderDate: '${ordering.orderDate}',
// 			shippingCharge : '${ordering.shippingCharge}',
			orderno:${artPageByUser.orderno},
			totalPrice:${artPageByUser.price},
			amount:1, 
			//optionName:'${artPageByUser.optionName}',
			optionName:$("#optionName").val(),
			optionValue:'${artPageByUser.optionValue}',
			optionStock:${artPageByUser.optionStock}, 
			optionPrice:'${artPageByUser.optionPrice}', 
		
		};
			$.ajax({
				url:"/adaco/order/orderRead",
				method:"post",
				data:params,
				success:function(result) {
					location.href="/adaco/order/orderRead?orderno="+result;
				}
			});
		}) ;


</script>

</head>
<body>
	<div id="ByALl">
		<div>
		<h2>주문이 정상적으로 완료 되었습니다.</h2>
		 <ol class="page-location fr">
            <li>
               <em class="icon-num">1</em>
               <span>장바구니</span>
                <i class="fa fa-angle-right"></i>
            </li>
            <li class="active" >
               <em class="icon-num">2</em>
               <span >주문결제</span>
               <i class="fa fa-angle-right"></i>
             </li>
             <li style="color:blue;">
                <em class="icon-num">3</em>
                <span >주문완료</span>
              </li>
          </ol>
        </div>
        <br>
			<hr width="1500px;">
			
<!-- 		상품 정보		 -->
	<div>
		<div>
		<h4>주문 상품/배송지 정보</h4>
		</div>
		<p>주문 날짜:&nbsp;|&nbsp;주문 번호:</p>
			<table>
				<colgroup>
					<col width="520px">
					<col width="90px">
					<col width="90px">
					<col width="90px">	
					<col width="90px">	
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품금액</th>
						<th>적립금</th>
						<th>배송비</th>
						<th>총 주문금액</th>
					</tr>
				</thead>								
				<tbody>
					<c:forEach items="${order.detailList}" var="detail" varStatus="status">
					<tr> 
						<td style="vertical-align: middle;"><a href="/adaco/art/readByUser?artno=${detail.artno}"><img src="" width="150px" height="120px" ></a> ${detail.artName}<br>${detail.optionName} :  ${detail.optionValue}</td>
						<td>${detail.amount}개</td>
						<td>${detail.price}원</td>
						<td>${detail.price*detail.amount*0.01 }</td>
						<td>${order.orderList[status.index].shippingCharge}</td>
						<td>${order.orderList[status.index].shippingCharge+(detail.price*detail.amount)}원</td>
					</tr>
					<tr>
						<th>배송 메세지</th>
							<c:forEach items="${order.requestList}" var="detail" begin="0" end="0">
								<td colspan="6"><span>${order.requestList[status.index]}</span></td>
							</c:forEach>
					</tr>
					<br>
					</c:forEach>
				</tbody>
			</table>
	</div>	
	<br><br>
<!-- 	배송지 정보   -->
	<table>
				<thead>
					<tr>
						<th>계좌번호</th>
						<td><span>1002-645-004351(예금주: 주식회사 핸드스토리)</span></td>
						 
					</tr>
					<tr>
						<th>입금 은행</th>
						<td><span>우리은행</span></td>	
					</tr>
					<tr>
						<th>입금기한</th>
						<td><span>주문일로부터 3일</span></td>
					</tr>
				</thead>
			</table>
	<div id="shipping">
		<h4>배송지 정보</h4>
			<table>
				<thead>
					<tr>
						<th >받는분</th>
						<td><span>${order.recipient}</span></td>
					</tr>
					<tr>
						<th>배송지</th>
						<td><span>${order.address}</span></td>	
					</tr>
				</thead>
			</table>
	</div>
</div>
<br>
		<div id="button" align="center" style="position: relative; right: -250px; bottom:-25px;">
			<fieldset>
			<a href="#"> 
			<button class="btn btn-primary" id="orderRead">주문 내역 상세 보기</button>
			</a>
			<a href="/adaco/"><button type="button" class="btn btn-primary">
				쇼핑 계속하기</button></a> 
			</fieldset>
		</div><br><br><br><br><br><br><br>
</body>
</html>