<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#button{
	text-align: center;
	width: 800px;
	hight: 800px;
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
$(function(){
	var text = ${order.price*0.01}+"";
	text = text.split(".");
	console.log(text[0]);
	$("#ddd").text(text[0]+"원");
	})
//       var test = $("#ddd").text();
//     	test = test.split(".");
//       	console.log(test[0]);
//       	alert(test[0]);


</script>

</head>
<body>
${order } <br>
${order_detail} <br>
${art} <br>
${option } 

우편 번호 : ${order_detail.postalcode }
<div>
	<section>
	<div id="ByALl">
		<h3>주문이 정상적으로 완료 되었습니다.</h3>
		<hr width="2500px;">
		<h4>주문 상품/배송지 정보</h4>
		<p>주문 날짜:${order.orderDateStr}&nbsp;|&nbsp;주문 번호:${order.orderno}</p>
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
					<tr> 
						<td style="vertical-align: middle;"><a href="/adaco/art/readByUser?artno=${order.artno}"><img src="${order.mainImg }" width="150px" height="120px" ></a> ${order.artName}<br>옵션 :  ${order.optionValue }</td>
						<td>  ${order.amount}개</td>
						<td> ${order.price}원</td>
						<td id="ddd"></td>
						<td>${order.shippingCharge}</td>
						<td> ${order.shippingCharge+order.price}원</td>
					</tr>
				</tbody>
			</table>
	</div>	
	</section>
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
						<td><span>${order.originalAddress}원</span></td>	
					</tr>
					<tr>
						<th>배송 메세지</th>
						<td><span>${order.request}</span></td>
					</tr>
				</thead>
			</table>
	</div>
</div>
		<div id="button">
			<a href="/adaco/"><button type="button" class="btn btn-primary" >
				쇼핑 계속하기
			</button></a>
		</div>
		
</body>
</html>