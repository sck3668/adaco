<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>	
	<form role="form" method="post" autocomplete="off">

		<input type="hidden" name="artNum" value="${art.artNum}" />
		작품 기본정보 입력
		<div class="inputArea">
			<label>카테고리</label> <select class="category">
				<option value="">전체</option>
				<option value="">가방,파우치</option>
				<option value="">공예품</option>
				<option value="">악세서리</option>
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
<!-- 	옵션 토글 참고	<tr><td class="first">비밀번호</td>
			<td colspan="2">
				<button type="button" class="btn btn-info" id="activateChangePwd">비밀번호 수정</button>
				<div id="passwordArea">
					<span class="key">현재 비밀번호 : </span><input type="password" id="password" ><br>
					<span class="key">새 비밀번호 : </span><input type="password" id="newPassword"><br>
					<span class="key">새 비밀번호 확인 : </span><input type="password" id="newPassword2">
	  				<button type="button" class="btn btn-info" id="changePwd">변경</button>
				</div>
			</td></tr> -->
		<div class="inputArea">
			<label for="artTag">검색태그</label> 
			<input type="text" id="artTag" name="artTag" value="${art.tag}" />
		</div>
		<br>
		작품 배송 정보 입력
		<div class="inputArea">
			<label for="artCourier">택배사</label> 
			<input type="text" id="artCourier" name="artCourier" value="${art.courier}" />
		</div>
		<div class="inputArea">
			<label for="artCouriPrice">배송가격</label> 
			<input type="text" id="artCouriPrice" name="artCouriPrice" value="${art.couriPrice}" />
		</div>
		<div class="inputArea">
			<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
			<button type="submit" id="back_Btn" class="btn btn-warning">취소</button>
		</div>
	</form>
</body>
</html>