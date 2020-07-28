<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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
   padding: 10px;
   text-align: center;
}

th {
   background-color: #bbdefb;
}
/*   td { */
/*     background-color: #e3f2fd; */
/*   } */

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
function printErrorMsg(target,msg) {
	target.text(msg).css("color","red").css("font-size","0.75em");
}

function checkRefundAccount() {
 	  $("#refundAccount_msg").text("");
 		$refundAccount = $("#refundAccount").val();
 		const patt = /^[0-9]{11,13}$/;
 		if($refundAccount.length==0)
 			return printErrorMsg($("#refundAccount_msg"),"환불계좌는 필수입력입니다");
 		if(patt.test($refundAccount)==false)
 			return printErrorMsg($("#refundAccount_msg"),"환불계좌는 숫자 11~13자리입니다");
 		return true;
 		};
 		
   $(function() {
      $("#detailAddress").on("blur",function() {
      const address = $("#address").val();
       const address2   = $("#detailAddress").val();
       const address3 = $("#extraAddress").val();
       const originalAddress = address + address2 + address3;
       $("#originalAddress").val(originalAddress);
      })
      
   $("#refundAccount").on("blur",function() {
	   checkRefundAccount();
   });
      
	$("#payment").on("click",function() {
		 var formData = new FormData(document.getElementById("paymentForm"));
		 console.log($("#paymentFrom").serialize());
		 if(checkRefundAccount()==true) {
			$("#paymentForm").submit();
		}
	})
	
	$("#back_Btn").on("click",function() {
		var ordernos = JSON.stringify(${order.ordernoList});
		var params = {
			_csrf: '${_csrf.token}',
			ordernos:ordernos
		};
		$.ajax({
			url:"/adaco/order/back",
			data:params,
			method:"post",
			success:function() {
				location.href="/adaco/";
			}
		})
	})
	
})
</script>
</head>
<body>
${order }
<form action="/adaco/order/after" id="paymentForm">
<div id="content" class="content" data-page="payment" data-address-page="payment" style="padding-bottom:0">
    <c:forEach items="${order.ordernoList}" var="orderno">    
        <input type="hidden" name="ordernos" value="${orderno}">
    </c:forEach>
	<c:forEach items="${order.artList}" var="art">
        <input type="hidden" name="artnos" class="artnos" value="${art.artno }" data-artno="${art.artno}">
        <input type="hidden" name="artistnos" value="${art.artistno }">
	</c:forEach>
        <input type="hidden" name="optno" value="${order.option.optno }">
        <div class="inner-w800"><!-- 주문고객/배송정보 큰 열린 div -->
            <div class="title-style clf"><!-- 주문결제 순서 열린 div -->
                <h2 class="txt fl">주문 결제하기</h2>
                <ol class="page-location fr">
                    <li>
                        <em class="icon-num">1</em>
                        <span>장바구니</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li class="active" style="color:blue;">
                        <em class="icon-num">2</em>
                        <span >주문결제</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <em class="icon-num">3</em>
                        <span >주문완료</span>
                    </li>
                </ol>
            </div><!-- 주문결제 순서 닫힌 div --><br>
                   <hr width="1500px;">

            <div class="layout-split" data-layout-split="payment"><!-- 주문고객/배송지정보 열린 div -->
 <!-- 주문고객 정보 -->
                <div class="ui_title--sub tab" data-ui-id="order_user"><!-- 주문고객정보 제목 열린 div -->
                    <h4>주문 고객 정보</h4>
                </div><!-- 주문고객정보 제목 닫힌 div -->
                     <table class="table-style-clear orderer-info" data-ui="tab-panel" data-panel-id="order_user">
                        <colgroup>
                     <col width="20%">
                     <col width="80%">
                  </colgroup>
                         <tbody>
                         <tr>
                             <th>주문자명</th>
                             <td style="text-align: left;">${order.user.irum }</td>
                         </tr>
                         <tr>
                             <th><em class="asterisk red">&lowast;</em> 전화</th>
                             <td style= "text-align: left;">
                                 <div class="body"><!-- 주문자 전화 열린 div -->
                                     ${order.user.tel }
<!--                                      <button type="button" id="telChange">변경하기</button> -->
                                 </div><!-- 주문자 전화 닫힌 div -->
                             </td>
                         </tr>
<!--                          <tr> -->
<!--                              <td colspan="2">주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</td> -->
<!--                          </tr> -->
                         </tbody>
                     </table><br>
<!-- 배송 정보 -->
                    
                    <h4>배송지 정보</h4>
                    <table>
                       <colgroup>
                     <col width="20%">
                     <col width="80%">
                  </colgroup>
                       <tr class="address-info item">
                          <th class="address-info item">
                              <em class="asterisk red">&lowast;</em>
                              <label for="user">받는분</label>
                          </th>
                          <td style= "text-align: left;" >
                             <input class="form-control" name="recipient" type="text" value="${order.user.irum }" style="width: 176px;">
                          </td>
                       </tr>
                       <tr class="address-info item">
                          <th class="address-info item">
                             <em class="asterisk red">&lowast;</em>
                                <label for="delivery_phone">전화번호</label>
                          </th>
                          <td style= "text-align: left;">
                             <input class="form-control"  style="width: 176px;" name="tel" type="text" value="${order.user.tel }">
                          </td>
                       </tr>
                       <tr>
                          <th>
                             <div class="ui_title--sub"><!-- 주소(배송지)텍스트 열린 div -->
                             <span class="ui_title__txt">주소 (배송지)</span>
                             </div><!-- 주소(배송지)텍스트 닫힌 div -->
                          </th>
                           <td style= "text-align: left;">
                           <div>
                        <input class="form-control"  style="width: 176px; display: inline;" type="text" id="postcode" placeholder="우편번호">
                        <input class="btn btn-primary" type="button" onclick="execDaumPostcode()" value="주소 찾기"><br><br></div>
                        <input class="form-control"  style="width: 176px;" type="text" id="address" placeholder="주소"><br>
                        <div>
                        <input class="form-control" type="text" id="detailAddress" placeholder="상세주소"style="width: 250px; display: inline;">
                        <input class="form-control" type="text" id="extraAddress" placeholder="참고항목" style="width: 250px; display: inline;">
                        </div>
                        <input type="hidden" name="originalAddress" id="originalAddress">
                         <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative"><!-- 이미지 열린div -->
                           <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div><!-- 이미지 닫힌div -->
                           </td>
                       </tr>
                    </table>
                 
<!--                  </div> -->
                  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>     
   </div><!-- 주문고객/배송정보 닫힌 div --> 
</div> <!-- 주문고객/배송정보 큰 닫힌 div -->                 
<br>
<!-- 주문작품 정보 -->
           <div class="segment--nospacing" data-ui="order-summary-label" style="margin-bottom: 100px;"><!-- 결제하기버튼까지 큰 열린 div -->
            <div class="ui_title--sub tab " data-ui-id="order_cart"><!-- 제목 열린 div -->
               <h4>주문 작품 정보</h4>
            </div><!-- 제목 닫힌 div -->
            <div data-ui="tab-panel" data-panel-id="order_cart" style=""><!-- ordercart 열린 div -->
            <c:forEach items="${order.artList}" var="art" varStatus="status">
            <table>
               <tr>
                  <c:forEach items="${order.writerList}" begin="0" end="0" var="writer">
                  <td class="txt-group" style= "text-align: left;"><b>${order.writerList[status.index]} 작가님</b></td>
                  </c:forEach>
               </tr>
            </table>
            <table>
               <colgroup>
                  <col width="15%">
                  <col width="30%">
                  <col width="10%">
                  <col width="10%">
                  <col width="10%">
               </colgroup>
               <thead>
                  <tr>
                     <th colspan="2" class="area-img" style= "text-align: center;">작품/옵션 정보</th>
                     <th style= "text-align: center;">작품 금액</th>
                     <th style= "text-align: center;">배송비</th>
                     <th style= "text-align: center;">주문금액</th>
                  </tr>
               </thead>
               <tbody id="list">
               <tr class="area-txt">
                  <td style="border-right: none; vertical-align: middle;">
                     <a href="/adaco/art/readByUser?artno=${art.artno }">
                        <img src="${art.mainImg}" width="130px" height="130px">
                     </a>
                  </td>
                  <td style= "text-align: left; border-left-style:none; border-top: none;">
                     <a href="/adaco/art/readByUser?artno=${art.artno }" style="text-decoration:none; color:black" title="${art.artName }">
                        <strong>${art.artName }</strong>
                     </a><br><br>
                  <c:forEach items="${order.bagList}" begin="0" end="0" var="bag">
                     <span>${order.bagList[status.index].optionName}:</span>
                          <span>${order.bagList[status.index].optionValue }</span>
                     <span> | 수량 : ${order.bagList[status.index].amount }개</span>
                     <span> | + ${order.bagList[status.index].optionPrice}원</span>
                  </c:forEach>
                  </td>
                  <td>
                  <c:forEach items="${order.bagList}" begin="0" end="0" var="bag">
                     ${order.bagList[status.index].totalPrice + order.option.optionPrice*order.bag.amount}원
                  </c:forEach>
                  </td>
                  <td>
                     ${art.couriPrice}원
                  </td>
                  <td>
                  <c:forEach items="${order.bagList}" begin="0" end="0" var="bag">
                     ${order.bagList[status.index].amount*(art.price+order.bagList[status.index].optionPrice)+art.couriPrice }원
                  </c:forEach>
                  </td>
               </tr>
               <tr>
                  <td colspan="5">
                     <div class="ui_field--onchange  hidden" data-uipack="textarea">
                              <textarea  class= form-control name="request" maxlength="500" placeholder="주문 요청사항을 입력해주세요" style="width:100%;"></textarea>
                           </div>
                  </td>
               </tr>
            </tbody>
              </table>
              </c:forEach><br>
           
<!-- 결제 수단 -->
                    <div class="segment"><!-- 제목 열린 div -->
                        <h4>결제 수단</h4>
                    </div><!-- 제목 닫힌 div -->
                    <div class="tableWrap1" style="width:49%; float:left;"><!-- 결제수단 표 감싸는 열린 div -->
                       <table id="tb1" >
                          <colgroup>
                        <col width="25%">
                        <col width="75%">
                     </colgroup>
                          <tr>
                             <th>결제 수단</th>
                             <td style="text-align: left;">
                                  <input type="radio" name ="Payment" value="무통장입금" id="test" /> 무통장입금
                             </td>
                          </tr>
                          <tr>
                             <th>입금은행</th>
                             <td style="text-align: left;">신한은행</td>
                          </tr>
                          <tr>
                             <th>입금자</th>
                             <td style="text-align: left;">
                                <input class="form-control" type="text" value="${order.user.irum }" />
                             </td>
                          </tr>
                          <tr>
                             <th>환불 계좌</th>
                             <td style="text-align: left;" >
                                <input type="text" placeholder="환불계좌는'-'를 제외하고 입력해주세요" id="refundAccount" name="refundAccount" style="width:200px;" maxlength="13"/>
                                <span id="refundAccount_msg"></span>
<!--                                 <textarea class="form-control" name="refundAccount" maxlength="13" placeholder="환불계좌 '-'제외하고 입력해주세요." style="width:100%;"></textarea> -->
                             </td>
                          </tr>
                       </table>
                       </div><!-- 결제수단 표 감싸는 닫힌 div -->
<!--                </div> -->
               
<!--  결제 정보 -->                
<!--                 <section> -->
                    <div class="final-cost ui_sticky" data-ui="sticky"><!-- 결제정보 열린 div -->
                        <h4 class="table-header" style="position: relative; left: 20px;top: -35px;">결제 정보</h4>
                        <div class="segment" data-ui="paymentData-view"><!-- 결제정보 버튼전 열린 div -->
                           <div class="tableWrap2" style="width:49%; float:right;"><!-- 결제정보 표 감싸는 열린 div -->
                            <table style="padding-left:500; position: relative; top: -37px">
                               <colgroup>
                        <col width="25%">
                        <col width="75%">
                        </colgroup>
                                <tbody>
                                <tr>
                                    <th>총 주문 금액</th>
                                    <td>
                                    	<c:set var = "totalPrice" value = "0" />
											<c:forEach var="art" items="${order.artList}" begin="0" end="1" varStatus="status">
													<input type="hidden" value="${order.bagList[status.index].amount*(art.price+order.bagList[status.index].optionPrice)}">
										<c:set var= "totalPrice" value="${totalPrice + order.bagList[status.index].amount*(art.price+order.bagList[status.index].optionPrice)}"/>
											</c:forEach>
										<c:out value="${totalPrice}원"/>
<%--                                         <span  data-payment="order">${art.price+order.option.optionPrice}</span>원 --%>
                                    </td>
                                </tr>
                                <tr>
                                    <th>배송비</th>
                                    <td>
                                    <c:set var = "couriPrice" value = "0" />
										<c:forEach var="art" items="${order.artList}" varStatus="status">     
											<input type="hidden" value="${art.couriPrice}">
									<c:set var= "couriPrice" value="${couriPrice + art.couriPrice}"/>
										</c:forEach>
									<c:out value="${couriPrice}원"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>예상 적립금</th>
                                    <td id="accumulated">
                                    	<c:set var = "accumulated" value = "0" />
											<c:forEach var="art" items="${order.artList}" varStatus="status">     
												<input type="hidden" value="${order.bagList[status.index].amount*(art.price+order.bagList[status.index].optionPrice)}">
										<c:set var= "accumulated" value="${accumulated + order.bagList[status.index].amount*(art.price+order.bagList[status.index].optionPrice)}"/>
											</c:forEach>
										<c:out value="${accumulated*0.01}원"/>
                                    </td>
                                </tr>
<!--                                 <tr> -->
<!--                                     <th>적립금 사용</th> -->
<!--                                     <td> -->
<!--                                         <span data-payment="shipping"></span>원 -->
<!--                                     </td> -->
<!--                                 </tr> -->
                                   <!-- 분기처리 -->
                                </tbody>
                            </table>
                            <table class="spacing" style="position: relative; top: -37px">
                               <colgroup>
                        <col width="25%">
                        <col width="75%">
                        </colgroup>
                                <tbody>
                                <tr class="total">
                                    <th>최종 결제<br>금액</th>
<!--                                     art.price+art.couriPrice+order.option.optionPrice  -->
                                    <td colspan="2" class="hilight red">
										<c:set var = "total" value = "0" />
											<c:forEach var="art" items="${order.artList}" varStatus="status">     
													<input type="hidden" value="${art.price+art.couriPrice+order.bagList[status.index].optionPrice}">
										<c:set var= "total" value="${total + order.bagList[status.index].amount*(art.price+order.bagList[status.index].optionPrice)+art.couriPrice}"/>
											</c:forEach>
										<c:out value="${total}원"/>  
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            </div><!-- 결제정보 표 감싸는 닫힌 div -->
                        </div><br><!-- 결제정보 버튼전 닫힌 div -->
                       <div class="inputArea" align="center" style="position: relative; right: -250px; bottom:-25px;"><!-- 버튼 열린 div -->
                     <button type="button" id="payment" class="btn btn-primary">결제하기</button>
                        <button type="button" id="back_Btn" class="btn btn-warning">취소</button>
                  </div><!-- 버튼 닫힌 div -->
                        </div>
                        <!-- 결제정보 닫힌 div -->
                    </div><!-- ordercart 닫힌 div -->
<!--                 </section> -->
            </div><!-- 결제하기버튼까지 큰 닫힌 div -->
        </div>
<!-- </div> -->
</form>
</body>
</html>