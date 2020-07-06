<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
$(function(){
	
		
})
</script>
<style type="text/css">

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
	3
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #bbdefb;
}
 /*   td {  */
 /*     background-color: #e3f2fd;  */
 /*   }  */
</style>
</head>
<body>
${user }dsdada
${order }sadasd
	<div id="content" class="content" data-page="shoppingBag"
		data-page-type="direct">
		<!-- 개인결제 여부 -->
		<input type="hidden" name="is_personal_payment" value="">

		<div class="inner-w800">
			<div class="title-style clf">
				<h3 class="txt fl">바로구매</h3>
				<hr width="1200px;">
				<ol class="page-location fr">
					<li class="active"><em class="icon-num">1</em> <span>바로구매</span>
						<i class="fa fa-angle-right"></i></li>
					<li><em class="icon-num">2</em> <span>주문결제</span> <i
						class="fa fa-angle-right"></i></li>
					<li><em class="icon-num">3</em> <span>주문완료</span></li>
				</ol>
			</div>

			<form class="cart-form" action="/w/cart/add" method="post">
				<input type="hidden" name="reset" value=1 />
				<div class="inner-w800">
					<table class="cartCard" data-ui="cart-card" data-ui-type="cart"
						data-artist-status="1"
						data-artist-uuid="3976308b-f229-4dd1-be1c-fc39c265f9a8"
						data-artist-name="선물정육점 (윤주민실장과 청년들)" data-delivery-style="0"
						data-delivery-policy="50000" data-delivery-charge="3500"
						data-delivery-charge-remote="3000">
						<caption class="hidden">선물정육점 (윤주민실장과 청년들) 작가님</caption>
						<colgroup>
							<col width="125px">
							<col width="*">
						</colgroup>
						<thead>
							<tr>
								<th colspan="2"><input type="hidden"
									name="membership_price" disabled value=""> <input
									type="hidden" name="artist_order_price" disabled value="">
									<input type="hidden" name="delivery_charge" disabled
									value="3500"> <label> <input class="bp"
										data-ui="check-linked"
										data-linked-parent="3976308b-f229-4dd1-be1c-fc39c265f9a8"
										type="checkbox" checked>
										<div class="txt-group">
											<b class="bold">선물정육점 (윤주민실장과 청년들) 작가님</b> <em class="light">50,000원
												이상 배송비 무료</em>
										</div>
								</label></th>
							</tr>
						</thead>
						<tbody>

							<tr class="list-item"
								data-cart-uuid='deb9cc29-2660-4f10-9692-1c97a396f910'
								data-product-uuid='421ac8f9-7bf3-46c7-b671-6138688d3ad1'>


								<td class="area-img"><input class="bp"
									data-ui="check-linked"
									data-linked-child="3976308b-f229-4dd1-be1c-fc39c265f9a8"
									type="checkbox" data-action="disable_inputs" checked>
									<div class="img-bg"
										style="background-image: url(https://image.idus.com/image/files/2dc0c872222c471c866799eb7d190acc_512.jpg)"></div>
								</td>

								<td class="area-txt">
									<div class="txt-group">
										<a class="bold"
											href="/w/product/421ac8f9-7bf3-46c7-b671-6138688d3ad1"
											target="_blank"> <label for="prd-name">🔥(1+1)50%할인🔥1등급이상
												등심돈까스 최고품질</label>
										</a> <em class="light">주문시 제작</em>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="flexible">
									<ul class="list-options">
										<li data-artist-uuid=3976308b-f229-4dd1-be1c-fc39c265f9a8
											data-option-status='1'
											data-key=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.W10.KeNJL7OHOBUKI4Kwxps2GAfH4hwNTSPnsTZuBXVDu18
											data-state=>
											<div class="table-layout">
												<div class="split">
													<span class="option-txt"></span>
													<div class="input-number" data-ui="input-number"
														data-state="">
														<label
															for="cart_list[421ac8f9-7bf3-46c7-b671-6138688d3ad1][item][0][count]">수량</label>
														<button type="button" data-type="decrement">-</button>
														<div class="input-area">
															<input class="prd-count"
																name="cart_list[421ac8f9-7bf3-46c7-b671-6138688d3ad1][item][0][count]"
																type="number" value="1" min="1" max="999"
																autocomplete="off" data-product-price="9900"
																data-option-price="0"
																data-product-uuid="421ac8f9-7bf3-46c7-b671-6138688d3ad1"
																data-price="9900" data-status='1' data-status-value='1'
																data-action="change_count">
														</div>
														<button type="button" data-type="increment">+</button>
													</div>
												</div>
												<div class="split">
													<strong><em class="cost-text">9,900원</em></strong> <span
														class="btn-group">
														<button class="ui_btn--small" type="button"
															data-modal-trigger="edit-prd-options" data-modal="open"
															data-action="edit_option"
															data-product-uuid="421ac8f9-7bf3-46c7-b671-6138688d3ad1">
															<i class="ui_icon--cogwheel"></i>
														</button>
														<button class="ui_btn--small" type="button"
															data-action="remove_parent"
															data-product-uuid="421ac8f9-7bf3-46c7-b671-6138688d3ad1"
															data-cart-index=0>
															<i class="ui_icon--close"></i>
														</button>
													</span>
												</div>
											</div>
										</li>
									</ul>
									<div class="ui_field--onchange" data-uipack="textarea"
										data-state="">
										<div class="ui_field__txtarea">
											<textarea
												name="cart_list[421ac8f9-7bf3-46c7-b671-6138688d3ad1][message]"
												maxlength="500" placeholder="주문 요청사항을 입력해주세요"></textarea>
											<em class="ui_field__chars">500</em>
										</div>
										<button type="submit" class="ui_field__btn"
											data-action="reload">저장</button>
									</div>
								</td>
							</tr>
							<tr class="static-row delivery-segment">
								<th>배송비</th>
								<td>
									<div data-freeship="true" style="display: none">
										<input type="text" name="shipping_price" data-unformated="0"
											value="무료 배송" readonly disabled>
										<input type="text" style="display: none"
											name="free_shipping_policy" data-unformated="50000"
											value="50,000원 이상" readonly disabled>
									</div>

									<div data-freeship="false">
										<input type="text" name="shipping_price"
											data-unformated="3500" value="3,500 원" readonly disabled>
										<input style="display: none" type="text"
											name="free_shipping_policy" data-unformated="50000"
											value="50,000원 이상" readonly disabled>
									</div> <input type="text" name="remote_shipping_price"
									data-unformated="3000" value="3,000원" readonly disabled>
									<div data-vip="true"
										style="border: 1px solid #f00; display: none">
										<span>VIP 클럽 적용</span> <span>- 3,500원</span>
									</div>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="mobile-row inner-w800">
					<div class="check-control">
						<label> <input class="bp" type="checkbox"
							data-ui="check-all"
							data-target-selector='[data-ui="check-linked"]' checked>
							<span> 전체선택(<em data-ui="check-all-count">0</em>/<em
								class="check-count-total">1</em>)
						</span>
						</label>
						<button class="ui_btn--mini" type="button"
							data-action="delete_checked_list" data-endpoint="/w/cart/delete">선택
							삭제</button>
					</div>
				</div>
				<div class="scroll-detector-desktop" data-ui="sticky">
					<div class="mobile-row inner-w800 dfixed">
						<div class="border-wrapper">
							<table class="table-cost">
								<thead>
									<tr>
										<th><span>총 주문 금액</span></th>
										<th><span>배송비</span></th>
										<th class="optional"><span>작가님 할인 혜택</span></th>
										<th><span>결제 예정금액</span></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><strong data-payment="order">0</strong>원</td>
										<td><span>+</span><strong data-payment="shipping">0</strong>원</td>
										<td class="optional"><span>-</span><strong
											data-payment="artist_coupon">0</strong>원</td>
										<td class="hilight red"><span>=</span><strong
											data-payment="cart_total">0</strong>원</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="scroll-detector" data-ui="sticky">
							<fieldset class="area-btn mfixed">
								<button type="button" class="ui_btn--red--large submit"
									data-type="payment">작품 주문하기</button>
							</fieldset>
						</div>
					</div>
				</div>
			</form>
			<div class="bg-container">
				<div class="ui_title--sub">
					<span class="ui_title__txt">다른 고객님들 <em class="hilight red">장바구니</em>
						훔쳐보기
					</span>
				</div>
				<div id="dablewidget_AlmrkYX1" data-widget_id="AlmrkYX1"></div>
			</div>
		</div>
	</div>
	<!-- 옵션수정 모달 -->
<div class="modal root" data-modal-root data-modal-id="edit-prd-options" style="display:none;">
    <div class="modal overlay" data-modal-overlay></div>
    <div class="modal wrap modal-m">
        <div class="modal head">
            <h1>옵션수정 / 추가</h1>
            <div class="modal close" data-modal="close">
            </div>
        </div>
        <section class="modal body ui-product-detail">
        </section>
    </div>
</div>
<!-- 쿠폰 모달 -->
<div class="modal root" data-modal-root data-modal-id="coupon-list" style="display:none;">
    <div class="modal overlay" data-modal-overlay></div>
    <form class="modal wrap modal-m" data-form="coupon-form" data-type="artist">
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
<script>
// Dable 하A_그리드8_EMPTY_장바구니 위젯 시작/ 문의 http://dable.io
(function(d,a){d[a]=d[a]||function(){(d[a].q=d[a].q||[]).push(arguments)};}(window,'dable'));
dable('renderWidget', 'dablewidget_AlmrkYX1');
// Dable 하A_그리드8_EMPTY_장바구니 위젯 시작/ 문의 http://dable.io
$(function() {
    if (window.kakaoPixel) {
        kakaoPixel('4255617525139617103').viewCart();
    }
    // 바로구매 페이지
    // 작품 옵션 수정 + 삭제 비활성화
    if ($('[data-page-type="direct"]').length || $('[data-page-type="personal"]').length) {
        $('[data-modal-trigger="edit-prd-options"], [data-action="remove_parent"]').prop('disabled',true);
    };

    //카트 체크 상태 확인
    $('[data-ui="check-linked"]').each(function() {
        if (!$(this).prop('checked')) {
            $(this).removeAttr('checked').trigger('change');
        }
    });

    function disableUnchecked(reset) {
        var $uncheckedOtions = $('[data-ui="cart-card"]').find('[data-action="disable_inputs"]').not(':disabled').not(':checked').closest('.list-item').next();
        var disable = true;

        if (reset) {
            disable = false;
        }

        $uncheckedOtions.each(function() {
            $(this).find('input, textarea').prop('disabled', disable);
        });
    };

    $('.submit').on('click', function (e) {
        var $this = $(this);
        var $form = $('.cart-form');

        e.preventDefault();
        disableUnchecked();
        var param = $form.serializeArray();

        if ($this.data('type') == 'payment') {
            param.push({name: 'type', value: 'payment'});
        }

        $.post($form.attr('action'), param, function (response) {
            if (response.error) {
                alert(response.error.message);
                disableUnchecked(true);
                return;
            }

            var url = '/';

            if (response.url) {
                url = response.url;
            }

            if (window.fbq) {
                var productUuidList = [];
                $('.cart-form').find('.list-item').each(function (index) {
                    var $this = $(this);
                    var productUuid = $(this).data('productUuid');

                    if ($this.find('input:checked').length) {
                        productUuidList.push(productUuid);
                    }
                });

                if (productUuidList) {
                    fbq('track', 'InitiateCheckout', {
                        content_ids: productUuidList,
                        content_type: 'product'
                    });
                }

                AF.event({
                    action: 'checkout', category: 'cart', label: productUuidList
                });
            }

            if (window.dablena) dablena('track', 'InitiateCheckout');

            window.location.href = url;
        }, 'json');

    });

     // 전체 작품 주문
     $('[data-type="payment-all"]').on('click', function() {
        if (!$('[data-ui="check-all"]').prop('checked')) {
            $('[data-ui="check-all"]').trigger('click').change();
        }

        $('[data-type="payment"]').trigger('click');
    });

    $(window).on('load', function() {
        disableUnchecked(true);
    });
});
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
        <!-- div WRAP -->
                <script type="text/javascript" src="/resources/dist/js/idus.web.min.js?__v=1593495292"></script>
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