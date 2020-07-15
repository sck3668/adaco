<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>
<script>
	$(function() {
		
	})
</script>
</head>
<body>
${order}
<div id="content" class="content" data-page="payment" data-address-page="payment" style="padding-bottom:0">
        <div class="inner-w800">
            <div class="title-style clf">
                <h2 class="txt fl">주문 결제하기</h2>
                	<hr width="1500px;">
                <ol class="page-location fr">
                    <li>
                        <em class="icon-num">1</em>
                        <span>장바구니</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li class="active">
                        <em class="icon-num">2</em>
                        <span>주문결제</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <em class="icon-num">3</em>
                        <span>주문완료</span>
                    </li>
                </ol>
            </div>

            <div class="layout-split" data-layout-split="payment">
                    <!-- 주문고객 정보 -->
                        <div class="ui_title--sub tab" data-ui-id="order_user">
                            <h4>주문고객정보</h4>
                        </div>
                        <table class="table-style-clear orderer-info" data-ui="tab-panel" data-panel-id="order_user">
                            <colgroup>
                                <col width="90px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>주문자 정보</th>
                                <td> ${order.user.irum }</td>
                            </tr>
                            <tr>
                                <th><em class="asterisk red">&lowast;</em>전화</th>
                                <td>
                                    <div class="body">
                                        <input type="text" name="tel" value="${order.user.tel }">
                                        <button type="button" id="telChange">변경하기</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</td>
                            </tr>
                            </tbody>
                        </table><br>
<!-- 배송 정보 -->
                        <div class="ui_title--sub">
                            <span class="ui_title__txt">주소 (배송지)</span>
                        </div>
							<input type="text" id="postcode" placeholder="우편번호">
							<input type="button" onclick="execDaumPostcode()" value="주소 찾기"><br>
							<input type="text" id="address" placeholder="주소"><br>
							<input type="text" id="detailAddress" placeholder="상세주소">
							<input type="text" id="extraAddress" placeholder="참고항목">
                        
                        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
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
                        <div class="address-section" data-address="root">
                                <div class="address-info item">
                                		<br>
                                        <em class="asterisk red">&lowast;</em>
                                        <label for="receiver">받는분</label>
                                        <input name="delivery_name" type="text" value="${order.user.irum }">
                                </div>

                                <div class="address-info item">
                                        <em class="asterisk red">&lowast;</em>
                                        <label for="delivery_phone">전화번호</label>
                                        <input name="delivery_phone" type="text" value="${order.user.tel }">
                                </div>
                        </div>
					</div>
				</div>
                    
<!-- 주문 작품 정보 -->
				<div class="segment--nospacing" data-ui="order-summary-label">
					<div class="ui_title--sub tab " data-ui-id="order_cart">
						<h4>주문 작품 정보</h4>
					</div>
				<div data-ui="tab-panel" data-panel-id="order_cart" style="">
				<table>
					<colgroup>
						<col width="120px">
						<col width="*">
            		</colgroup>
         		   <thead>
             		   <tr>
							<th colspan="2">
        		        		<div class="txt-group">
                            		<b class="bold">${order.artistName }작가님</b>
                        		</div>
                            </th>
              		  </tr>
           			</thead>
					<tbody>
						<tr>
				            <td class="area-img">
          				      	<label>작품명</label>
            				</td>
            				<td class="area-txt">
                    			<label class="title-txt bold" for="prd-name">${order.art.artName }</label>
							</td>
        				</tr>
      				  <tr>
        			    <td colspan="2" class="flexible">
                        <div class="table-layout">
                            <div class="split">
                                <label>수량: ${order.bag.amount } 개 </label>
                            </div>
                            <div class="split">
                                <strong>가격 : ${order.art.price }원</strong>
                            </div>
                        </div>
                		<div class="ui_field--onchange  hidden" data-uipack="textarea">
                        	<textarea maxlength="500" placeholder="주문 요청사항을 입력해주세요"></textarea>
               			</div>
            			</td>
        			</tr>
                        
                    <tr class="static-row">
                    	<th>배송비 </th>
                    	<td>
                    		<input type="text" name="shippingPrice" value="${order.art.couriPrice}원">
                        </td>
               	 	</tr>
            	</tbody>
        	</table>
<!-- 결제 수단 -->
                    <div class="segment">
                        <h4>결제 수단</h4>
                    </div>
                    <div>
                    	<input type="radio">
                    	<input type="text" value="무통장입금">
                    </div>
<!--  결제 정보 -->                
                <section>
                    <div class="final-cost ui_sticky" data-ui="sticky">
                        <h3 class="table-header">결제 정보</h3>
                        <div class="segment" data-ui="paymentData-view">
                            <table>
                                <tbody>
                                <tr>
                                    <th>작품금액</th>
                                    <td>
                                        <span
                                            data-payment="order"
                                        >${order.art.price }</span>원
                                    </td>
                                </tr>
                                <tr>
                                    <th>배송비</th>
                                    <td>
                                        <span
                                            data-payment="shipping"
                                        >${order.art.couriPrice }</span>원
                                    </td>
                                </tr>
	                                <!-- 분기처리 -->
                                </tbody>
                            </table>
                            <table class="spacing">
                                <tbody>
                                <tr class="total">
                                    <th>최종 결제 금액</th>
                                    <td class="hilight red">
                                        <span
                                            data-payment="total"
                                        > </span><em>${order.art.couriPrice+order.option.optionPrice }원</em>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div>
                             <button id="payment">결제하기</button>
                        </div>
                    </div>
                </section>
            </div>
        </div>
</div>
</body>
</html>