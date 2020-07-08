<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/adaco/main/css">
<script src="/adaco/ckeditor/ckeditor.js"></script>
<sec:authorize access="isAuthenticated()">
	<script>
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		var isLogin = false;
		var loginId = undefined;
	</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_SELLER')">
	<script>
	$(function(){
		var ck = CKEDITOR.replace("content", {
			filebrowserUploadUrl:'http://localhost:8081/adaco/story/ckupload'
		})
	})
	</script>
</sec:authorize>
<script>
function printComment(comments){
	var $comments = $("#comments");
	$comments.empty();
	$.each(comments, function(i/* index */, comment /* key */) {
	// 객체를 전달받으면 index는 객체의 key(property)를 가리키고 
	// item은 키의 값을 가져옵니다.
		var $comment = $("<div>").appendTo($comments);
		var $upper_div = $("<div>").appendTo($comment);
		var $center_div = $("<div>").appendTo($comment);
		var $lower_div = $("<div>").appendTo($comment);
		$("<span></span>").text(comment.writer).appendTo($upper_div);
		console.log(comment.writer)
		$("<span>").text(comment.content).appendTo($center_div);
		
		$("<hr>").appendTo($comment);
	});
}
	$(function(){
		/* printComment(comments); */
		var story = "${story}";
		
		if(isLogin==true && story.writer==loginId){
			$("#content").prop("disabled",false)
			$("#comment_textarea").prop("disabled",false)
			$("#comment_write").prop("disabled",false)
			$("#title").prop("readonly",false)
		}
		else if(isLogin==true && story.writer!==loginId){
			$("#content").prop("disabled",true)
			$("#comment_textarea").prop("disabled",false)
			$("#comment_write").prop("disabled",false)
			$("#title").prop("readonly",true)
		}
		$("#comment_write").on("click",function(){
			$comments=$("#textarea").val();
			if(isLogin==false)
				return
			var params = {
					_method:"put",
					_csrf:"${_csrf.	token}",
					storyno:$("#storyno").val(),
					content:$comments
			}
			console.log(params)
				$.ajax({
					url:"/adaco/story/commentWrite",
					data:params,
					method:"post"
					
				}).done((comments)=>{printComment(comments)})
				  .fail((r)=>{console.log(r)})
		})
		
	});
</script>
</head>
<body>	
<%-- ${story.comments[].cno} --%>
 <c:forEach items="${story.comments }" var="comments1" >
 	<input type="text">${comments1.content } 
 </c:forEach> 
 <div id="wrap">
	<div>
		<div class = "form-group">
				제목<input type = "text" class = "form-control" id = "title" name = "title" readonly="readonly" style="background-color: white;" value="${story.title }" >
			</div>
			<div class = "form-group">
				<ul id = "attachment">
				</ul>
			</div>
			<div class = "form-group" id ="content_div">
				<div class = "form-group">
					<p class = "form-control" id = "content" name = "content" cols="50" rows="10" readonly="readonly" style="background-color: white;" value="${story.content }">${story.content }
				</div>
			</div>
			
		
	<!-- 	<div id="title_div">
			<div id="upper">
			</div>
			<div id="lower">
			</div>
			<div>
				<ul id="attachment">
				</ul>
			</div>
		</div>
		<div id="content_div">
			<div class="form-group">
				<div class="form-control" id="content"></div>
			</div>		 -->
		<sec:authorize access="hasRole('ROLE_SELLER')">
			<div id="btn_area">
				<button id="update" class="btn btn-info">변경</button>
				<button id="delete" class="btn btn-success">삭제</button>
			</div>
		</sec:authorize>
		</div>
		<div>
			<a href="/adaco/story/listStory" id="list">목록으로</a>
		</div>
		<div>
			<div class="form-group">
				<label for="comment_textarea">댓글을 입력하세요</label>
				<textarea class="form-control" rows="5"	id="comment_textarea" placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다" disabled="disabled"></textarea>
				<input type="hidden" value="${comments1.content}" id="textarea">
				<input type="hidden" value="${story.storyno }" id="storyno">
			</div>
			<button type="button" class="btn btn-info" 
				id="comment_write" disabled="disabled">댓글 작성</button>
		</div>
		<hr>
		<div id="comments">
		</div>
	</div>
</body>
</html>