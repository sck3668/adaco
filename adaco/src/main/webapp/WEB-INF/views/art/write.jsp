<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<script src="/adaco/script/artValid.js"></script>
<script>

//$("#category option:selected").val();
//     function inputNumberAutoComma(obj) {
             
//         // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
//         obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
//     }
   
//     // 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
//     function inputNumberWithComma(str) {

//         str = String(str);
//         return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
//     }

//     // 콤마( , )가 들어간 값에 콤마를 제거하는 함수
//     function inputNumberRemoveComma(str) {

//         str = String(str);
//         return str.replace(/[^\d]+/g, "");
//     }
	    
	    
	$(function() {

		var idx = 0;
		$("#add").on("click", function(){
			var cnt = $("input[name='artSajin']").length;
			if(cnt>=5){
				Swal.fire(
	        			  '최대 5개까지 등록됩니다.',
	        			  '',
	        			  'warning'
	        			)
			return;
			}
			var $input = $("<input>").attr("type", "file").attr("name", "artSajin").attr("id", "artSajin").attr("accept", ".jpg,.jpeg,.png,.gif,.bmp");
			idx++;
			$input.appendTo($("#artSajin"));
		});
		
		$("#deleteUpload").on("click", function(){
			  $("#artSajin").html("");
// 			  document.getElementById("add").disabled = false;
		});
		
		
		$("#artName").on("blur", checkIrum);
		$("#price").on("blur", checkPrice);
		$("#stock").on("blur", checkStock);
		$("#artDetail").on("blur", checkArtDetail);
		$("#optionName").on("blur", checkOptionIrum);
		$("#optionValue").on("blur", checkOptionValue);
		$("#optionPrice").on("blur", checkOptionPrice);
		$("#optionStock").on("blur", checkOptionStock);
		$("#artTag").on("blur", checkArtTag);
		$("#couriPrice").on("blur", checkCouriPrice);
		$("#category").on("blur", checkCategory);
		$("#Courier").on("blur", checkCourier);
		$("#artSajin").on("blur", checkSajin);
		
		// form을 넘기기전에 값 확인
		$("#insert_Btn").on("click", function() {
		var formData = new FormData(document.getElementById("insert_art"));
		for(var key of formData.keys())
			console.log(key);
		for(var value of formData.values())
			console.log(value);
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
		var r11 = checkCategory();
		var r12 = checkCourier();
		var r13 = checkSajin();
		var result = r1 && r2 && r3 && r4 && r5 && r6 && r7 && r8 && r9 && r10 && r11 && r12 && r13;
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
	<h2>작품 등록</h2><br>
		<form id="insert_art" action="/adaco/art/write" method="post" enctype="multipart/form-data">
			작품 기본정보 입력 <br>
			<table class="table table-hover" id="artWrite">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td class="first">카테고리</td>
					<td colspan="2">
						<span id="category">
							<select id="category" name="category" class="form-control">
								<option value="카테고리 선택" selected="selected" >카테고리 선택</option>
								<c:forEach items="${category}" var="category">
									<option value="${category.category }">${category.category }</option>
								</c:forEach>
							</select> 
							<span id="category_msg"></span>
						<input type="hidden" id="shopno" name="shopno" value="${artInfo.shopno}" class="form-control" />
						<input type="hidden" id="artistno" name="artistno" value="${artInfo.artistno}" class="form-control" />	
						</span>
					</td>
				</tr>
				<tr>
					<td class="first">작품명</td>
					<td colspan="2">
						<input type="text" id="artName" name="artName" class="form-control"  />
						<span id="artName_msg"></span>
					</td>
				</tr>
				<tr height="170">
					<td class="first">작품 이미지</td>
					<td colspan="2" style="vertical-align: bottom;">
						<div id = "artSajin"></div>	<br>			
							<button type = "button" id = "add" name="add" class="btn btn-info">작품 이미지 추가</button>
							<button type = "button" id = "deleteUpload" class="btn btn-danger" style="margin-left: 20px;">업로드 취소</button>
							<span id="artSajin_msg"></span>
					</td>
				</tr>
				<tr>
					<td class="first">작품가격</td>
					<td colspan="2">
						<input type="text" id="price" name="price" class="form-control" style="width: 300px; display: inline;" />&ensp;원   <!--onKeyup="inputNumberAutoComma(this);" value=""   --> 
						<span id="artPrice_msg"></span>
					</td>
				</tr>
				<tr>
					<td class="first">작품수량</td>
					<td colspan="2">
						<input type="text" id="stock" name="stock" class="form-control" />
						<span id="artStock_msg"></span>
					</td>
				</tr>
				<tr>
					<td class="first">작품소개</td>
					<td colspan="2">
						<textarea rows="5" cols="50" id="artDetail" name="artDetail" class="form-control" ></textarea>
						<span id="artDetail_msg"></span>
					</td>
				</tr>
				<tr>
					<td class="first">옵션</td>
					<td colspan="2">
						<div id="optionArea">
							<span class="key"> </span><input type="text" id="optionName" name="optionName" placeholder="옵션 명" class="form-control" style="display: inline; width: 300px;" ><br>
							<span id="optionName_msg"></span><br>
							<span class="key"> </span><input type="text" id="optionValue" name="optionValue" placeholder="옵션 값" class="form-control" style="display: inline; width: 300px;"><br>
							<span id="optionValue_msg"></span><br>
							<span class="key"> </span><input type="text" id="optionPrice" name="optionPrice" placeholder="옵션 추가가격" class="form-control" style="display: inline; width: 300px;" >&ensp;원<br>
							<span id="optionPrice_msg"></span><br>
							<span class="key"> </span><input type="text" id="optionStock" name="optionStock" placeholder="옵션 수량" class="form-control" style="display: inline; width: 300px;">&ensp;개<br>
							<span id="optionStock_msg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td class="first">검색태그</td>
					<td colspan="2">
						<input type="text" id="tag" name="tag" class="form-control" />
						<span id="artTag_msg"></span>
					</td>
				</tr>
			</table>

			<br>
			작품 배송 정보 입력
			
			<table class="table table-hover" id="artShippingWrite">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td class="first" class="form-control">택배사</td>
					<td colspan="2">
						<select id="Courier" name="Courier" class="form-control">
							<option value="택배사" selected="selected">택배사</option>
							<option value="대한통운">대한통운</option>
							<option value="로젠택배">로젠택배</option>
							<option value="한진택배">한진택배</option>
						</select> 
						<span id="Courier_msg"></span>
					</td>
				</tr>
				<tr>
					<td class="first" >배송가격</td>
					<td colspan="2">
						<input type="text" id="couriPrice" name="couriPrice" class="form-control" style="width: 300px; display: inline;"/>&ensp;원
						<span id="artCouriPrice_msg"></span>
					</td>
				</tr>
			</table>
			
			<div class="inputArea" align="center">
				<button type="button" id="insert_Btn" class="btn btn-primary">저장</button>
				<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
			</div>
			<input type="hidden" name = "_csrf" value="${_csrf.token }">
		</form>
	</div>
</body>
</html>