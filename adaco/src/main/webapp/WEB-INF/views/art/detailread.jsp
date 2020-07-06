<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가전용 작품 상세 페이지</title>
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
				<td class="first">옵션여부</td>
				<td colspan="2">
				<input type="radio" name="optionox" value="yes" checked="checked" /> 예
				<input type="radio" name="optionox" value="no"  /> 아니오
				</td>
			</tr>
			<tr>
			<td class="first">옵션</td>
				<td colspan="2">
					<div id="optionArea">
						<span class="key">옵션명 </span><input type="text" id="optionname" value="${artDetailPage.optionName}"><br>
						<span class="key">옵션값 </span><input type="text" id="optionvalue" value="${artDetailPage.optionValue}"><br>
						<span class="key">옵션 추가가격 </span><input type="text" id="optionprice" value="${artDetailPage.optionPrice}"><br>
						<span class="key">옵션재고 </span><input type="text" id="optionstock" value="${artDetailPage.optionStock}">
		  				<button type="button" class="btn btn-primary" id="summitOption">저장</button>
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
				<select class="Courier">
					<option selected="selected">택배사 선택</option>
					<option>대한통운</option>
					<option>로젠택배</option>
					<option>한진택배</option>
				</select> 
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