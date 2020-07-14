<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<style>
	.visual_img li {
	position: relative;
	display: inline;
}

	.visual_img img {
		width: 500px;
		height: 400px;	
	}
</style>
<script>
function checkFavorite() {
	var $isFavorite = ${artPageByUser.isFavorite}
	if($isFavorite == true)
		$("#favorite").text("★즐겨찾기");
	else
		$("#favorite").text("☆즐겨찾기");
}

$(function() {
	checkFavorite();
	var image_ul = document.querySelector(".visual_img");

	var imgCnt = 0;
	/* Animation: sliding setting */
	image_ul.querySelectorAll("li").forEach(()=> {
		imgCnt ++;
	});
	image_ul.style.width = (image_ul.offsetWidth * imgCnt) + "px";
	
	//console.log(imgCnt);
	//console.log(image_ul.style.width);
	slideShow(imgCnt);

	/* Animation: sliding */
	function slideShow(imgCnt) {
		var curIndex = 0;
		
		setInterval( () => {
			image_ul.style.transition = "transform 5s ease-out";
			image_ul.style.transform = "translate3d(-" + 414*(curIndex+1)+"px, 0px, 0px)";
			curIndex++;
			
			console.log(curIndex);
			if( curIndex === imgCnt-1 ) {
				curIndex = -1;
			}
		},5000);	
	};
	//즐겨찾기 추가
	$("#favorite").on("click",function() {
		var params ={
				_csrf:"${_csrf.token}",
				artno: ${artPageByUser.artno},
		}
		$.ajax({
			url:"/adaco/user/favoriteUpdate",
			method:"post",
			data:params
		}).done(()=>location.reload(true)).fail(()=>alert("알 수 없는 오류가 발생했습니다."))
	});
	
	// 구매하기
	$("#payment").on("click",function(){
		var params  ={
			_csrf: '${_csrf.token}',
			username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
// 			orderno : ${ordering.orderno},
// 			orderDate: '${ordering.orderDate}',
// 			shippingCharge : '${ordering.shippingCharge}',
// 			artName : ${ordering.artName},
			artno:${artPageByUser.artno},
			totalPrice:${artPageByUser.price},
			amount:1, 
			optionName:'${artPageByUser.optionName}',
			optionValue:'${artPageByUser.optionValue}',
			optionStock:${artPageByUser.optionStock}, 
			optionPrice:'${artPageByUser.optionPrice}', 
		
		};
			
		console.log(params);
			alert("var");
			$.ajax({
			url:"/adaco/order/ordering",
			method:"get",
			data:params,
		})
				alert("성공");	
		}) 
	
	//장바구니 추가
	$("#addBag").on("click",function() {
			var params = {
				_csrf : "${_csrf.token}",
				username: "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}",
				artno:${artPageByUser.artno},
				totalPrice:${artPageByUser.price},
				amount:1,
				optionName:'${artPageByUser.optionName}',		
				optionValue:'${artPageByUser.optionValue}',
				optionStock:${artPageByUser.optionStock},
				optionPrice:'${artPageByUser.optionPrice}',
			};
			console.log(params);
			alert("sss");
			$.ajax({
				url:"/adaco/bag/add",
				method:"post",
				data:params,
				success:function(result){
					alert("tjdrhd");
					if(result=="1")
						alert("성공");
					else
						alert("실패");
				},error:function(result) {
					console.log(result);
					alert("실패실패");
				}
			})
	});
});
</script>
</head>
<body>	
<div>
	<div id="main">
		<div>
		  <div class="container_visual">
		    <!-- Promotion -->
		    <!-- 슬라이딩기능: 이미지 (type = 'th')를 순차적(javascript) 으로 노출 -->
		    <ul class="visual_img">
		      <c:forEach items="${image}" var="image">
		        <li><img src="${image.gyungro}"/></li>
		      </c:forEach>
		    </ul>
		  </div>
		  <span class="nxt_fix" style="display:none;"></span>
		</div>
		<div id="content">
			<h3><strong>${artPageByUser.artName }</strong></h3><br>
			<div id="content1">
			<table class = "table table-hover" style="text-align: center;">
				<tr>
					<td class = "price">가격 </td>
					<td>${artPageByUser.price } 원</td>
				</tr>
				<tr>
					<td class = "price">적립금</td>
					<td>${artPageByUser.price*0.01 } 원</td>
				</tr>
				<tr>
					<td class = "price">배송사</td>
					<td>${artPageByUser.courier }</td>
				</tr>
				<tr>
					<td class = "couri">배송비</td>
					<td>${artPageByUser.couriPrice } 원</td>
				</tr>
				<tr>
					<td class = "stock">남은 수량</td>
					<td>${artPageByUser.stock }</td>
				</tr>
				<tr>
					<td class = "option">옵션 선택</td>
					<td>
						<select>
						<option selected="selected">${artPageByUser.optionName }을 선택하세요</option>
						<option value="optionName">${artPageByUser.optionValue }</option>
						</select>
					</td>
				</tr>
			</table>
				<div>
			       	 					
<%-- 						<c:forEach items="${artPageByUser}" var="artPageByUser"> --%>
<!-- 							<select>	 -->
<%-- 								<strong class=option>${artPageByUser.optionName}</strong> --%>
<!-- 								<option>옵션명 선택</option> -->
<%-- 								<option>${artPageByUser.optionName}</option> --%>
<!-- 							</select> -->
<!-- 							<select> -->
<%-- 								<strong class=option>${artPageByUser.optionValue}</strong> --%>
<!-- 								<option>옵션값 선택</option> -->
<%-- 								<option>${artPageByUser.optionValue}</option> --%>
<!-- 							</select> -->
<%-- 						</c:forEach> --%>
					<br><br>
					<div>
						<span>총 결제 금액</span>
						<strong>${artPageByUser.price+artPageByUser.optionPrice}</strong>
					</div>				
				</div>
			</div>
		</div>
	</div>
	<div id="button" style="text-align: center;">
		<button type="button" class = "btn btn-success" id="addBag">장바구니</button>
		<button type="button" class = "btn btn-primary" id="payment">구매하기</button>
		<button type="button" class = "btn btn-warning" id="favorite">☆즐겨찾기</button>
	</div>
	<br><br><br><br>
	<h3><strong>작품 소개</strong></h3>
	<br>
	<textarea style="width: 900px; min-height: 600px; text-align: center; border: none;" readonly="readonly">
		${artPageByUser.artDetail }
	</textarea>
</div>

</html>