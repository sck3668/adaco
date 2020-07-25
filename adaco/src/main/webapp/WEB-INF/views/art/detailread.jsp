<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가전용 작품 상세 페이지</title>
<!--<sec:authorize access="hasRole('ROLE_SELLER')">
	
</sec:authorize>-->
<style type="text/css">



.visual_img li {
	position: relative;
	display: inline;
}

.visual_img img {
	width: 500px;
	height: 400px;	
}


.filebox {display:inline-block; margin-right: 10px;}


.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}

.filebox.bs3-success label {
  color: #fff;
  background-color: #5cb85c;
    border-color: #4cae4c;
}
</style>
<script>
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
//			  document.getElementById("add").disabled = false;
	});
 });
	
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
		$("#courier").val(choice);
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
		if($courier=="택배사 선택"){
			alert("택배사를 선택해주세요");
			return;
		}
	
		
		var formData = new FormData();

		formData.append("artno", ${artDetailPage.artno});
		formData.append("optno", ${artDetailPage.optno});
		formData.append("artName", $artName);
		formData.append("price", $price);
		formData.append("stock", $stock);
		formData.append("tag", $tag);
		formData.append("couriPrice", $couriPrice);
		formData.append("courier", $courier);
		formData.append("artDetail", $artDetail);
		formData.append("optionName", $optionName);
		formData.append("optionValue", $optionValue);
		formData.append("optionPrice", $optionPrice);
		formData.append("optionStock", $optionStock);

		if($("#artSajin")[0].files[0]!=undefined)
			formData.append("artSajin", $("#artSajin")[0].files[0]);
			formData.append("_csrf", "${_csrf.token}");
			formData.append("_method", "put");

			for (var key of formData.keys()) {
			console.log(key);
			}
			for (var value of formData.values()) {
			console.log(value);
			}

		
		//console.log(formData);
			$.ajax({
				url: "/adaco/art/update",
				data: formData,
				method: "post",
				processData:false,
				contentType:false
				}).done(()=>{alert("작품이 수정되었습니다.");
				location.href="/adaco/art/listByArtist";
				})
				.fail(()=>{Swal.fire(
						  '작품 수정 실패하였습니다.',
						  '',
						  'error'
						)})
				})
});
	
	function loadImage() {
	
	var file = $("#artSajin")[0].files[0];
	var maxSize = 1024*1024; // 1MB
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
	
	$("#artSajin").on("change", loadImage);
	}
	
	// '취소'클릭 시 상품목록으로 이동 
	$(function() {
		$("#back_Btn").on("click", function() {
			location.href="/adaco/art/listByArtist";
		});
	
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
	}
	
	
	});


</script>
</head>
<body>	
	<h2>상세 정보 조회 및 수정</h2><br>
	<form role="form" method="post" autocomplete="off">
		<input type="hidden" name="artNum" value="${art.artNum}" />
		<h5>작품 기본정보</h5><br>
		<table class="table table-hover" id="art">
			<tr>
				<td class="first" id="fi">작품번호</td>
				<td colspan="2">
				<span id="artno">${artDetailPage.artno}</span></td>
			</tr>
			<tr>
				<td class="first">카테고리</td>
				<td colspan="2">
				<span id="category">${artDetailPage.category}</span></td>
			</tr>
			<tr>
				<td class="first">작품 등록일</td>
				<td colspan="2">
				<span id="artDate">${artDetailPage.artDate}</span></td>
			</tr>
			<tr>
				<td class="first">작품명</td>
				<td colspan="2">
				<input class="form-control" style="width: 350px;" type="text" id="artName" name="artName" value="${artDetailPage.artName}" />
				</td>
			</tr>
			<tr>
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
				  <div id = "artSajinArea"></div>
				 	 <button type = "button" id = "add" name="add" class="btn btn-primary">작품 이미지 추가</button>
					  <button type = "button" id = "deleteUpload" class="btn btn-danger" >업로드 취소</button>
<!-- 					  <input type="file" name="artSajin" id="artSajin" class="btn btn-success"/> -->
<div class="filebox bs3-success">
                          <label for="artSajin"style="margin-top: 9px;">프로필 업로드</label> 
                          <input type="file" name="artSajin" id="artSajin"" />
<!--                           <input type="file" id="ex_file2">  -->
                        </div>
					  <span class="nxt_fix" style="display:none;"></span>
				</div>
			</tr>
			<tr>
				<td class="first">작품가격</td>
				<td colspan="2">
				<input type="text" id="artPrice" name="artPrice" value="${artDetailPage.price}" class="form-control" style="width: 350px; display: inline;" /> 원
				</td>
			</tr>
			<tr>
				<td class="first">작품수량</td>
				<td colspan="2">
				<input type="text" id="artStock" name="artStock" value="${artDetailPage.stock}" class="form-control" style="width: 350px;" />
				</td>
			</tr>
			<tr>
				<td class="first">작품소개</td>
				<td colspan="2">
				<textarea rows="5" cols="50" id="artDetail" name="artDetail" class="form-control" style="width: 350px;" >${artDetailPage.artDetail}</textarea>
				</td>
			</tr>
			<tr>
			<td class="first">옵션</td>
				<td colspan="2">
					<div id="optionArea">
						<span class="key">옵션 명 </span><input placeholder="옵션명"   class="form-control" style="width: 350px; " type="text" id="optionName" value="${artDetailPage.optionName}"><br>
						<span class="key">옵션 값 </span><input placeholder="옵션값" class="form-control" style="width: 350px; " type="text" id="optionValue" value="${artDetailPage.optionValue}"><br>
						<span class="key">추가 가격</span><input placeholder="옵션 추가가격" class="form-control" style="width: 350px; " type="text" id="optionPrice" value="${artDetailPage.optionPrice}"><br>
						<span class="key">재고</span><input placeholder="옵션재고" class="form-control" style="width: 350px;  " type="text" id="optionStock" value="${artDetailPage.optionStock}"><br>
		  				<button type="button" class="btn btn-success" id="updateOption" style="margin-left: 750px;">저 장 하 기</button>
					</div>
				</td>
			</tr> 
			<tr>
				<td class="first" style="width: 80px;">태그</td>
				<td colspan="2">
				<input class="form-control" style="width: 350px;" type="text" id="artTag" name="artTag" value="${artDetailPage.tag}" />
				</td>
			</tr>
		</table>
		<br>
		<h5>작품 배송정보 </h5><br>
		<table class="table table-hover" id="artShipping">
			<tr>
				<td class="first">택배사</td>
				<td colspan="2">
				<select id="Courier" class="form-control" style="width: 350px;">
					<option selected="selected">택배사 선택</option>
					<option>대한통운</option>
					<option>로젠택배</option>
					<option>한진택배</option>
				</select> 
				<input class="form-control" style="width: 350px;" type="hidden" id="courier" name="courier" value="${artDetailPage.courier}" />
				</td>
			</tr>
			<tr>
				<td class="first">배송가격</td>
				<td colspan="2">
				<input class="form-control" style="width: 350px;" type="text" id="artCouriPrice" name="artCouriPrice" value="${artDetailPage.couriPrice}" />
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