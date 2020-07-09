<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script>
	// '작품 등록'클릭 시 작품 등록 화면으로 이동
	$(function() {
		$("#write_Btn").on("click", function() {
			location.href="/adaco/art/write";
		});
	});
</script>
</head>
<body>
	${artPage.artList }
	<div class="form-group">
		<button type="submit" id="delete_Btn" class="btn btn-primary">삭제</button>
		<button type="submit" id="write_Btn" class="btn btn-warning">작품 등록</button>
	</div>
	<div>
		<table class="table table-hover">
			<colgroup>
				<col width="15%">
				<col width="25%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>작품 번호</th>
					<th>카테고리</th>
					<th>작품이미지</th>
					<th>작품명</th>
					<th>가격</th>
					<th><input type="checkbox" name="chBox" ></th>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach items="${artPage.artList}" var="art">
					<tr>
						<td><a href="/adaco/art/readByArtist?artno=${art.artno}">${art.artno}</a></td>
						<td>${art.category}</td>
						<td><img src="${art.mainImg }" width="120px" height="110px"></td>
						<td>${art.artName}</td>
						<td>${art.price}</td>
						<td><input type="checkbox" name="chBox" ></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align: center;">
		<ul class="pagination">
			<c:if test="${artPage.prev==true}">
				<li><a href="/adaco/art/listByArtist?pageno=${artPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${artPage.startPage}" end="${artPage.endPage}" var="i">
				<c:choose>
					<c:when test="${artPage.pageno eq i }">
						<li class="active"><a href="/adaco/art/listByArtist?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/art/listByArtist?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:if test="${artPage.next==true}">
				<li><a href="/adaco/art/listByArtist?pageno=${artPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>



</body>
</html>