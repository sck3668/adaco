<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<script>
// 1.작품 이미지 출력
	function loadImage() {
		var file = $("#sajin")[0].files[0];	
		var maxSize = 1024*1024; // 1MB
		if(file.size>maxSize) {
			Swal.fire({
				icon: 'error',
			  	title: '크기 오류',
				text: '파일크기는 1MB를 넘을 수 없습니다'
			});
			$("#sajin").val("");
			return false;
		}
		
		// 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#show_profile").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
		return true;
	}
</script>
</head>
<body>	
	<form role="form" method="post" autocomplete="off">

		<input type="hidden" name="artNum" value="${art.artNum}" />
		작품 기본정보 입력
		<hr>
		<div class="inputArea">
			<label>카테고리</label> <select class="category">
				<option value="${art.category}">전체</option>
				<option value="${art.category}">가방,파우치</option>
				<option value="${art.category}">공예품</option>
				<option value="${art.category}">악세서리</option>
			</select> 
		</div>
		<div class="inputArea">
			<label for="artName">작품명</label> 
			<input type="text" id="artName" name="artName" value="${art.artName}" />
		</div>
		<div>
			<img id="show_artfile" height="200px;" src="${art.artImg }">
		</div>
		<div class="inputArea">
			<label for="artImg">작품 이미지</label> 
			<input type="file" id="artImg" name="artImg" />
		</div>
		<div class="inputArea">
			<label for="artPrice">작품가격</label> 
			<input type="text" id="artPrice" name="artPrice" value="${art.price}" />
		</div>
		<div class="inputArea">
			<label for="artStock">작품수량</label> 
			<input type="text" id="artStock" name="artStock" value="${art.stock}" />
		</div>
		<div class="inputArea">
			<label for="artDetail">작품소개</label>
			<textarea rows="5" cols="50" id="artDetail" name="artDetail">${art.artDetail}</textarea>
		</div>
		옵션여부
		<input type="radio" name="optionox" value="yes" checked="checked" /> 예
		<input type="radio" name="optionox" value="no"  /> 아니오
		<div class="inputArea">
		<label for="artPrice">옵션</label> 
				<div id="optionArea">
					<span class="key">옵션명 </span><input type="text" id="optionname" ><br>
					<span class="key">옵션값 </span><input type="text" id="optionvalue"><br>
					<span class="key">옵션 추가가격 </span><input type="text" id="optionprice"><br>
					<span class="key">옵션재고 </span><input type="text" id="optionstock">
				</div>
		</div>
		<div class="inputArea">
			<label for="artTag">검색태그</label> 
			<input type="text" id="artTag" name="artTag" value="${art.tag}" />
		</div>
		<br>
		작품 배송 정보 입력
		<hr>
		<div class="inputArea">
			<label for="artCourier">택배사</label> 
			<input type="text" id="artCourier" name="artCourier" value="${art.courier}" />
		</div>
		<div class="inputArea">
			<label for="artCouriPrice">배송가격</label> 
			<input type="text" id="artCouriPrice" name="artCouriPrice" value="${art.couriPrice}" />
		</div>
		<div class="inputArea">
			<button type="submit" id="update_Btn" class="btn btn-primary">저장</button>
			<button type="submit" id="back_Btn" class="btn btn-warning">취소</button>
		</div>
	</form>
</body>
</html>