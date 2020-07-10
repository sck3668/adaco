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
	$(function(){
		var story = "${story}";
		function printComment(comments) {
			var $comments = $("#comments");
			$comments.empty();
			$.each(comments, function(i, comment) {
				var $comment = $("<div>").appendTo($comments);
				var $upper_div = $("<div>").appendTo($comment);
				var $center_div = $("<div>").appendTo($comment);
				var $lower_div = $("<div>").appendTo($comment);
				console.log(comment);
				$("<span></span>").text(comment.writer).appendTo($upper_div);
// 				$("<img>").attr("src", comment.content).css("width","40px").appendTo($center_div);
				$("<span>").text(comment.writeDateStr).appendTo($lower_div);
				$("<div>").html(comment.content).appendTo($center_div);  
				
				if(comment.writer===loginId) {
					var btn = $("<button>").attr("class","delete_comment").attr("data-cno",comment.cno).attr("data-writer", comment.writer)
						.text("삭제").appendTo($center_div).css("float","right");
				}
				$("<hr>").appendTo($comment);
			});
		}
		
	//댓글 목록 출력	
		var bno = location.search.substr(5);
		var params = {
				_csrf:"${_csrf.token}",
				storyno:$("#storyno").val()
		}
		$.ajax({
			url:"/adaco/story/readStory",
			data: params,
			method:"post"
		}).done((result)=>{
			story = result;
			printComment(story);
		});
		
		
		//댓글 입력
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
		$("#comment_write").on("click", function() {
			var params = {
				storyno : $("#storyno").val(),
				content : $("#comment_textarea").val(),
				_csrf: "${_csrf.token}"
			}
			$.ajax({
				url: "/adaco/comment/write",
				method: "post",
				data: params
			})
			.done((result)=>{ 
				story = result;
				printComment(story); 
				},$("#comment_textarea").val(""))
			.fail((result)=>{console.log(result)});
		})
		
		
		//댓글 삭제
		$("#comments").on("click", ".delete_comment", function() {
		// data-ano 속성의 값을 꺼낼 때 
		// data("ano") -> 넣은 값의 타입 그대로
		// attr("data-ano") -> 문자열
		var params = {
			cno: $(this).data("cno"),
			storyno: $("#storyno").val(),
			writer: $(this).data("writer"),
			_method: "delete",
			_csrf: "${_csrf.token}"
		}
		console.log(params)
		$.ajax({
			url: "/adaco/story/commentDelete",
			method: "post",
			data: params
		})
		.done((result)=>{ printComment(result); })
		.fail((result)=>{console.log(result)});
	});
		

		
		/* $("#comment_write").on("click",function(){
			$comments=$("#textarea").val();
			console.log($comments);
			alert("DDDD");
			if(isLogin==false)
				return
			var params = {
					_csrf:"${_csrf.token}",
					storyno:$("#storyno").val(),
					content:$("#textarea").val()
			}
			console.log(params)
				$.ajax({
					url:"/adaco/story/commentWrite",
					data:params,
					method:"post"
					
				}).done((r)=>{console.log(r)})
				  .fail((r)=>{console.log(r)})
		}) */
		
	});
</script>
</head>
<body>	
${story}
${story.comments[0].writer}

<%-- ${story.comments[].cno} --%>
 <%-- <c:forEach items="${story.comments }" var="comments1" >
 	<input type="text" value="${comments1}">
 </c:forEach>  --%>
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
					<p class = "form-control" id = "content" name = "content" cols="50" rows="10" readonly="readonly" style="background-color: white;" >${story.content }
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
				<textarea class="form-control" rows="5"	id="comment_textarea" placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다" disabled="disabled" ></textarea>
				<input type="hidden" value="${story.storyno }" id="storyno">
				<%-- <c:forEach begin="1" end="10" var="i">
					<input type="text" value="${story.comments[i].cno}" id="textarea">
				</c:forEach> --%>
			</div>
			<button type="button" class="btn btn-info" 
				id="comment_write" disabled="disabled">댓글 작성</button>
		</div>
		<hr>
		<div id="comments">
	<%-- 	<div>
			<c:forEach items="${story.comments}" var ="comments">
			
			<div id="upper_div">
				${comments.content }
			</div>
			<div id="center_div">
				${comments.content }
			</div>
			<div id="lower_div">
				${comments.content }
			</div>
			</c:forEach>
		</div> --%>
		</div>
	</div>
</body>
</html>