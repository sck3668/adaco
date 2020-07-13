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
${story }
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
	<sec:authorize access="hasRole('ROLE_SELLER')">
	<div class="form-group">
		<a href="/adaco/story/writeStory">글쓰기</a>
	</div>
	</sec:authorize>
	
	<div style="text-align: center;">
		<ul class="pagination">
			<c:if test="${story.isPrev==true}">
				<li><a
					href="/adaco/story/listStory?pageno=${story.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${story.startPage}" end="${story.endPage}"
				var="i">
				<c:choose>
					<c:when test="${story.pageno eq i }">
						<li class="active"><a
							href="/adaco/story/listStory?pageno=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/story/listStory?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${story.isNext==true}">
				<li><a
					href="/adaco/story/listStory?pageno=${story.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	
</body>
</html>