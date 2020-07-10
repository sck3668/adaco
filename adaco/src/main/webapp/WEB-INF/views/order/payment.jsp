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
$(function(){
	$("#userinfo").on("click", function(){
		var info = [];
		ajax{
			url:"adaco/order/orderdetail"
			method: "get"
			data: params,
			}).doen(()=>{location.reload(); })
			.fail((xhr)=>{console.log(xhr)})
			
			var $form = $("<form>").attr("action", "/adaco/order/payment").attr("method", "get")
			$("<input>").attr("type", "hidden").attr("name", "cnos").val(ar).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "_csrf").val("${_csrf.token}").appendTo($form);
			$form.appendTo($("body")).submit();
		}
})
</script>

</head>
<body>
${ordrs }
${bag }
${art }
${user }
<div id="content" class="content" data-page="payment" data-address-page="payment" style="padding-bottom:0">
    <form
        class="form-payment"
        action="/w/payment/pay"
        method="post">
                <input type="hidden" name="point_type_bill" value="0.5">
                <input type="hidden" name="point_type_vip" value="1">
                <input type="hidden" name="is_personal_payment" value="">
                <input type="hidden" name="bucket_cart_uuid[]"/>
                <input type="hidden" name="is_remote" value="false" disabled />
                <input type="hidden" name="is_membership" disabled value="" />
                <input type="hidden" name="remote_price" value="0" disabled />
                <input type="hidden" name="address_uuid" id="address_uuid" value="" />
                <input type="hidden" name="user_grade" id="user_grade" value="2.0%" />
                <input type="hidden" name="ga_client_id" id="ga_client_id" value="" />
        
        
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
                <section data-ui="toggle-tab">
                    <!-- 주문고객 정보 -->
                        <div class="ui_title--sub tab" data-ui-id="order_user">
                            <span class="ui_title__txt">주문고객${user.username }</span>
                            <span class="ui_title__txtright--blue">영일(010-7184-5798) <i class="ui_icon--arrow-down"></i></span>
                        </div>
                        <table class="table-style-clear orderer-info" data-ui="tab-panel" data-panel-id="order_user">
                            <colgroup>
                                <col width="90px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>주문자 정보</th>
                                <td>영일 ${user.irum }</td>
                            </tr>
                            <tr>
                                <th><em class="asterisk red">&lowast;</em>전화</th>
                                <td>
                                    <div class="body">
                                        <input
                                            type="text"
                                            name="cell_phone"
                                            class="phonenumber"
                                            data-auth="current-phone"
                                            readonly
                                            required
                                            value="010-7184-5798"
                                        >
                                        <button
                                            type="button"
                                            class="ui_btn--redline--small"
                                            data-modal-url="/w/me/cellphone"
                                            data-modal-id="phonenumber"
                                            data-modal-type="post"
                                            data-modal-trigger="modal-link"
                                        >변경하기</button>
                                    </div>
                                </td>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <td>주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</td>
                            </tr>
                            </tbody>
                        </table>

                                        <!-- 배송 정보 -->
                        <div class="ui_title--sub">
                            <span class="ui_title__txt">주소 (배송지)</span>
                        </div>
<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "가맹점 사용자 식별키",
          "merchantPayKey": "53",
          "productName": "피자",
          "totalPayAmount": "1000",
          "taxScopeAmount": "1000",
          "taxExScopeAmount": "0",
          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
        });
    });

</script>					
					
			
					
<input type="text" id="sample3_postcode" placeholder="우편번호">
<input type="button" onclick="sample3_execDaumPostcode()" value="주소 찾기"><br>
<input type="text" id="sample3_address" placeholder="주소"><br>
<input type="text" id="sample3_detailAddress" placeholder="상세주소">
<input type="text" id="sample3_extraAddress" placeholder="참고항목">

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

    function sample3_execDaumPostcode() {
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
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

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

<br><br><br><br><br><br><br>
                        <div class="address-section" data-address="root">
                            <div class="tab-style-btn">
                                <div data-device="mobile">
                                                                        <div class="tab-style-btn-item">
                                        <button
                                            class="btn active"
                                            type="button"
                                            data-address='{
                                                "address_uuid": "e3820bbe-f34e-440a-b1ea-7e3deda56ea3",
                                                "delivery_name": "",
                                                "delivery_phone": "010-7184-5798",
                                                "delivery_remote": "",
                                                "delivery_zipcode": "",
                                                "delivery_address1": "",
                                                "delivery_address2": ""
                                            }'
                                        >1</button>
                                    </div>
                                                                        <div class="tab-style-btn-item">
                                        <button
                                            class="btn "
                                            type="button"
                                            data-address='{
                                                "address_uuid": "8b63a2fe-a07b-4ff0-9e51-62eb1ebb6f98",
                                                "delivery_name": "",
                                                "delivery_phone": "",
                                                "delivery_remote": "",
                                                "delivery_zipcode": "",
                                                "delivery_address1": "",
                                                "delivery_address2": ""
                                            }'
                                        >2</button>
                                    </div>
                                                                        <div class="tab-style-btn-item">
                                        <button
                                            class="btn "
                                            type="button"
                                            data-address='{
                                                "address_uuid": "118c2b3b-070e-43b6-bbdc-a5661032f79e",
                                                "delivery_name": "",
                                                "delivery_phone": "",
                                                "delivery_remote": "",
                                                "delivery_zipcode": "",
                                                "delivery_address1": "",
                                                "delivery_address2": ""
                                            }'
                                        >3</button>
                                    </div>
                                                                    </div>
                            </div>

                            <div class="address-info root">
                                <div class="address-info item">
                                    <div class="address-info head">
                                        <em class="asterisk red">&lowast;</em>
                                        <label for="receiver">받는분</label>
                                    </div>
                                    <div class="address-info body">
                                        <div class="input-text">
                                            <input
                                                data-address="delivery_name"
                                                name="delivery_name"
                                                type="text"
                                                placeholder=""
                                                required
                                                autocomplete="off"
                                            >
                                        </div>
                                    </div>
                                </div>

                                <div class="address-info item">
                                    <div class="address-info head">
                                        <em class="asterisk red">&lowast;</em>
                                        <label for="receiver">전화번호</label>
                                    </div>
                                    <div class="address-info body">
                                        <div class="input-text">
                                            <input
                                                data-address="delivery_phone"
                                                data-phone-type="none"
                                                name="delivery_phone"
                                                type="text"
                                                required
                                                autocomplete="off"
                                            >
                                        </div>
                                    </div>
                                </div>

                                <div class="address-info item">
                                    <div class="address-info head">
                                        <em class="asterisk red">&lowast;</em>
                                        <label for="receiver">주소</label>
                                    </div>
                                        
        <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
        <!-- <div
            id="layer"
            style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;"
        > -->
                            </div>

                            <div class="extra-row">
                                <label>
                                    <input
                                        id="safe-phone"
                                        type="checkbox"
                                        name="is_safe_phone"
                                        class="bp"
                                        checked
                                    />
                                    1회용 안심번호 사용
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 주문 작품 정보 -->
                    <div class="segment--nospacing" data-ui="order-summary-label">
                        <div class="ui_title--sub tab " data-ui-id="order_cart">
                            <span class="ui_title__txt">주문 작품 정보</span>
                            <span class="ui_title__txtright">
                                <em class="hilight blue"></em>
                                <i class="ui_icon--arrow-down"></i>
                            </span>
                        </div>
                        <div data-ui="tab-panel" data-panel-id="order_cart" style="">
                                                                <table
            class="paymentCard"
            data-ui="cart-card"
            data-artist-uuid="e25a87ff-c30a-43ed-b061-e6ba54ddb988"
            data-artist-name="위드르방"
            data-delivery-style="0"
            data-membership-allow="1"
            data-delivery-style="0"
            data-delivery-policy="100000"
            data-delivery-charge="5000"
            data-delivery-charge-remote="4000"
            data-cost-discount-product="0"
            data-cost-discount-delivery="0"
        >
            <colgroup>
                <col width="120px">
                <col width="*">
            </colgroup>
            <thead>
                <tr>
                    <th colspan="2">
                        <input type="hidden" name="artist_order_price" disabled value="">
                        <input type="hidden" name="shipping_type" disabled value="">
                        <input type="hidden" name="shipping_coupon" disabled value="">
                        <input type="hidden" name="delivery_charge" disabled value="5000">
                        <div class="txt-group">
                            <b class="bold">위드르방 작가님</b>
                        </div>
                                            </th>
                </tr>
            </thead>
            <tbody>
                                        <tr
            class="list-item"
            data-product-uuid='595dd6f5-5df3-4228-8aec-59f197076328'
            data-status='1'>

            <td class="area-img">
                <div class="img-bg"
                    style="background-image: url(https://image.idus.com/image/files/358815b73d854bdf829e54e182b747d3_512.jpg)"
                ></div>
            </td>

            <td class="area-txt">
                <div class="txt-group">
                    <input type="hidden" name="product_order_price" disabled value="">
                    <label class="title-txt bold" for="prd-name">❤3일할인❤[천연발효]초코초코빵</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="flexible">
                <ul class="list-options">
                                        <li
                        data-artist-uuid=e25a87ff-c30a-43ed-b061-e6ba54ddb988                        data-option-status='1'
                    >
                        <input
                            type="hidden"
                            name="option_price"
                            value="3000"
                            disabled
                        >

                        <div class="table-layout">
                            <div class="split">
                                <span class="option-txt">
                                                                        <label>수량 :
                                        <input class="prd-count"
                                            type="number"
                 
                                            value="1"
                                            data-product-price="3000"
                                            data-option-price="0"
                                            data-price="3000"
                                            data-action="change_count"
                                            data-status-value="1"
                                            readonly
                                        >개
                                    </label>
                                </span>
                            </div>
                            <div class="split">
                                <strong><em class="cost-text">3,000</em>원</strong>
                            </div>
                        </div>
                    </li>
                                </ul>
                <div class="ui_field--onchange  hidden" data-uipack="textarea">
                    <div class="ui_field__txtarea">
                        <textarea name="cart[323e97f9-c1dd-4dad-8daf-941e4b6a7b48]" maxlength="500" placeholder="주문 요청사항을 입력해주세요"
                        readonly                        ></textarea>
                        <em class="ui_field__chars">500</em>
                    </div>
                </div>
            </td>
        </tr>
                        
                                <tr class="static-row">
                    <th>배송비 ${orderdetail.shippingCharge}</th>
                    <td>
                        <!-- <div data-freeship="true">
                            <input
                                type="text"
                                name="shipping_price"
                                data-unformated="0"
                                value="무료"
                                readonly
                                disabled
                            >
                        </div> -->
                                                <div data-freeship="true" style="display: none">
                            <input
                                type="text"
                                name="shipping_price"
                                data-unformated="0"
                                value="무료"
                                readonly
                                disabled
                            >
                            <input
                                type="text"
                                style="display: none"
                                name="free_shipping_policy"
                                data-unformated="100000"
                                value="100,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <div data-freeship="false">
                                                        <input
                                type="text"
                                name="shipping_price"
                                data-unformated="5000"
                                value="5,000원"
                                readonly
                                disabled
                            >
                            <input
                                style="display: none"
                                type="text"
                                name="free_shipping_policy"
                                data-unformated="100000"
                                value="100,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <input
                            type="hidden"
                            name="remote_shipping_price"
                            data-unformated="4000"
                            value="4,000원"
                            readonly
                            disabled
                        >
                        <!-- <div data-vip="true" class="vipmark" style="display:none;">
                            <span>VIP 클럽 적용</span>
                            <span>- 5,000원</span>
                        </div> -->
                                            </td>
                </tr>
                
                                <tr style="display:none">
                    <td>
                        <fieldset class="coupon-fieldset">
                            <!-- data for coupon validation  -->
                            <input type="hidden" name="artist_coupon_id_list[0]" data-name="coupon_id"  value="0">
                            <input type="hidden" name="discounted_product_price" data-name="discounted_product_price" value="0" disabled>
                            <input type="hidden" name="discounted_shipping_price" data-name="discounted_shipping_price" value="0" disabled>
                        </fieldset>
                    </td>
                </tr>
            </tbody>

        </table>
                                                            </div>
                    </div>

                    <!-- 선물하기 정보 -->
                    
                    <!-- 결제 수단 -->
                    <div class="segment">
                        <div class="ui_title--sub">
                            <span class="ui_title__txt">결제 수단</span>
                        </div>
                        <div class="radiogroup" data-payment-type-btn="root">
                                                        <label class="radio-item">
                                <input
                                    class="bp"
                                    name="how_to_pay"
                                    data-payment-type-btn="simple"
                                    value="BILL"
                                    type="radio"
                                    required
                                    checked
                                >
                            </label>
                            <label class="radio-item">
                                <input
                                    class="bp"
                                    name="how_to_pay"
                                    value="CARD"
                                    type="radio"
                                    required
                                >
                                <span data-label="paymentbtn">복잡하게 카드 결제</span>
                            </label>
                            <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"
   									 data-client-id="u86j4ripEt8LRfPGzQ8"
    								 data-mode="production"
    								 data-merchant-user-key="가맹점 사용자 식별키"
    	 							 data-merchant-pay-key="가맹점 주문 번호"
      								 data-product-name="상품명을 입력하세요"
    								 data-total-pay-amount="1000"
    	    						 data-tax-scope-amount="1000"
    								 data-tax-ex-scope-amount="0"
    								 data-return-url="사용자 결제 완료 후 결제 결과를 받을 URL">
							</script>		
                            <label class="radio-item">
                                <input
                                    class="bp"
                                    name="how_to_pay"
                                    value="VBANK"
                                    type="radio"
                                    required
                                >
                                <span data-label="paymentbtn">계좌이체</span>
                            </label>
                            <div data-payment-type-target="VBANK" class="payment-type vbank">
                                <label>
                                    <input
                                        type="checkbox"
                                        class="bp"
                                        name="is_escrow"
                                        value="1"
                                    >
                                    <span class="va-m">
                                        에스크로
                                    </span>
                                </label>
                            </div>
                            <label class="radio-item">
                                <input
                                    class="bp"
                                    name="how_to_pay"
                                    value="CELLPHONE"
                                    type="radio"
                                    required
                                >
                                <span data-label="paymentbtn">휴대폰 결제</span>
                            </label>
                            <label class="radio-item">
                                <input
                                    class="bp"
                                    name="how_to_pay"
                                    value="TOSS"
                                    type="radio"
                                    required
                                >
                                <span data-label="paymentbtn" class="img_label">
                                    <img src="/resources/dist/images/icon_payment_toss.png">
                                </span>
                                <span class="hidden" data-label="paymentbtn">토스</span>
                            </label>
                                                    </div>
                    </div>
                </section>
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
                                        ></span>원
                                    </td>
                                </tr>
                                <tr>
                                    <th>배송비</th>
                                    <td>
                                        <span
                                            data-payment="shipping"
                                        >0</span>원
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
                                        > </span><em>원</em>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="segment-group" data-ui="toggle-tab">
                            <div class="segment--nospacing">
                                <div class="ui_title--sub tab" data-ui-id="info_personal1">
                                    <label>
                                        <input
                                            type="checkbox"
                                            name="privacy_info"
                                            autocomplete="off"
                                            required
                                            class="bp"
                                        >
                                        <i class="asterisk red">&lowast;</i>
                                        개인정보 제3자 제공고지
                                    </label>
                                    <span class="ui_title__txtright--blue">더 보기<i class="ui_icon--arrow-down"></i></span>
                                </div>
                                <div class="scroll-txt" data-ui="tab-panel" data-panel-id="info_personal1">
                                    ‣ 제공받는 자 : 위드르방<br>
                                    ‣ 목적 : 판매자와 구매자 사이의 원활한 거래 진행, 상품의 배송을 위한 배송지 확인, 고객상담 및 불만처리 등<br>
                                    ‣ 정보 : 별명, 이름, 전화, 주소<br>
                                    ‣ 보유기간 : 발송완료 후 15일<br>
                                    <br>
                                    아이디어스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 아이디어스는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
                                </div>
                            </div>
                            
                            <div class="segment--nospacing scroll-detector" data-ui="sticky">
                                <div class="mfixed">
                                    <button id="btn-submit" class="ui_btn--red--large" data-ui="btn-label">
                                        <a href="/adaco/order/after"><span data-label="total"></span>
                                        <span data-label="type"> <a href="/adaco/order/after">결제하기</a></span></a>
                                        <p class="point" data-label="point">예상적립금 : <em>0</em>P</p>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </form>
</div>
</body>
</html>