<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가전용 작품 상세 페이지</title>
<!--<sec:authorize access="hasRole('ROLE_SELLER')">
	
</sec:authorize>-->

<script>
$(function() {
	// select box에 택배사 값 받아오기
	var $courier = $("#courier").val(); 
	var $select = $("#Courier").find("option");
	$select.each(function(idx, option) {
	if($(option).text()==$courier) {
	$($select[idx]).prop("selected", true);
	}
	});
	
	// select box값으로 택배사 변경
	$("#Courier").on("change", function() {
		var choice = $("#Courier").val();
		if(choice!="택배사 선택") {
		$("#courier").val(choice);
		$("#courier").prop("disabled", true);
		}
		if(choice=="택배사 선택") {
		alert("택배사를 선택해주세요");
		}
		})
		
	// '저장'버튼으로 옵션만 수정
	$("#updateOption").on("click", function() {
		var $optionName = $("#optionName").val();
		var $optionValue = $("#optionValue").val();
		var $optionPrice = $("#optionPrice").val();
		var $optionStock = $("#optionStock").val();
		
		var params = {
			_method: "put",
			_csrf: "${_csrf.token}",
			artno : ${artDetailPage.artno},
			optionName: $optionName,
			optionValue: $optionValue,
			optionPrice: $optionPrice,
			optionStock: $optionStock,
			optno:${artDetailPage.optno}
		};
		//console.log(params);
		//alert("SS");
		$.ajax({
			url: "/adaco/art/update",
			method: "post",
			data: params
		}).done(()=>{alert("옵션이 수정되었습니다.");})
		.fail(()=>{alert("옵션 수정이 실패했습니다.");});
	});
	
	// '수정'버튼으로 선택적으로 수정
	$("#update_Btn").on("click", function() { 
		var $artName = $("#artName").val();
		var $price = $("#artPrice").val();
		var $stock = $("#artStock").val();
		var $tag = $("#artTag").val();
		var $couriPrice = $("#artCouriPrice").val();
		var $courier = $("#courier").val();
		var $artDetail = $("#artDetail").val();
		var $optionName = $("#optionName").val();
		var $optionValue = $("#optionValue").val();
		var $optionPrice = $("#optionPrice").val();
		var $optionStock = $("#optionStock").val();
		
		var params={
				_method:"put",
				_csrf:"${_csrf.token}",
				artno : ${artDetailPage.artno},
				optno:${artDetailPage.optno},
				artName: $artName,
				price : $price,
				stock : $stock,
				tag : $tag,
				couriPrice : $couriPrice,
				courier : $courier,
				artDetail : $artDetail,
				optionName: $optionName,
				optionValue: $optionValue,
				optionPrice: $optionPrice,
				optionStock: $optionStock
		}
		//console.log(params);
		$.ajax({
			url: "/adaco/art/update",
			data: params,
			method: "post",
		}).done(()=>{alert("작품이 수정되었습니다.");})
		.fail(()=>{alert("작품 수정이 실패했습니다.");})
	})
});
	
	function loadImage() {
	
	var file = $("#artImg")[0].files[0];
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#artImg").val("");
		return false;
	}
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_artfile").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
	
	$("#artImg").on("change", loadImage);
	}
	
	


</script>
</head>
<body>	
${artDetailPage}
	<h2>상세 정보 조회 및 수정</h2><br>
	<form role="form" method="post" autocomplete="off">
		<input type="hidden" name="artNum" value="${art.artNum}" />
		<h5>작품 기본정보</h5><br>
		<table class="table table-hover" id="art">
			<tr>
				<td class="first">작품번호</td>
				<td colspan="2">
				<span id="category">${artDetailPage.artno}</span></td>
			</tr>
			<tr>
				<td class="first">카테고리</td>
				<td colspan="2">
				<span id="category">${artDetailPage.category}</span></td>
			</tr>
			<tr>
				<td class="first">작품명</td>
				<td colspan="2">
				<input type="text" id="artName" name="artName" value="${artDetailPage.artName}" />
				</td>
			</tr>
			<tr>
				<td class="first">작품 이미지</td>
				<td colspan="2">
				<img id="show_artfile" height="200px;" src="${artDetailPage.mainImg }" alt="상품 사진">
				<input type="file" id="artImg" name="artImg" />
				</td>
			</tr>
			<tr>
				<td class="first">작품가격</td>
				<td colspan="2">
				<input type="text" id="artPrice" name="artPrice" value="${artDetailPage.price}" /> 원
				</td>
			</tr>
			<tr>
				<td class="first">작품수량</td>
				<td colspan="2">
				<input type="text" id="artStock" name="artStock" value="${artDetailPage.stock}" />
				</td>
			</tr>
			<tr>
				<td class="first">작품소개</td>
				<td colspan="2">
				<textarea rows="5" cols="50" id="artDetail" name="artDetail">${artDetailPage.artDetail}</textarea>
				</td>
			</tr>
			<tr>
			<td class="first">옵션</td>
				<td colspan="2">
					<div id="optionArea">
						<span class="key">옵션명 </span><input type="text" id="optionName" value="${artDetailPage.optionName}"><br>
						<span class="key">옵션값 </span><input type="text" id="optionValue" value="${artDetailPage.optionValue}"><br>
						<span class="key">옵션 추가가격 </span><input type="text" id="optionPrice" value="${artDetailPage.optionPrice}"><br>
						<span class="key">옵션재고 </span><input type="text" id="optionStock" value="${artDetailPage.optionStock}">
		  				<button type="button" class="btn btn-primary" id="updateOption">저장</button>
					</div>
				</td>
			</tr> 
			<tr>
				<td class="first">검색태그</td>
				<td colspan="2">
				<input type="text" id="artTag" name="artTag" value="${artDetailPage.tag}" />
				</td>
			</tr>
		</table>
		<br>
		<h5>작품 배송정보 </h5><br>
		<table class="table table-hover" id="artShipping">
			<tr>
				<td class="first">택배사</td>
				<td colspan="2">
				<select id="Courier">
					<option selected="selected">택배사 선택</option>
					<option>대한통운</option>
					<option>로젠택배</option>
					<option>한진택배</option>
				</select> 
				<input type="hidden" id="courier" name="courier" value="${artDetailPage.courier}" />
				</td>
			</tr>
			<tr>
				<td class="first">배송가격</td>
				<td colspan="2">
				<input type="text" id="artCouriPrice" name="artCouriPrice" value="${artDetailPage.couriPrice}" />
				</td>
			</tr>
		</table>
		</form>
		<div class="inputArea" align="center">
			<button type="submit" id="update_Btn" class="btn btn-primary">수정</button>
			<button type="submit" id="back_Btn" class="btn btn-warning">취소</button>
		</div>
</body>
</html>