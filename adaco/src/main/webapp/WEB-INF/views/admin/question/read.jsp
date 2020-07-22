<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

 <style>
 	#lower_right li {
		display: inline-block;
		padding : 0 5px;
		font-size: 0.9em;
	}
	#lower_right {
		float: right;
	}
	#lower_left {
		padding: 0 0 0 0px;
	}
	#lower_left li{
		display: inline-block;
		padding : 0 10px;
	}
	#lower_left li:nth-of-type(2n){  /* #lower_left 하위의 li 중 짝수번째인 것에 적용 */
		border-left: 1px solid gray;
		border-right: 1px solid gray;
	}
	.box {
		height: 50px;
		width: 50px;
		text-align: center;
		border: 1px solid black;
		border-radius: 30px;
	}
	
	.center {
		text-align: center;
	}
	
	
</style>
<meta charset="UTF-8">
<title>1:1 문의 </title>
<script type="text/javascript">
var question = ${question};

function printAnswer(answer) {
	var $answer = $("#answer_content");
	$answer.empty();
	$answer.text(question.answerContent);
}

function checkState() {
	var state = question.state
	var $state = $("#lower_right")
	if(state == "답변완료") {
		$("<li>").appendTo($state);
		var btn = $("<button>").attr("class", "btn btn-primary").attr("id", "read_btn").prop("disabled", "disabled").appendTo($state);
		$("<span>").attr("class", "badge").attr("id", "state").appendTo(btn)
	}
	if(state == "답변대기") {
		$("<li>").appendTo($state);
		var btn = $("<button>").attr("class", "btn btn-danger").attr("id", "read_btn").prop("disabled", "disabled").appendTo($state);
		$("<span>").attr("class", "badge").attr("id", "state").appendTo(btn)		
	}	
}
	$(function(){
		checkState();
		printAnswer();
		$("#title").text(question.title);
		$("#writer").text(question.writer);
		$("#content").html(question.content);
		$("#qno").text(question.qno);
		$("#write_time").text(question.writeDateStr);
		$("#state").text(question.state);
		
		$("#answer").on("click", function(){
			
			var params = {
				qno : question.qno,
				answer : "관리자",
				answerContent : $("#answer_textarea").val(),
				_csrf : "${_csrf.token}"					
			}
			
			$.ajax({
				url: "/adaco/admin/question_answer",
				method: "post",
				data: params
			}).done(()=>location.reload(true)).fail((f)=>console.log(f));
		});
	});
</script>
</head>
<body>
<!-- Page Content -->
	<div class="container jumbotron my-4" style="background-color: #dcdde1;">
	<h4>QnA 상세</h4>
		
		<form action="/nor/QnAUpdate" method="post" >
			<div class="form-group">
            	<label type="text" class="form-control" id="title" readonly="readonly" style="background-color: white;"></label> 
         	</div>
         	<ul id = "lower_left">
					<li>[문의번호] <span id = "qno"></span></li>
					<li>[작성자] <span id = "writer"></span></li>
					<li>[등록일] <span id = "write_time"></span></li>
			</ul>
         	<ul id = "lower_right">
			</ul>
			<div class="form-group">
	         	Question: 
	            <textarea class="form-control" cols="50" rows="10" id="content" name="qnaQuestion"readonly="readonly" style="background-color: white;"></textarea>
	         </div>
	         <div class="form-group">
	         	Answer:
	            <textarea class="form-control" cols="50" rows="10" id="answer_content" name="answer_content" readonly="readonly" style="background-color: white;"></textarea>
	         </div>
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
				<div>
					<div class = "form-group">
						<label for = "answer_textarea">답변을 입력하세요.</label>
						<textarea class = "form-control" rows="5" id ="answer_textarea" placeholder = "서비스 규정을 참고하여 작성해주시기 바랍니다."></textarea>
					</div>
				</div>
				<button type="button" id="answer" class="btn btn-info">등록</button>
				<a href = "/adaco/admin/question_list" class="btn btn-success">뒤로가기</a>
	        </sec:authorize>
	        <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_SELLER')">
		        <a href = "javascript:history.back()" class = "btn btn-success">뒤로가기</a>
	        </sec:authorize>
		</form>
	</div>
	
</body>
</html>