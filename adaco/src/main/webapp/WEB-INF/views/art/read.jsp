<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
</head>
<body>	
${artPageByUser}
	<div id="wrap">
	<section id="img-section" class="prd-dateil-section">
	<div class="image-preview ui-slider">
		<div class="outer-frame">
			<ul class="img-view inner-frame">
				<li class="ui-slide-img slide-img" style="width: 0px;">
				 <img src=" ${artPageByUser.mainImg } " alt="작품 이미지" ><!-- 스타일 적용 안됨 style="margin-left: -440.5px; margin-top: -440.5px;"  -->
				</li>
				<li class="ui-slide-img slide-img" style="width: 0px;">
<!-- 		이미지 링크2 <img src=" img.jpg " alt style="margin-left: -440.5px; -->
<!-- 						margin-top: -440.5px;"> -->
				</li>	
				<li class="ui-slide-img slide-img" style="width: 0px;">
<!-- 		이미지 링크3 <img src=" img.jpg " alt style="margin-left: -440.5px; -->
<!-- 						margin-top: -440.5px;"> -->
				</li>
				<li class="ui-slide-img slide-img" style="width: 0px;">
<!-- 		이미지 링크4 <img src=" img.jpg " alt style="margin-left: -440.5px; -->
<!-- 						margin-top: -440.5px;"> -->
				</li>	
				<li class="ui-slide-img slide-img" style="width: 0px;">
<!-- 		이미지 링크5 <img src=" img.jpg " alt style="margin-left: -440.5px; -->
<!-- 						margin-top: -440.5px;"> -->
				</li>	
			</ul>
		</div>
		<aside class="sticky_aside" data-ui="sticky_aside" data-state data-offset="36">
		
		<div class="">
			<div class="">
				상점명 : ${artPageByUser.shopName} + ${artPageByUser.username} &emsp;&emsp;&emsp; 작품 번호 : ${artPageByUser.artno}  &emsp;&emsp;&emsp; 조회수 : ${artPageByUser.readCnt}
			</div>
		</div>
		
		<h2 class="sticky_aside_title">${artPageByUser.artName}
		</h2>
		<span class="price_tag_strong">
		<strong class=price>${artPageByUser.price}</strong>
		</span>
		<div class="product-define-info">
			<div class="data-row">
				<table>
					<tr>
						<td class="data-row_title">적립금
						</td>
						<td class="data-row_content">
							<span>
								<!-- 구매금액의 n% 입력 -->
							  <span class="bold-txt"> 495P</span>
							</span>
					</tr>
				</table>
			</div>
			<div class="">
				<table>
					<tr>
						<td class="">구매후기</td>
						<td>&hearts;&hearts;&hearts;&hearts;&hearts;</td>
						<td>(2)</td>
					</tr>
				</table>
			</div>
			<div class="">
				<table>
					<tr>
						<td class="">배송비</td>
						<td class="">
							<span>
								<span>3000원</span>
								<span class="subcontent">(50,000원 이상 무료배송)</span>
							</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="">
				<table>
					<tr>
						<td class="">배송 시작</td>
						<td class="">
							<div class="">
								최대 5일 이내
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="">
				<table>
					<tr>
						<td class="">재고 : ${artPageByUser.stock}</td>
						<td class="">
							제작 시기 : <span>주문시 제작</span>
						</td>
					</tr>
				</table>
			</div>
			<!--작품 옵션 선택 -->
			<div>
				<div class="">
					<form class="">
						<div class="">
							<select>
								<strong class=option>${artPageByUser.optionName}</strong>
								<option>옵션명 선택</option>
								<option>${artPageByUser.optionName}</option>
								<option>2</option>
								<option>3</option>
							</select>
							<select>
								<strong class=option>${artPageByUser.optionValue}</strong>
								<option>옵션값 선택</option>
								<option>${artPageByUser.optionValue}</option>
								<option>2</option>
								<option>3</option>
							</select>
						</div>
					</form>				
				</div>
			</div>
		</div>
		</aside>
<!-- 		<nav class="nav_hide"> -->
		
<!-- 		</nav> -->
<!-- 	</div>	 -->
<!-- 		<div id="title_div"> -->
<!-- 			<div id="upper"> -->
<!-- 				<input type="text" id="title" disabled="disabled"> -->
<!-- 				<span id="writer"></span> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<ul id="attachment"> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div id="content_div"> -->
<!-- 			<div class="form-group"> -->
<!-- 				<div class="form-control" id="content"></div> -->
<!-- 			</div> -->
<!-- 			<div id="btn_area"> -->
<!-- 				<button id="update" class="btn btn-info">변경</button> -->
<!-- 				<button id="delete" class="btn btn-success">삭제</button> -->
<!-- 			</div> -->
		</div>
			<fieldset class="">
				<button type="submit" class="">장바구니</button>
				<button>구매하기</button>
			</fieldset>		
	</section>
</div>
</html>