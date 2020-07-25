<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>작가 작품 목록</title>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	th {
		background-color: #bbdefb;
		text-align: center;
	}

</style>
<script>
</script>
</head>
<body>
<%-- ${orderDetail} --%>
	<h4>주문상세정보</h4>	
	<hr>
	<h5 style="float:left;">주문 상세 정보</h5>	<p style="float:right;">작품 주문 번호 ${orderDetail.orderno}</p> 
	<div id="totalWarp">
    	<table class="table"><!-- 주문상세정보 테이블 -->
         	<colgroup>
				<col width="15%">
				<col width="30%">
				<col width="15%">
				<col width="30%">
			</colgroup>
           	<tr>
				<th>작품명/옵션 </th>
				<td colspan="3">${orderDetail.artName} | ${orderDetail.optionName} : ${orderDetail.optionValue}</td>
			</tr>
			<tr>
				<th>주문 수량</th>
				<td colspan="3">${orderDetail.amount}</td> 
			</tr>
			<tr>
				<th>주문 일자</th>
				<td>${orderDetail.orderDateStr}</td> 
				<th>주문 상태</th> 
				<td>${orderDetail.orderstate}</td> 
			</tr>
			<tr>
			</tr>
			<tr>
				<th>작품 금액</th>
				<td colspan="3">${orderDetail.price}</td>
			</tr>
			<tr>
				<th>주문요청사항 </th>
				<td colspan="3">${orderDetail.request}</td>
			</tr>
      	</table>
      	<br>
      	<h5>배송지 정보</h5>
      	<table class="table"><!--배송지 정보 테이블 -->
           	<colgroup>
				<col width="15%">
				<col width="75%">
			</colgroup>
              <tbody>
              <tr>
                  <th>받는분</th>
                  <td>${orderDetail.recipient}</td>
              </tr>
              <tr>
                  <th>전화번호</th>
                  <td>${orderDetail.tel}</td>
              </tr>
              <tr>
                  <th>배송지</th>
                  <td>${orderDetail.address}</td>
              </tr>
              </tbody>
       </table>
       <br>
      	<h5>결제 정보</h5>
      	<table class="table"><!-- 결제 정보 테이블 -->
         	<colgroup>
				<col width="30%">
				<col width="30%">
				<col width="30%">
			</colgroup>
			<thead id="th">
				<tr>
					<th>결제 방법</th>
					<th>결제일</th>
					<th>결제 금액</th>
				</tr>
			</thead>
			<tbody>
           	<tr>
				<td>무통장 입금</td><!-- ${artPageByUser.price } -->
				<td>${orderDetail.orderDateStr}</td> <!-- ${artPageByUser.price } -->
				<td>${orderDetail.price*orderDetail.amount+orderDetail.shippingCharge}원</td> 
			</tr>
			</tbody>
      	</table>
      	<br>
      <%-- 	<h5>환불 정보</h5>
      	<table class="table"><!-- 환불 정보 테이블 -->
         	<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead id="th">
				<tr>
					<th>결제 방법</th>
					<th>결제일</th>
					<th>결제 금액</th>
					<th>환불 금액</th>
					<th>환불 계좌</th>
				</tr>
			</thead>
			<tbody>
           	<tr>
				<td>무통장 입금</td><!-- ${artPageByUser.price } -->
				<td>${orderDetail.orderDateStr}</td>
				<td>${orderDetail.price+orderDetail.shippingCharge}원</td> 
				<td>${orderDetail.price+orderDetail.shippingCharge}원</td> 
				<td>${orderDetail.refundAccount}</td>
			</tr>
			</tbody>
      	</table> --%>
      	
    </div><!-- totalWrap /div -->
</body>
</html>