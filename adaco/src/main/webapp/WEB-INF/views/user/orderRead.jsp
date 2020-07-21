
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
	.orderDetail{
		width: 450px;
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
	

});   
</script>
</head>
<body>
${orderDetail }
 <aside id="asideMain">
   <div id="aside">
      <div id="profile">
      </div>
      <div>
     
      </div>
   </div>
   </aside>
   <body>
	<h4>작품주문정보조회</h4>	
	<hr>
	<h5 style="float:left;">주문 상세 정보</h5>	<p style="float:right;">
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
				<td colspan="3">${orderDetail.optionName }</td><!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>주문 수량</th>
				<td colspan="3"> ${orderDetail.amount }개</td> <!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>주문 상태</th> 
				<td>${orderDetail.orderstate } </td> <!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>작품 금액</th>
				<td colspan="3">${orderDetail.price }원</td>
				<!-- ${artPageByUser.price } -->
			</tr>
			<tr>
				<th>적립금</th>
				<td>${orderDetail.addPoint }P</td>			
			</tr>
			<tr>
				<th>요청사항</th>
				<td>${orderDetail.request }</td>
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
                  <td>${orderDetail.recipient }</td><!-- ${artPageByUser.price } -->
              </tr>
              <tr>
                  <th>전화번호</th>
                  <td>${orderDetail.tel }</td><!-- ${artPageByUser.price } -->
              </tr>
              <tr>
                  <th>배송지</th>
                  <td>${orderDetail.address }</td><!-- ${artPageByUser.price } -->
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
					<th>결제 금액 </th>
					<th>배송비</th>
					<th>총 결제금액</th>
				</tr>
			</thead>
			<tbody>
           	<tr>	
				<td>${orderDetail.price}</td> <!-- ${artPageByUser.price } -->
				<td>${orderDetail.shippingCharge}</td>
				<td>${orderDetail.shippingCharge+orderDetail.price }</td>
			</tr>
			</tbody>
      	</table>
      	<br>
      <%-- 	<h5>d환불 정보</h5>
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
				<td></td><!-- ${artPageByUser.price } -->
				<td></td> <!-- ${artPageByUser.price } -->
				<td></td> <!-- ${artPageByUser.price } -->
				<td></td> <!-- ${artPageByUser.price } -->
				<td></td> <!-- ${artPageByUser.price } -->
			</tr>
			</tbody>
      	</table> --%>
    </div><!-- totalWrap /div -->
</body>
</body>
</html>