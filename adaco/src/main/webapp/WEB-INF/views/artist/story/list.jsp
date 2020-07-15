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
		//if("${memoMsg}"!=="")
		//	toastr.info("새로운 메모가 있습니다");
		
		// 1. 아이디를 클릭하면 나타나는 가입일보기, 게시물보기, 메모보내기로 구성된 컨텍스트 메뉴에 대한 처리
		// 1-1. 게시물보기, 메모보내기 기능을 실행하려면 사용자 아이디를 필요로 하므로 클릭한 아이디를 컨텍스트 메뉴로 복사
		$(".writer").on("click", function() {
			// 글쓴사람 아이디를 클릭하면 모달 메뉴를 출력
			// 아이디는 td에 data-writer로 저장. 모달 메뉴를 띄우는 순간에 메뉴쪽에 복사	
			$(".modal-body li").attr("data-writer", $(this).attr("data-writer"));
		});
		
		// 1-2. 게시물 보기를 선택했을 때
		$("#read_by_id").on("click", function() {
			location.href = "/adaco/art/listByUser?writer=" + $(this).data("writer");
		});
		
		// 1-3. 모달 대화상자의 가입일 조회 클릭
		$("#find_joindate").on("click", function() {
			console.log("/adaco/user/joinDate?username=" + $(this).attr("data-writer"));
			$.ajax({
				url: "/adaco/user/joinDate?username=" + $(this).attr("data-writer"),
				method: "get",
			}).done((result)=>swal($(this).attr("data-writer") + "님의 가입일", result, "success")).fail(()=>swal("오류 발생!", $(this).attr("data-writer") + "님의 가입일", "warning"));
		});
		
		// 1-5. 모달 대화상자의 메모 보내기
		$("body").on("click", "#write_memo", function() {
			location.href = "/adaco/message/write?recipientId=" + $(this).attr("data-writer")
		});
	})
</script>
</head>
<body>
	<h1>스토리</h1>
	<hr>
	<section class="articles-v3">
	  <div class="container max-width-adaptive-lg">
	    <ul class="grid gap-lg">
		<c:forEach items="${story.storyList}" var="story">
		      <li style="margin-bottom: 10px; border: 3px solid pink;">
	            <div class="articles-v3__author">
	              <a href="#0" class="articles-v3__author-img">
	                <img src="${story.profile}" alt="Author picture" style="width: 50px; height: 50px;">
	              </a>
	        
	              <div class="text-component text-sm line-height-xs v-space-xs">
	                <p><a href="#0" class="articles-v3__author-name" rel="author">${story.writer }</a></p>
	                <p class="color-contrast-medium"><time>${story.writeDateStr }</time>, &mdash; ${story.times } </p>
	              </div>
	            </div>
	            <hr style="border: 1.5px solid pink;">
		        <div class="grid gap-md items-start" style="text-align: center;">
		          <a href="/adaco/story/readStory?storyno=${story.storyno }" class="articles-v3__img col-6@md col-7@xl">
		            <figure class="media-wrapper">
		              <img src="${story.image }" alt="Image description">
		            </figure>
		          </a>
		    
		          <div class="col-6@md col-5@xl" style="  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 90%; height: 250px;">
		            <div class="text-component">
		              <h2 class="articles-v3__headline"><a href="/adaco/story/readStory?storyno=${story.storyno }" style="color: #ff4757; font-weight: bold;">${story.title }</a></h2>
		              <br><br><br>
		              <p>${story.content }</p>
		            </div>
		    
		          </div>
		        </div>
		      </li>
		</c:forEach>
		</ul>
		</div>
			<div style="text-align: center;">
		<ul class="pagination" style="text-align: center; margin: 0 auto; width: 0px; text-align: center;">
			<c:if test="${story.prev==true}">
				<li class = "page-item"><a
					href="/adaco/story/listStory?pageno=${story.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${story.startPage}" end="${story.endPage}"
				var="i">
				<c:choose>
					<c:when test="${story.pageno eq i }">
						<li class="page-item active"><a
							class = "page-link" href="/adaco/story/listStory?pageno=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class = "page-item"><a class = "page-link" href="/adaco/story/listStory?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${story.next==true}">
				<li class = "page-item"><a
					href="/adaco/story/listStory?pageno=${story.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	</section>
	
	<sec:authorize access="hasRole('ROLE_SELLER')">
		<div class="form-group">
			<a href="/adaco/story/writeStory" class="btn btn-success">글쓰기</a>
		</div>
	</sec:authorize>
	

	
	<div class="modal fade" id="myModal" role="dialog" style="top:40%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" >
					<ul>
						<li id="read_by_id" data-dismiss='modal'>게시물 보기</li>
						<li id="find_joindate">가입일 보기</li>
						<sec:authorize access="hasRole('ROLE_USER')">
							<li id="write_memo">메보 보내기</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>