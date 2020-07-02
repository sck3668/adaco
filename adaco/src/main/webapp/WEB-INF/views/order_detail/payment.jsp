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
			
		}
	})
})
</script>
</head>
<body>
 

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
                <h2 class="txt fl"><i class="fab fa-adn"></i>주문 결제하기</h2>
                <ol class="page-location fr">
                    <li>
                        <em class="icon-num">1</em>
                        <span><i class="fas fa-archway"></i>장바구니</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li class="active">
                        <em class="icon-num">2</em>
                        <span><i class="fas fa-apple-alt"></i>주문결제</span>
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
                    <div class="segment">
                        <div class="ui_title--sub tab" data-ui-id="order_user">
                            <span class="fas fa-user-ninja">주문고객</span>
                            <span class="ui_title__txtright--blue">영일(010-7184-5798)<i class="ui_icon--arrow-down"></i></span>
                        </div>
                        <table class="table-style-clear orderer-info" data-ui="tab-panel" data-panel-id="order_user">
                            <colgroup>
                                <col width="90px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th name="userinfo">주문자 정보 </th>
                                <td>영일 ${user.username}</td>
                            </tr>
                            <tr>
                                <th><em class="asterisk red">&lowast;</em>전화 </th>
                                <td>
                                    <div class="body">
                                        <input
                                            type="text"
                                            name="cell_phone"
                                            class="phonenumber"
                                            data-auth="current-phone"
                                            readonly
                                            required
                                            value="010-7184-5798${user.tel}"
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
                    </div>

                                        <!-- 배송 정보 -->
                    <div class="segment">
                        <div class="ui_title--sub">
                            <span class="ui_title__txt">주소 (배송지)</span>
                        </div>

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
                                    <div class="address-info body">
                                        
                                                <div class="address-ui root">
            <div class="address-ui address">
                <div class="address-ui row">
                    <div class="input-text address-zip-code">
                        <input
                            data-address="delivery_zipcode"
                            type="text"
                            name="delivery_zipcode"
                            value=""
                            placeholder="우편번호"
                            required
                            autocomplete="off"
                            readonly
                                                    >
                    </div>
                    <button
                                                data-address="open"
                        class="btn btn-m btn-white"
                        type="button"
                    >주소 찾기</button>

                    <!-- 다음주소 layer -->
                    <div
                        class="daum-post-layer"
                        style="display:none;position:relative;width:auto;margin-top:10px;overflow:auto;-webkit-overflow-scrolling:touch;"
                    >
                        <img
                            src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
                            id="btnCloseLayer"
                            style="cursor:pointer;position:absolute;right:0;top:0;z-index:1"
                            alt="닫기 버튼"
                        >
                    </div>
                </div>

                <div class="address-ui row">
                    <div class="input-text address-address">
                        <input
                            data-address="delivery_address1"
                            type="text"
                            name="delivery_address1"
                            value=""
                            placeholder="기본 주소"
                            required
                            autocomplete="off"
                            readonly
                                                    >
                    </div>
                </div>
                <div class="address-ui row">
                    <div class="input-text address-address2">
                        <input
                            data-address="delivery_address2"
                            type="text"
                            name="delivery_address2"
                            value=""
                            autocomplete="off"
                            placeholder="나머지 주소"
                                                    >
                    </div>
                </div>

            </div>
        </div>

        <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
        <!-- <div
            id="layer"
            style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;"
        > -->
                                            </div>
                                </div>
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
            data-artist-uuid="5d4b34a8-0f1a-48b5-8f3c-f8f8b975659d"
            data-artist-name="당신을위한_다비디퓨저&amp;섬유향수"
            data-delivery-style="0"
            data-membership-allow="1"
            data-delivery-style="0"
            data-delivery-policy="30000"
            data-delivery-charge="3000"
            data-delivery-charge-remote="3000"
            data-cost-discount-product="0"
            data-cost-discount-delivery="0"
        >
            <caption class="hidden">당신을위한_다비디퓨저&amp;섬유향수</caption>
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
                        <input type="hidden" name="delivery_charge" disabled value="3000">
                        <div class="txt-group">
                            <b class="bold">당신을위한_다비디퓨저&amp;섬유향수 작가님</b>
                        </div>
                                            </th>
                </tr>
            </thead>
            <tbody>
                                        <tr
            class="list-item"
            data-product-uuid='b3772194-a214-40b0-812e-ae6816d9f1c1'
            data-status='1'>

            <td class="area-img">
                <div class="img-bg"
                    style="background-image: url(https://image.idus.com/image/files/b44c03b8bedc489b885dcb4b1125558e_512.jpg)"
                ></div>
            </td>

            <td class="area-txt">
                <div class="txt-group">
                    <input type="hidden" name="product_order_price" disabled value="">
                    <label class="title-txt bold" for="prd-name">[대박7월할인❤]조향사가만든 섬유향수.룸스프레이❤</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="flexible">
                <ul class="list-options">
                                        <li
                        data-artist-uuid=5d4b34a8-0f1a-48b5-8f3c-f8f8b975659d                        data-option-status='1'
                    >
                        <input
                            type="hidden"
                            name="option_price"
                            value="11900"
                            disabled
                        >

                        <div class="table-layout">
                            <div class="split">
                                <span class="option-txt">
                                    용량 : 50ml(휴대용최고♡용량많음) / 향기 : 스노우썸 / 시향샘플제공 : 시향 하고 싶으신 향 / 고급 무광 종이가방 : 필요해요(선물용 좋아요) : 1,000원 /                                     <label>수량 :
                                        <input class="prd-count"
                                            type="number"
                                            value="1"
                                            data-product-price="10900"
                                            data-option-price="1000"
                                            data-price="11900"
                                            data-action="change_count"
                                            data-status-value="1"
                                            readonly
                                        >개
                                    </label>
                                </span>
                            </div>
                            <div class="split">
                                <strong><em class="cost-text">11,900</em>원</strong>
                            </div>
                        </div>
                    </li>
                                </ul>
                <div class="ui_field--onchange  hidden" data-uipack="textarea">
                    <div class="ui_field__txtarea">
                        <textarea name="cart[a09e7b73-29ce-416b-bed4-2e8c1e96a64f]" maxlength="500" placeholder="주문 요청사항을 입력해주세요"
                        readonly                        ></textarea>
                        <em class="ui_field__chars">500</em>
                    </div>
                </div>
            </td>
        </tr>
                        
                                <tr class="static-row">
                    <th>배송비</th>
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
                                data-unformated="30000"
                                value="30,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <div data-freeship="false">
                                                        <input
                                type="text"
                                name="shipping_price"
                                data-unformated="3000"
                                value="3,000원"
                                readonly
                                disabled
                            >
                            <input
                                style="display: none"
                                type="text"
                                name="free_shipping_policy"
                                data-unformated="30000"
                                value="30,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <input
                            type="hidden"
                            name="remote_shipping_price"
                            data-unformated="3000"
                            value="3,000원"
                            readonly
                            disabled
                        >
                        <!-- <div data-vip="true" class="vipmark" style="display:none;">
                            <span>VIP 클럽 적용</span>
                            <span>- 3,000원</span>
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
                                                                        <table
            class="paymentCard"
            data-ui="cart-card"
            data-artist-uuid="3976308b-f229-4dd1-be1c-fc39c265f9a8"
            data-artist-name="선물정육점 (윤주민실장과 청년들)"
            data-delivery-style="0"
            data-membership-allow="1"
            data-delivery-style="0"
            data-delivery-policy="50000"
            data-delivery-charge="3500"
            data-delivery-charge-remote="3000"
            data-cost-discount-product="0"
            data-cost-discount-delivery="0"
        >
            <caption class="hidden">선물정육점 (윤주민실장과 청년들)</caption>
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
                        <input type="hidden" name="delivery_charge" disabled value="3500">
                        <div class="txt-group">
                            <b class="bold">선물정육점 (윤주민실장과 청년들) 작가님</b>
                        </div>
                                            </th>
                </tr>
            </thead>
            <tbody>
                                        <tr
            class="list-item"
            data-product-uuid='421ac8f9-7bf3-46c7-b671-6138688d3ad1'
            data-status='1'>

            <td class="area-img">
                <div class="img-bg"
                    style="background-image: url(https://image.idus.com/image/files/2dc0c872222c471c866799eb7d190acc_512.jpg)"
                ></div>
            </td>

            <td class="area-txt">
                <div class="txt-group">
                    <input type="hidden" name="product_order_price" disabled value="">
                    <label class="title-txt bold" for="prd-name">(1+1)50%할인1등급이상 등심돈까스 최고품질</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="flexible">
                <ul class="list-options">
                                        <li
                        data-artist-uuid=3976308b-f229-4dd1-be1c-fc39c265f9a8                        data-option-status='1'
                    >
                        <input
                            type="hidden"
                            name="option_price"
                            value="9900"
                            disabled
                        >

                        <div class="table-layout">
                            <div class="split">
                                <span class="option-txt">
                                                                        <label>수량 :
                                        <input class="prd-count"
                                            type="number"
                                            value="1"
                                            data-product-price="9900"
                                            data-option-price="0"
                                            data-price="9900"
                                            data-action="change_count"
                                            data-status-value="1"
                                            readonly
                                        >개
                                    </label>
                                </span>
                            </div>
                            <div class="split">
                                <strong><em class="cost-text">9,900</em>원</strong>
                            </div>
                        </div>
                    </li>
                                </ul>
                <div class="ui_field--onchange  hidden" data-uipack="textarea">
                    <div class="ui_field__txtarea">
                        <textarea name="cart[deb9cc29-2660-4f10-9692-1c97a396f910]" maxlength="500" placeholder="주문 요청사항을 입력해주세요"
                        readonly                        ></textarea>
                        <em class="ui_field__chars">500</em>
                    </div>
                </div>
            </td>
        </tr>
                        
                                <tr class="static-row">
                    <th>배송비</th>
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
                                data-unformated="50000"
                                value="50,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <div data-freeship="false">
                                                        <input
                                type="text"
                                name="shipping_price"
                                data-unformated="3500"
                                value="3,500원"
                                readonly
                                disabled
                            >
                            <input
                                style="display: none"
                                type="text"
                                name="free_shipping_policy"
                                data-unformated="50000"
                                value="50,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <input
                            type="hidden"
                            name="remote_shipping_price"
                            data-unformated="3000"
                            value="3,000원"
                            readonly
                            disabled
                        >
                        <!-- <div data-vip="true" class="vipmark" style="display:none;">
                            <span>VIP 클럽 적용</span>
                            <span>- 3,500원</span>
                        </div> -->
                                            </td>
                </tr>
                
                                <tr style="display:none">
                    <td>
                        <fieldset class="coupon-fieldset">
                            <!-- data for coupon validation  -->
                            <input type="hidden" name="artist_coupon_id_list[1]" data-name="coupon_id"  value="0">
                            <input type="hidden" name="discounted_product_price" data-name="discounted_product_price" value="0" disabled>
                            <input type="hidden" name="discounted_shipping_price" data-name="discounted_shipping_price" value="0" disabled>
                        </fieldset>
                    </td>
                </tr>
            </tbody>

        </table>
                                                                        <table
            class="paymentCard"
            data-ui="cart-card"
            data-artist-uuid="b09b58ca-daf1-4bf1-92f9-72ed632eef02"
            data-artist-name="계절,한모금"
            data-delivery-style="0"
            data-membership-allow="1"
            data-delivery-style="0"
            data-delivery-policy="70000"
            data-delivery-charge="4000"
            data-delivery-charge-remote="3000"
            data-cost-discount-product="0"
            data-cost-discount-delivery="0"
        >
            <caption class="hidden">계절,한모금</caption>
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
                        <input type="hidden" name="delivery_charge" disabled value="4000">
                        <div class="txt-group">
                            <b class="bold">계절,한모금 작가님</b>
                        </div>
                                            </th>
                </tr>
            </thead>
            <tbody>
                                        <tr
            class="list-item"
            data-product-uuid='1f118b01-8063-4f00-9f95-d11e2af2ce9a'
            data-status='1'>

            <td class="area-img">
                <div class="img-bg"
                    style="background-image: url(https://image.idus.com/image/files/e1e5a731f79d46a2afefc6c86ae120ec_512.jpg)"
                ></div>
            </td>

            <td class="area-txt">
                <div class="txt-group">
                    <input type="hidden" name="product_order_price" disabled value="">
                    <label class="title-txt bold" for="prd-name">인기최고 천도복숭아청</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="flexible">
                <ul class="list-options">
                                        <li
                        data-artist-uuid=b09b58ca-daf1-4bf1-92f9-72ed632eef02                        data-option-status='1'
                    >
                        <input
                            type="hidden"
                            name="option_price"
                            value="13500"
                            disabled
                        >

                        <div class="table-layout">
                            <div class="split">
                                <span class="option-txt">
                                    선물포장 : 1구포장 : 1,500원 /                                     <label>수량 :
                                        <input class="prd-count"
                                            type="number"
                                            value="1"
                                            data-product-price="12000"
                                            data-option-price="1500"
                                            data-price="13500"
                                            data-action="change_count"
                                            data-status-value="1"
                                            readonly
                                        >개
                                    </label>
                                </span>
                            </div>
                            <div class="split">
                                <strong><em class="cost-text">13,500</em>원</strong>
                            </div>
                        </div>
                    </li>
                                </ul>
                <div class="ui_field--onchange  hidden" data-uipack="textarea">
                    <div class="ui_field__txtarea">
                        <textarea name="cart[0fda98a1-f434-4533-9445-0bfcec0e17c5]" maxlength="500" placeholder="주문 요청사항을 입력해주세요"
                        readonly                        ></textarea>
                        <em class="ui_field__chars">500</em>
                    </div>
                </div>
            </td>
        </tr>
                        
                                <tr class="static-row">
                    <th>배송비</th>
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
                                data-unformated="70000"
                                value="70,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <div data-freeship="false">
                                                        <input
                                type="text"
                                name="shipping_price"
                                data-unformated="4000"
                                value="4,000원"
                                readonly
                                disabled
                            >
                            <input
                                style="display: none"
                                type="text"
                                name="free_shipping_policy"
                                data-unformated="70000"
                                value="70,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <input
                            type="hidden"
                            name="remote_shipping_price"
                            data-unformated="3000"
                            value="3,000원"
                            readonly
                            disabled
                        >
                        <!-- <div data-vip="true" class="vipmark" style="display:none;">
                            <span>VIP 클럽 적용</span>
                            <span>- 4,000원</span>
                        </div> -->
                                            </td>
                </tr>
                
                                <tr style="display:none">
                    <td>
                        <fieldset class="coupon-fieldset">
                            <!-- data for coupon validation  -->
                            <input type="hidden" name="artist_coupon_id_list[2]" data-name="coupon_id"  value="0">
                            <input type="hidden" name="discounted_product_price" data-name="discounted_product_price" value="0" disabled>
                            <input type="hidden" name="discounted_shipping_price" data-name="discounted_shipping_price" value="0" disabled>
                        </fieldset>
                    </td>
                </tr>
            </tbody>

        </table>
                                                                        <table
            class="paymentCard"
            data-ui="cart-card"
            data-artist-uuid="4594aea5-a8c0-423c-afcb-1bbc752d73a7"
            data-artist-name="10am_studio(텐에이엠)"
            data-delivery-style="0"
            data-membership-allow="1"
            data-delivery-style="0"
            data-delivery-policy="50000"
            data-delivery-charge="3000"
            data-delivery-charge-remote="3000"
            data-cost-discount-product="0"
            data-cost-discount-delivery="0"
        >
            <caption class="hidden">10am_studio(텐에이엠)</caption>
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
                        <input type="hidden" name="delivery_charge" disabled value="3000">
                        <div class="txt-group">
                            <b class="bold">10am_studio(텐에이엠) 작가님</b>
                        </div>
                                            </th>
                </tr>
            </thead>
            <tbody>
                                        <tr
            class="list-item"
            data-product-uuid='1ced9818-2b83-4ad8-b915-1573cb3c1ba3'
            data-status='1'>

            <td class="area-img">
                <div class="img-bg"
                    style="background-image: url(https://image.idus.com/image/files/f3c2e18af95045baac24fe0ef274ec1a_512.png)"
                ></div>
            </td>

            <td class="area-txt">
                <div class="txt-group">
                    <input type="hidden" name="product_order_price" disabled value="">
                    <label class="title-txt bold" for="prd-name">원형 유리병 꽃편지 / 특별한편지 생일선물 감성소품</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="flexible">
                <ul class="list-options">
                                        <li
                        data-artist-uuid=4594aea5-a8c0-423c-afcb-1bbc752d73a7                        data-option-status='1'
                    >
                        <input
                            type="hidden"
                            name="option_price"
                            value="12500"
                            disabled
                        >

                        <div class="table-layout">
                            <div class="split">
                                <span class="option-txt">
                                    꽃 종류 : 1. 로맨틱(아이라이너 장미) / 추가 옵션 : 크라프트편지지 2장 : 500원 / 추가 옵션2 : 크라프트편지지 2장 : 500원 /                                     <label>수량 :
                                        <input class="prd-count"
                                            type="number"
                                            value="1"
                                            data-product-price="11500"
                                            data-option-price="1000"
                                            data-price="12500"
                                            data-action="change_count"
                                            data-status-value="1"
                                            readonly
                                        >개
                                    </label>
                                </span>
                            </div>
                            <div class="split">
                                <strong><em class="cost-text">12,500</em>원</strong>
                            </div>
                        </div>
                    </li>
                                </ul>
                <div class="ui_field--onchange  hidden" data-uipack="textarea">
                    <div class="ui_field__txtarea">
                        <textarea name="cart[26ffb3fa-73fb-4380-95f6-5c36644659e7]" maxlength="500" placeholder="주문 요청사항을 입력해주세요"
                        readonly                        ></textarea>
                        <em class="ui_field__chars">500</em>
                    </div>
                </div>
            </td>
        </tr>
                        
                                <tr class="static-row">
                    <th>배송비</th>
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
                                data-unformated="50000"
                                value="50,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <div data-freeship="false">
                                                        <input
                                type="text"
                                name="shipping_price"
                                data-unformated="3000"
                                value="3,000원"
                                readonly
                                disabled
                            >
                            <input
                                style="display: none"
                                type="text"
                                name="free_shipping_policy"
                                data-unformated="50000"
                                value="50,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <input
                            type="hidden"
                            name="remote_shipping_price"
                            data-unformated="3000"
                            value="3,000원"
                            readonly
                            disabled
                        >
                        <!-- <div data-vip="true" class="vipmark" style="display:none;">
                            <span>VIP 클럽 적용</span>
                            <span>- 3,000원</span>
                        </div> -->
                                            </td>
                </tr>
                
                                <tr style="display:none">
                    <td>
                        <fieldset class="coupon-fieldset">
                            <!-- data for coupon validation  -->
                            <input type="hidden" name="artist_coupon_id_list[3]" data-name="coupon_id"  value="0">
                            <input type="hidden" name="discounted_product_price" data-name="discounted_product_price" value="0" disabled>
                            <input type="hidden" name="discounted_shipping_price" data-name="discounted_shipping_price" value="0" disabled>
                        </fieldset>
                    </td>
                </tr>
            </tbody>

        </table>
                                                                        <table
            class="paymentCard"
            data-ui="cart-card"
            data-artist-uuid="92dea18b-c12d-406b-8501-e5823d6c3985"
            data-artist-name="봄의언덕"
            data-delivery-style="0"
            data-membership-allow="1"
            data-delivery-style="0"
            data-delivery-policy="50000"
            data-delivery-charge="3000"
            data-delivery-charge-remote="3000"
            data-cost-discount-product="0"
            data-cost-discount-delivery="0"
        >
            <caption class="hidden">봄의언덕</caption>
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
                        <input type="hidden" name="delivery_charge" disabled value="3000">
                        <div class="txt-group">
                            <b class="bold">봄의언덕 작가님</b>
                        </div>
                                            </th>
                </tr>
            </thead>
            <tbody>
                                        <tr
            class="list-item"
            data-product-uuid='6119b0f4-eb1e-4373-afb0-c8a25e7f435c'
            data-status='1'>

            <td class="area-img">
                <div class="img-bg"
                    style="background-image: url(https://image.idus.com/image/files/cb8131fc57fa4583a9fbcbe6f6131461_512.jpg)"
                ></div>
            </td>

            <td class="area-txt">
                <div class="txt-group">
                    <input type="hidden" name="product_order_price" disabled value="">
                    <label class="title-txt bold" for="prd-name">여름필수품 모스큐브(오렌지&amp;바이올렛)</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="flexible">
                <ul class="list-options">
                                        <li
                        data-artist-uuid=92dea18b-c12d-406b-8501-e5823d6c3985                        data-option-status='1'
                    >
                        <input
                            type="hidden"
                            name="option_price"
                            value="37500"
                            disabled
                        >

                        <div class="table-layout">
                            <div class="split">
                                <span class="option-txt">
                                    옵션1 : 바이올렛 /                                     <label>수량 :
                                        <input class="prd-count"
                                            type="number"
                                            value="3"
                                            data-product-price="12500"
                                            data-option-price="0"
                                            data-price="12500"
                                            data-action="change_count"
                                            data-status-value="1"
                                            readonly
                                        >개
                                    </label>
                                </span>
                            </div>
                            <div class="split">
                                <strong><em class="cost-text">37,500</em>원</strong>
                            </div>
                        </div>
                    </li>
                                </ul>
                <div class="ui_field--onchange  hidden" data-uipack="textarea">
                    <div class="ui_field__txtarea">
                        <textarea name="cart[52cfd37c-f622-4917-8cc1-7d6864c39176]" maxlength="500" placeholder="주문 요청사항을 입력해주세요"
                        readonly                        ></textarea>
                        <em class="ui_field__chars">500</em>
                    </div>
                </div>
            </td>
        </tr>
                        
                                <tr class="static-row">
                    <th>배송비</th>
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
                                data-unformated="50000"
                                value="50,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <div data-freeship="false">
                                                        <input
                                type="text"
                                name="shipping_price"
                                data-unformated="3000"
                                value="3,000원"
                                readonly
                                disabled
                            >
                            <input
                                style="display: none"
                                type="text"
                                name="free_shipping_policy"
                                data-unformated="50000"
                                value="50,000원 이상"
                                readonly
                                disabled
                            >
                        </div>
                        <input
                            type="hidden"
                            name="remote_shipping_price"
                            data-unformated="3000"
                            value="3,000원"
                            readonly
                            disabled
                        >
                        <!-- <div data-vip="true" class="vipmark" style="display:none;">
                            <span>VIP 클럽 적용</span>
                            <span>- 3,000원</span>
                        </div> -->
                                            </td>
                </tr>
                
                                <tr style="display:none">
                    <td>
                        <fieldset class="coupon-fieldset">
                            <!-- data for coupon validation  -->
                            <input type="hidden" name="artist_coupon_id_list[4]" data-name="coupon_id"  value="0">
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
                    
                    <!-- 제주 / 도서산간 추가비용 -->
                    <div class="segment" data-ui="remote-delivery-info" style="display: none">
                        <div class="ui_title--sub tab" data-ui-id="order_delivery">
                            <span class="ui_title__txt">제주 / 도서산간 추가비용</span>
                            <span class="ui_title__txtright"><em class="hilight blue"></em><i class="ui_icon--arrow-down"></i></span>
                        </div>
                        <ul class="list-style" data-ui="tab-panel" data-panel-id="order_delivery">
                            <!-- markup made from javascript -->
                        </ul>
                    </div>

                                        <!-- 아이디어스 할인 혜택 -->
                    <div class="segment field-group" data-ui="discount-display" style="display: none">
                        <div class="ui_title--sub">
                            <span class="ui_title__txt">아이디어스 할인 혜택</span>
                        </div>
                                                                                            </div>

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
                                <div class="txt-group">
                                    <span data-label="paymentbtn">간편하게 카드 결제</span>
                                    <em>결제시 작품 금액의 0.5%가 적립</em>
                                </div>
                                <div data-vue="oneTouchPayment"></div>
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
                            <label class="radio-item">
                                <input
                                    class="bp"
                                    name="how_to_pay"
                                    value="NAVER"
                                    type="radio"
                                    required
                                >
                                <span data-label="paymentbtn"  class="img_label">
                                    <img src="/resources/dist/images/icon_payment_npay.png">
                                </span>
                                <span class="hidden" data-label="paymentbtn">네이버페이</span>
                            </label>
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
                                <tr>
                                    <th>작가님 할인 혜택</th>
                                    <td>
                                        <span data-payment="discount">0</span>원
                                    </td>
                                </tr>
                                <tr data-payment="remote-tr">
                                    <th>제주 / 도서산간 추가비용</th>
                                    <td>
                                        <span
                                            name="remote"
                                            data-payment="remote"
                                        >0</span>원
                                    </td>
                                </tr>
                                <!-- 분기처리 -->
                                <tr>
                                    <th>아이디어스 할인 혜택</th>
                                    <td>
                                        <span data-payment="membership">0</span>원
                                    </td>
                                </tr>
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
                                    ‣ 제공받는 자 : 당신을위한_다비디퓨저&섬유향수, 선물정육점 (윤주민실장과 청년들), 계절,한모금, 10am_studio(텐에이엠), 봄의언덕<br>
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
                                        <span data-label="total"></span>
                                        <span data-label="type">결제하기</span>
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

<div class="modal root" data-modal-root data-modal-id="coupon-list" style="display:none;">
    <div class="modal overlay" data-modal-overlay></div>
    <form class="modal wrap modal-m" data-form="coupon-form" data-type="idus">
        <div class="modal head">
            <h1>쿠폰선택</h1>
            <div class="modal close" data-modal="close">
            </div>
        </div>
        <div class="radiogroup"></div>
        <div class="btngroup">
            <button type="button" class="ui_btn" data-modal="close">취소</button>
            <button type="submit" class="ui_btn--red">선택하기</button>
        </div>
    </form>
</div>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


<script>
    // 일반 결제 페이지
    vuepack.createOneTouchPayment('[data-vue="oneTouchPayment"]', { cards: JSON.parse("[]") });

    </script>
<a href="#header" class="to-top sp-icon icon-scrolltotop" data-ui="scroll-to-top">
    <i class="fa fa-angle-up"></i>
</a>
<footer id="footer" class="footer">
    <div class="full-w">
        <nav class="nav-links">
            <a class="m-show" href="/w/board/terms/use">이용약관</a>
            <span class="m-show">|</span>
            <a class="m-show"href="/w/board/terms/privacy"><b style="font-weight:bold">개인정보 처리방침</b></a>
            <span class="m-show">|</span>
            <a class="m-show" href="/w/board/notice">공지사항</a>
            <span class="m-show">|</span>
            <a href="/w/board/faq">자주 묻는 질문</a>
            <span>|</span>
            <a href="/w/board/event">이벤트</a>
            <span>|</span>
            <a href="http://go.backpac.kr/enterartist" target="blank">입점문의</a>
            <span>|</span>
            <a class="m-show" href="http://go.backpac.kr/company" target="blank">About idus</a>
            <span>|</span>
            <a href="http://go.backpac.kr/joinidus" target="blank">인재 영입</a>
        </nav>
    </div>

    <div class="inner-w clf">
        <div class="logo-footer fl">
            <img src="/resources/dist/images/idus-logo-grayscale.svg" alt="IDUS, Unique Lifestyle Guide">
        </div>

        <div class="text-box fl">
            <strong>(주) 백패커</strong>
            <ul>
                <li>대표이사 : 김동환</li>
                <li>서울특별시 마포구 동교로 19길 12</li>
                <li>사업자 등록번호 : 107-87-83297
                    <a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1078783297" target="blank" class="btn-style-link">
                        사업자 정보확인
                        <i class="fa fa-caret-right"></i>
                    </a>
                </li>
                <li>통신판매업신고 : 2015-서울마포-0440</li>
            </ul>
            <span class="mt-fix1">
                아이디어스는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                따라서 아이디어스는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
            </span>
        </div>

        <div class="text-box fl">
            <strong>고객센터</strong>
            <span>(주 7일, 오전 10시 ~ 저녁 10시까지)</span>
            <ul>
                <li>
                    <span class="fix-w">카카오톡</span>
                    <a href="https://bit.ly/2wtkOs4"><em>아이디어스</em></a>
                </li>
                <li><span class="fix-w">대표번호</span>1668-3651</li>
                <li><span class="fix-w">메일</span>support@backpac.kr</li>
                <li><span class="fix-w">제휴문의</span>biz@backpac.kr</li>
            </ul>
            <span class="mt-fix2">
                아이디어스 이용 중 궁금하신 점이 있으신가요?<br>
                메일 또는 플러스친구 `아이디어스`로 연락해주세요.<br>
                최선을 다해 도와드리겠습니다.
            </span>
        </div>

        <div class="text-box fr">
            <strong>Follow Us</strong>
            <nav class="sns-list">
                <a href="https://www.facebook.com/idus.me" target="blank" class="sp-icon icon-facebook-c"></a>
                <a href="https://www.instagram.com/idus.me/" target="blank" class="sp-icon icon-instagram-c"></a>
                <a href="https://story.kakao.com/ch/idusme" target="blank" class="sp-icon icon-kakaostory-c"></a>
                <a href="http://post.naver.com/idus_me " target="blank" class="sp-icon icon-naverblog-c"></a>
                <a href="https://twitter.com/IDus_kr" target="blank" class="sp-icon icon-twitter-c"></a>
            </nav>

            <div class="escrow">
                <strong>구매안전거래서비스
                    <a href="#" onclick="return escrowPopup()" target="blank" class="btn-style-link">
                        가입사실 확인
                        <i class="fa fa-caret-right"></i>
                    </a>
                </strong>
                <div class="clf">
                    <span class="sp-icon escrow fl"></span>
                    <div class="txt fl">고객님은 현금 등으로 결제시 당사에서 가입한 구매안전서비스를 이용하실 수 있습니다.</div>
                </div>
            </div>
            <span class="copyright mt-fix3">Copyright  © 2020 Backpackr All right reserved.</span>
        </div>
    </div>
</footer>

<script>
function escrowPopup() {
    var url = 'https://pg.nicepay.co.kr/issue/IssueEscrow.jsp?Mid=iduscom01m&CoNo=1078783297';
    var newWindow = window.open(url,'name','height=450,width=400');

    if (window.focus) newWindow.focus();
    return false;
}
</script>
        </div>
        <!-- div WRAP -->
                <script type="text/javascript" src="/resources/dist/js/idus.web.min.js?__v=1593528960"></script>
                <script>
        (function(){
            var applink = new vuepack.externals.Applink();
            var scheme = applink.locationToAppScheme();
            var key = "mobile_web";

            appDownloadMask(key, scheme);
            BPackr.scheme = scheme;
        }());
        </script>

        <script>
        if(!wcs_add) var wcs_add = {};
        wcs_add["wa"] = "s_116b1123e20f";
        if (!_nao) var _nao={};
        wcs.inflow("idus.com");
        wcs_do(_nao);
        </script>
</body>
</html>