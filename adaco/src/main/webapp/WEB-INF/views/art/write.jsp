<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<script src="/adaco/script/artValid.js"></script>
<script>
// 1.작품 이미지 출력 //	사진출력이 안됨
	function loadImage() {
		var file = $("#artSajin")[0].files[0];	
		var maxSize = 1024*1024;
		if(file.size>maxSize) {
			Swal.fire({
				icon: 'error',
			  	title: '크기 오류',
				text: '파일크기는 1MB를 넘을 수 없습니다'
			});
			$("#artSajin").val("");
			return false;
		}
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#show_artfile").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
		return true;
	}
	
//$("#category option:selected").val();
	$(function() {
		$("#artName").on("blur", checkIrum);
		$("#artSajin").on("change", loadImage);
		$("#price").on("blur", checkPrice);
		$("#artStock").on("blur", checkStock);
		$("#artDetail").on("blur", checkArtDetail);
		$("#optionName").on("blur", checkOptionIrum);
		$("#optionValue").on("blur", checkOptionValue);
		$("#optionPrice").on("blur", checkOptionPrice);
		$("#optionStock").on("blur", checkOptionStock);
		$("#artTag").on("blur", checkArtTag);
		$("#couriPrice").on("blur", checkCouriPrice);
		
		// form을 넘기기전에 값 확인
		$("#insert_Btn").on("click", function() {
		var formData = new FormData(document.getElementById("insert_art"));
		for(var key of formData.keys())
			console.log(key);
		for(var value of formData.values())
			console.log(value);
		//console.log("카테고리얌" + r1);
		var r1 = checkIrum();
		var r2 = checkPrice();
		var r3 = checkStock();
		var r4 = checkArtDetail();
		var r5 = checkOptionIrum();
		var r6 = checkOptionValue();
		var r7 = checkOptionPrice();
		var r8 = checkOptionStock();
		var r9 = checkArtTag();
		var r10 = checkCouriPrice();
		var result = r1 && r2 && r3 && r4 && r5 && r6 && r7 && r8 && r9 && r10;
		if(result===true) {
			 $("#insert_art").submit();
		}
	});
});
	
	// '취소'클릭 시 상품목록으로 이동 
	$(function() {
		$("#back_Btn").on("click", function() {
			location.href="/adaco/art/listByArtist";
		});
	});
	
</script>
</head>
<body>	
	<div id="wrap">
		<form id="insert_art" action="/adaco/art/write" method="post" enctype="multipart/form-data">
			작품 기본정보 입력
			<hr>
			<div class="inputArea">
				<label>카테고리</label> <select id="category" name="category">
					<option value="카테고리 선택" selected="selected">카테고리 선택</option>
					<option value="가방,파우치">가방,파우치</option>
					<option value="공예">공예</option>
					<option value="악세서리">악세서리</option>
					<option value="카테고리다">카테고리다</option>
				</select> 
				<input type="hidden" id="shopno" name="shopno" value="${artInfo.shopno}"/>
				<input type="hidden" id="artistno" name="artistno" value="${artInfo.artistno}"/>
			</div>
			<div class="inputArea">
				<label for="artName">작품명</label>
					<input type="text" id="artName" name="artName" />
				<span id="artName_msg"></span>
			</div>
			<div class="inputArea">
				<label for="artSajin">작품 이미지</label> 
				<input type="file" id="artSajin" name="artSajin" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
			</div>
			<div>
				<img id="show_artfile" height="240px;">
				<input type="hidden" name="_csrf" value="${_csrf.token }">
			</div>
			<div class="inputArea">
				<label for="price">작품가격</label> 
				<input type="text" id="price" name="price" />원
				<span id="artPrice_msg"></span>
			</div>
			<div class="inputArea">
				<label for="stock">작품수량</label> 
				<input type="text" id="stock" name="stock" />
				<span id="artStock_msg"></span>
			</div>
			<div class="inputArea">
				<label for="artDetail">작품소개</label>
				<textarea rows="5" cols="50" id="artDetail" name="artDetail"></textarea>
				<span id="artDetail_msg"></span>
			</div>
			<div class="inputArea">
			<label for="artOption">옵션</label> 
				<div id="optionArea">
					<span class="key">옵션명 </span><input type="text" id="optionName" name="optionName" >
					<span id="optionName_msg"></span><br>
					<span class="key">옵션값 </span><input type="text" id="optionValue" name="optionValue">
					<span id="optionValue_msg"></span><br>
					<span class="key">옵션 추가가격 </span><input type="text" id="optionPrice" name="optionPrice">
					<span id="optionPrice_msg"></span>원<br>
					<span class="key">옵션수량 </span><input type="text" id="optionStock" name="optionStock">
					<span id="optionStock_msg"></span>
				</div>
			</div>
			<div class="inputArea">
				<label for="tag">검색태그</label> 
				<input type="text" id="tag" name="tag" />
				<span id="artTag_msg"></span>
			</div>
			<br>
			작품 배송 정보 입력
			<hr>
			<div class="inputArea">
				<label for="artCourier">택배사</label> 
				<select id="Courier" name="Courier">
					<option value="택배사" selected="selected">택배사</option>
					<option value="대한통운">대한통운</option>
					<option value="로젠택배">로젠택배</option>
					<option value="한진택배">한진택배</option>
				</select> 
			</div>
			<div class="inputArea">
				<label for="artCouriPrice">배송가격</label> 
				<input type="text" id="couriPrice" name="couriPrice" />
				<span id="artCouriPrice_msg"></span>
			</div>
			<div class="inputArea" align="center">
				<button type="button" id="insert_Btn" class="btn btn-primary">저장</button>
				<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
			</div>
		</form>
	</div>
</body>
</html>