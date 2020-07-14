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
		margin: 20px;
	}
	.writeDate {
		font-size: 0.75em;
		text-align: right;
	}
	#textAreadown {
		display: inline-block;
	}
	.image {
		display:inline-block;
		width:70px;
		height:70px;
	}
	#textAreaUp {
		height:70px;
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
${story }
	<h1>스토리</h1>
	<hr>
	<c:forEach items="${story.storyList}" var="story">
	<div id="storyList">
			<div id="textArea">
				<div id="textAreaUp">
					<span class="image">${story.image }</span>
					<div id="textAreadown">
						<span class="writer1">${story.writer }</span><br>
						<span class="writeDate1">${story.writeDateStr }</span>
					</div>
				</div>
			</div>
			<a href="/adaco/story/readStory?storyno=${story.storyno }">
			<div id="imageArea">
				<div class="image1">
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
			<c:if test="${story.prev==true}">
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
			<c:if test="${story.next==true}">
				<li><a
					href="/adaco/story/listStory?pageno=${story.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div class="modal fade" id="myModal" role="dialog" style="top:40%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" >
					<ul>
						<li id="read_by_id" data-dismiss='modal'>작가 작품보기</li>
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