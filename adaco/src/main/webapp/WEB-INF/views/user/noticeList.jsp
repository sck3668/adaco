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
.articles-v3 {}

.articles-v3__img {
  display: block;
  transition: opacity .3s;
  border-radius: var(--radius-md);
  overflow: hidden;

  img {
    display: block;
    width: 100%;
  }

  &:hover {
    opacity: 0.85;
  }
}

.articles-v3__headline {
  font-size: var(--text-xl);

  a {
    color: var(--color-contrast-higher);
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }
}

.articles-v3__author {
  display: grid;
  grid-template-columns: 3em 1fr;
  grid-gap: var(--space-xs);
  align-items: center;
  margin-top: var(--space-md);
}

.articles-v3__author-img {
  display: block;
  width: 3em;
  height: 3em;
  border-radius: 50%;
  overflow: hidden;
  transition: transform .3s var(--ease-out-back);
  
  img {
    display: block;
    width: inherit;
    height: inherit;
  }

  &:hover {
    transform: scale(1.1);
  }
}

.articles-v3__author-name {
  font-weight: bold;
  color: var(--color-contrast-higher);
  text-decoration: none;

  &:hover {
    text-decoration: underline;
  }
}
	
	
	#storyList {
		border: 1px solid gray;
		width:250px;
		height:300px;
		display: inline-block;
	}
	
</style>
<script>
	$(function() {
	})
</script>
</head>
<body>
	<h1>공지사항</h1>
	<hr>
	<section class="articles-v3">
	  <div class="container max-width-adaptive-lg">
	    <ul class="grid gap-lg">
	    <table class="table table-bordered" id="question_list" width="100%" cellspacing="0">
                <colgroup>
					<col width="5%">
					<col width="5%">
					<col width="40%">
					<col width="20%">
					<col width="10%">
				</colgroup>
			<thead>
			<tr style="text-align: center;">
				<th>비고</th>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items="${noticePage.adminNoticeList}" var="notice">
			<tr style="text-align: center;">
				<td>
					<c:choose>
						<c:when test="${notice.important==true }">공지 
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</td>
				<td>${notice.noticeno }</td>
				<td><a href="/adaco/admin/notice_read?noticeno=${notice.noticeno}">${notice.title }</a></td>
				<td>${notice.writeDateStr }</td>
				<td>${notice.writer}</td>
			</tr>
		</c:forEach>
		</tbody>
       </table>
       <ul class="pagination" style="text-align: center; margin: 0 auto; width: 0px; text-align: center;">
			<c:if test="${noticePage.prev==true}">
				<li class="page-item" style="width: 60px;"><a style="width: 60px;" class = "/adaco/user/noticeList?pageno=${noticePage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${noticePage.startPage}" end="${noticePage.endPage}" var="i">
				<c:choose>
					<c:when test="${noticePage.pageno eq i }">
						<li class="page-item active">
							<a class = "page-link" href="/adaco/user/noticeList?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class = "page-item"><a class = "page-link" href="/adaco/user/noticeList?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${noticePage.next==true}">
				<li class = "page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/user/noticeList?pageno=${noticePage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
		</ul>
		</div>
		<div style="text-align: center;">
		</div>
	</section>
	
</body>
</html>