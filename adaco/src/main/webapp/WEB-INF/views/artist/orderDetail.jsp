<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>작가 작품 목록</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	th {
		background-color: #bbdefb;
	}

</style>
<script>
	
</script>
</head>
<body>
<%-- ${order} --%>
	<h4>작품주문정보조회</h4>	
	<hr>
	<h5 style="float:left;">주문 상세 정보</h5>	<p style="float:right;">작품 주문 번호 34545345</p> <!-- ${artPageByUser.price } -->
	<div id="totalWarp">
    	<table class="table"><!-- 주문상세정보 테이블 -->
         	<colgroup>
				<col width="15%">
				<col width="30%">
				<col width="15%">
				<col width="30%">
			</colgroup>
           	<tr>
				<th>작품/옵션명 </th>
				<td colspan="3">미니 선인장 클로란투스 세라믹화분</td><!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>주문 수량</th>
				<td colspan="3">1 개</td> <!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>주문 일자</th>
				<td>2020.11.22</td> <!-- ${artPageByUser.price } -->
				<th>주문 상태</th> 
				<td>결제 완료</td> <!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>구매자 ID</th>
				<td>leehj9999</td><!-- ${artPageByUser.price } -->
				<th>구매자명</th>
				<td>길동이</td><!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>작품 금액</th>
				<td colspan="3">12000원</td><!-- ${artPageByUser.price } -->
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
                  <td>하이하이</td><!-- ${artPageByUser.price } -->
              </tr>
              <tr>
                  <th>전화번호</th>
                  <td>01088883333</td><!-- ${artPageByUser.price } -->
              </tr>
              <tr>
                  <th>배송지</th>
                  <td>서울특별시 마포구 동교로 19길 12</td><!-- ${artPageByUser.price } -->
              </tr>
              </tbody>
       </table>
       <br>
      	<h5>결제 정보</h5>
      	<table class="table"><!-- 결제 정보 테이블 -->
         	<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
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
				<td>2020.11.19</td> <!-- ${artPageByUser.price } -->
				<td>12000원</td> <!-- ${artPageByUser.price } -->
			</tr>
			</tbody>
      	</table>
      	<br>
      	<h5>환불 정보</h5>
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
				<td>2020.11.19</td> <!-- ${artPageByUser.price } -->
				<td>12000원</td> <!-- ${artPageByUser.price } -->
				<td>12000원</td> <!-- ${artPageByUser.price } -->
				<td>879122545545</td> <!-- ${artPageByUser.price } -->
			</tr>
			</tbody>
      	</table>
      	
    </div><!-- totalWrap /div -->
</body>
</html>