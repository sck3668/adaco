<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 리스트</title>
</head>
<body>
		<div>
		<table class="table table-hover">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>이름</th>
					<th>프로필</th>
					<th>이미지</th>
					<th>작성일</th>
					<th>스토리번호</th>
				</tr>
			</thead>
			<tbody id="list">
			<c:forEach items="${page.list}" var="board">
				<tr>
					<td>${board.bno}</td>
					<td><a href="/adaco/story/read?bno=${story.storyno}">${sotry.image }</a></td>
					<td class='writer'   data-writer="${board.writer }">${board.writer }</td>
					<td>${board.writeTimeStr}</td>
					<td>${board.readCnt }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${page.prev==true}">
				<li><a href="/adaco/story/list?pageno=${page.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
				<c:choose>
					<c:when test="${page.pageno eq i }">
						<li class="active">
							<a href="/adaco/story/list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/story/list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${page.next==true}">
				<li><a href="/adaco/story/list?pageno=${page.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div class="form-group">
		<button type="button" id="writer" class="btn btn-info">글쓰기</button>
	</div>
</body>
</html>