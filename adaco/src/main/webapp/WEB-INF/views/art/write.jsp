<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<script src="/aboard/script/artValid.js"></script>
<script>
// 1.작품 이미지 출력 //	사진출력이 안됨
	function loadImage() {
		var file = $("#artImg")[0].files[0];	
		var maxSize = 1024*1024;
		
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
	}
	
	$(function() {
		// form을 넘기기전에 값 확인
		$("#insert_Btn").on("click", function() {
			console.log($("#insert_art").serialize());
			//$("#insert_art").submit();
		});
	});
	
	// '취소' 클릭 시 상품목록으로 이동 -> 에러남
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
			<!-- <input type="hidden" name="artNum" value="${art.artNum}" /> -->
			작품 기본정보 입력
			<hr>
			<div class="inputArea">
				<label>카테고리</label> <select class="category">
					<option value="카테고리 선택" selected="selected">카테고리 선택</option>
					<option value="가방,파우치">가방,파우치</option>
					<option value="공예품">공예품</option>
					<option value="악세서리">악세서리</option>
				</select> 
			</div>
			<div class="inputArea">
				<label for="artName">작품명</label>
					<input type="text" id="artName" name="artName" />
				<span id="artName_msg"></span>
			</div>
			<div class="inputArea">
				<label for="artImg">작품 이미지</label> 
				<input type="file" id="artImg" name="artImg" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
			<div>
				<img id="show_artfile" height="200px;">
			</div>
			</div>
			<div class="inputArea">
				<label for="artPrice">작품가격</label> 
				<input type="text" id="artPrice" name="artPrice" />원
				<span id="artPrice_msg"></span>
			</div>
			<div class="inputArea">
				<label for="artStock">작품수량</label> 
				<input type="text" id="artStock" name="artStock" />
				<span id="artStock_msg"></span>
				
			</div>
			<div class="inputArea">
				<label for="artDetail">작품소개</label>
				<textarea rows="5" cols="50" id="artDetail" name="artDetail"></textarea>
				<span id="artDetail_msg"></span>
			</div>
			옵션여부
			<input type="radio" name="optionox" value="yes" checked="checked" /> 예
			<input type="radio" name="optionox" value="no"  /> 아니오
			<div class="inputArea">
			<label for="artPrice">옵션</label> 
				<div id="optionArea">
					<span class="key">옵션명 </span><input type="text" id="optionName" >
					<span id="optionName_msg"></span><br>
					<span class="key">옵션값 </span><input type="text" id="optionValue">
					<span id="optionValue_msg"></span><br>
					<span class="key">옵션 추가가격 </span><input type="text" id="optionPrice">
					<span id="optionPrice_msg"></span>원<br>
					<span class="key">옵션수량 </span><input type="text" id="optionStock">
					<span id="optionStock_msg"></span>
				</div>
			</div>
			<div class="inputArea">
				<label for="artTag">검색태그</label> 
				<input type="text" id="artTag" name="artTag" />
				<span id="artTag_msg"></span>
			</div>
			<br>
			작품 배송 정보 입력
			<hr>
			<div class="inputArea">
				<label for="artCourier">택배사</label> 
				<select class="Courier">
					<option value="택배사" selected="selected">택배사</option>
					<option value="대한통운">대한통운</option>
					<option value="로젠택배">로젠택배</option>
					<option value="한진택배">한진택배</option>
				</select> 
			</div>
			<div class="inputArea">
				<label for="artCouriPrice">배송가격</label> 
				<input type="text" id="artCouriPrice" name="artCouriPrice" />
				<span id="artCouriPrice_msg"></span>
			</div>
			<div class="inputArea" align="center">
				<button type="button" id="insert_Btn" class="btn btn-primary">저장</button>
				<button type="submit" id="back_Btn" class="btn btn-warning">취소</button>
			</div>
		</form>
	</div>
</body>
</html>