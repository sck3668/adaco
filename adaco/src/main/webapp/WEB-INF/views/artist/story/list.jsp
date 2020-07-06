<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 리스트</title>
<style>
	#storyList {
		border: 1px solid gray;
		width:250px;
		height:300px;
		display: inline-block;
	}
	
</style>
</head>
<body>
	<h1>스토리</h1>
	<hr>
	<c:forEach items="${story.storyList}" var="story">
	<div id="storyList">
		<a href="/adaco/story/readStory?storyno=${story.storyno }">
			<div id="textArea">
				<div class="title">${story.writer }</div>
				<div class="writeDate">${story.writeDateStr }</div>
			</div>
			<div id="imageArea">
				<div class="image">
					<img alt="art" src="${story.image }">
				</div>
			</div>
		</a>
	</div>
</c:forEach>

	<%-- <div>
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
			<c:forEach items="" var="board">
				<tr>
					<td></td>
					<td><a href="/adaco/story/read?bno="></a></td>
					<td class='writer' data-writer=""></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="">
				<li><a href="/adaco/story/list?pageno=">이전</a></li>
			</c:if>
			<c:forEach begin="" end="" var="i">
				<c:choose>
					<c:when test="">
						<li class="active">
							<a href="/adaco/story/list?pageno="></a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/story/list?pageno="></a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="">
				<li><a href="/adaco/story/list?pageno=">다음</a></li>
			</c:if>
		</ul>
	</div> --%>
	<sec:authorize access="hasRole('ROLE_SELLER')">
	<div class="form-group">
		<a href="/adaco/story/writeStory">글쓰기</a>
	</div>
	</sec:authorize>
</body>
</html>