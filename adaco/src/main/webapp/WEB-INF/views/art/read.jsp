<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<style>
	#main {
		padding-left: 50px;
		width:900px;
		border: 1px solid black;
	}
	#image {
		width: 400px;
		height: 500px;
		border : 1px solid gray;
		display: inline-block;
	}
	img {
		width:390px;
		height:490px;
	}
	#content {
		width: 400px;
		height: 500px;
		border : 1px solid gray;
		float: right;
	}
	#button {
		width:500px;
		float: right;
	}
</style>
<script>
$(function() {
	//즐겨찾기 추가
	$("#favorite").on("click",function() {
		var params ={
				_csrf:"${_csrf.token}",
				artno: ${artPageByUser.artno},
		}
		console.log(params);
		alert("ㅇㅇ");
		$.ajax({
			url:"/adaco/user/favoriteAdd",
			method:"post",
			data:params,
		})
	})
	
	// 구매하기
	$("#payment").on("click",function(){
		var params  ={
			_csrf: '${_csrf.token}',
			username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
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
			url:"/adaco/order/payment",
			method:"get",
			data:params,
			success: function(result){
				alert("성공");
			}
			
		})
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
				},error:function() {
					alert("실패실패");
				}
			})
					
		})
	
	
	
	
});

</script>
</head>
<body>	
${artPageByUser}
<div>
	<div id="main">
		<div id="image">
			<img alt="image" src="${pageContext.request.contextPath}/image/art1.jpg">
		</div>
		<div id="content">
			<h3>${artPageByUser.artName }</h3><br>
			<div id="content1">
				<div>
					<table>
						<colgroup>
							<col width="20%">
							<col width="50%">
						</colgroup>
						<tr>
							<td>가격:</td>
							<td>${artPageByUser.price}원</td>
						</tr>
					</table>
					<table>
						<colgroup>
							<col width="20%">
							<col width="50%">
						</colgroup>
						<tr>
							<td>적립금:</td>
							<td>${artPageByUser.price*0.01}원</td>
						</tr>
					</table>
					<table>
						<colgroup>
							<col width="20%">
							<col width="50%">
						</colgroup>
						<tr>
							<td>택배사:</td>
							<td>${artPageByUser.courier}</td>
						</tr>
					</table>
					<table>
						<colgroup>
							<col width="20%">
							<col width="50%">
						</colgroup>
						<tr>
							<td>배송비:</td>
<%-- 								<c:choose> --%>
<%-- 								<c:if test="${artPageByUser.price+artPageByUser.optionPrice>500}"> --%>
<!-- 									<td>무료배송</td> -->
<%-- 								</c:if> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<td>3000원</td> -->
<%-- 								</c:otherwise> --%>
<%-- 								</c:choose> --%>
							<td>3000원</td>
						 </tr>
					</table>
					<table>
						<colgroup>
							<col width="20%">
							<col width="50%">
						</colgroup>
						<tr>
							<td>재고:</td>
							<td>${artPageByUser.stock }</td>
						</tr>
					</table>
					
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
					<select>
						<option selected="selected">${artPageByUser.optionName }을 선택하세요</option>
						<option value="optionName">${artPageByUser.optionValue }</option>
					</select>
					<div>
						<span>총 작품금액</span>
						<strong>${artPageByUser.price+artPageByUser.optionPrice}</strong>
					</div>				
				</div>
			</div>
		</div>
	</div>
	<div id="button">
		<button type="button" id="addBag">장바구니</button>
		<button type="button" id="payment">구매하기</button>
		<button type="button" id="favorite">즐겨찾기</button>
	</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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