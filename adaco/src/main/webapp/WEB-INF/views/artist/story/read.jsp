<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#content_div {
		overflow: auto;
	}
	
	* {
		margin : 0;
		padding: 0;
	}
	#section {
		padding: 20px;
	}
	#wrap {
		width: 760px;
		margin: 0 auto;
	}
	#content {
		min-height: 600px;
		border: none;
	}
	#wrap {
		margin-top : 10px;
	}
	#wrap>div:first-of-type {	
	/* #wrap의 자식 중 첫번째 div. 즉 #title_div, #content_div를 둘러싸고 있는 id없는 div */
		border : 1px solid #ccc;
	}
	#content_div {
		background-color: #f8f8f8;
		border-top: 1px solid #ccc;
	}
	
	#comments {
		height: 500px;
		overflow: auto;
	}
	

</style>
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
<script>
var story = ${story};
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
			$("<img>").attr("src", comment.profile).css("width", "60px").css("height", "60px").appendTo($center_div);
			$("<div>").html(comment.content).appendTo($center_div);
			$("<span>").text(comment.writeDateStr).appendTo($lower_div);
			//var time = comment.writeDate.year + "" + comment.writeDate.month +"" + comment.writeDate.dayOfMonth;
			//$("<span>").text(time).appendTo($lower_div);
			if(comment.writer===loginId) {
				var btn = $("<button>").attr("class","delete_comment").attr("data-cno",comment.cno).attr("data-writer", comment.writer)
					.text("삭제").appendTo($center_div).css("float","right");
			}
			$("<hr>").appendTo($comment);
		});
	}	
	$(function(){
		$("#title").val(story.title);
		$("#content").html(story.content);
		$("<input>").attr("type", "hidden").attr("value", story.storyno).attr("id", "storyno").appendTo(".form-group");
		$("#btn_area").hide();
		printComment(story.comments);
		
		
		if(isLogin==true && story.writer==loginId){
			var ck = CKEDITOR.replace("content", {
				height: 600,
				filebrowserUploadUrl:'http://localhost:8081/adaco/story/ckupload?${_csrf.parameterName}=${_csrf.token}'
			})
			$("#content").prop("disabled",false)
			$("#comment_textarea").prop("disabled",false)
			$("#comment_write").prop("disabled",false)
			$("#title").prop("readonly",false)
			$("#btn_area").show();
		}
		else if(isLogin==true && story.writer!==loginId){
			$("#content").prop("disabled",true)
			$("#comment_textarea").prop("disabled",false)
			$("#comment_write").prop("disabled",false)
			$("#title").prop("readonly",true)
		}
		
		//댓글 입력
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
			.done((result)=>{printComment(result);})
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
		
		
		$("#delete").on("click", function(){
			var params = {
				storyno: story.storyno,
				_method: "delete",
				_csrf: "${_csrf.token}"
			}
			$.ajax({
				url: "/adaco/story/delete",
				method: "post",
				data: params
			}).done((r)=>location.href = r).fail((f)=>console.log(f));
			
		})
		
		$("#update").on("click", function(){
			var params = {
				storyno: story.storyno,
				title: $("#title").val(),
				content: CKEDITOR.instances['content'].getData(),
				_csrf: "${_csrf.token}",
				_method: "patch"
			}
			
			$.ajax({
				url: "/adaco/story/update",
				method: "post",
				data: params
			}).done(()=>location.reload(true)).fail((r)=>console.log(r));
		});
				
	});
</script>
</head>
<body>	
	<div>
		<div class = "form-group">
				제목<input type = "text" class = "form-control" id = "title" name = "title" readonly="readonly" style="background-color: white;" >
			</div>
			<div class = "form-group">
				<ul id = "attachment">
				</ul>
			</div>
			<div class = "form-group" id ="content_div">
				<div class = "form-group">
					<div class = "form-control" id = "content"></div>
				</div>
				<div id="btn_area">
					<button id="update" class="btn btn-info">변경</button>
					<button id="delete" class="btn btn-success">삭제</button>
				</div>
			</div>
		<div>
			<a href="/adaco/story/listStory" id="list" class="btn btn-primary">목록으로</a>
		</div>
		<div style="margin-top: 50px;">
			<div class="form-group">
				<label for="comment_textarea">댓글을 입력하세요</label>
				<textarea class="form-control" rows="5"	id="comment_textarea" placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다" disabled="disabled" ></textarea>
				<input type="hidden" id="storyno">
			</div>
			<button type="button" class="btn btn-info" id="comment_write" disabled="disabled">댓글 작성</button>
		</div>
		<hr>
	</div>
	<div id="comments">
	</div>
</body>
</html>