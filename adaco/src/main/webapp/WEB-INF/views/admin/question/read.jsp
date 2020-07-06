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
		border-radius: 5px;
	}
	
	.center {
		text-align: center;
	}
	
	body {
  		padding-top: 56px;
	}
	
	::-webkit-scrollbar{width: 16px;}
		::-webkit-scrollbar-track {background-color:#4C4C4C;}
		::-webkit-scrollbar-thumb {background-color:#6799FF;border-radius: 10px;}
		::-webkit-scrollbar-thumb:hover {background: #555;}
		::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
		width:16px;height:16px;background:#4C4C4C;} 
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>1:1 문의 </title>
<script type="text/javascript">
var question = ${question};

function printAnswer(answer) {
	var $answer = $("#answer_content");
	$answer.empty();
	$answer.text(question.answerContent);
	
/* 	var $answer = $("#answer_div");
	$answer.empty();
	
	var $comment = $("<div>").appendTo($answer);
	var $upper_div = $("<div>").appendTo($answer);
	var $center_div = $("<div>").appendTo($answer);
	var $lower_div = $("<div>").appendTo($answer);
	$("<span>").html(question.answerContent).appendTo($center_div);
	var time = question.answerDateStr;
	$("<span>").text(time).appendTo($lower_div); */
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
	<div class="container jumbotron my-4">
	<h4>QnA 상세</h4>
		
		<form action="/nor/QnAUpdate" method="post" >
			<div class="form-group">
            	<label type="text" class="form-control" id="title" readonly="readonly"></label> 
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
	            <textarea class="form-control" cols="50" rows="10" id="content" name="qnaQuestion" readonly="readonly"></textarea>
	         </div>
	         <div class="form-group">
	         	Answer:
	            <textarea class="form-control" cols="50" rows="10" id="answer_content" name="answer_content"></textarea>
	         </div>
			<div>
				<div class = "form-group">
					<label for = "answer_textarea">답변을 입력하세요.</label>
					<textarea class = "form-control" rows="5" id ="answer_textarea" placeholder = "서비스 규정을 참고하여 작성해주시기 바랍니다."></textarea>
				</div>
			</div>
			<button type="button" id="answer" class="btn btn-info">등록</button>
		</form>
	</div>
	
</body>
</html>