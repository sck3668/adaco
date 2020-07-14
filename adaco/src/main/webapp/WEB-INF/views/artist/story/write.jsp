<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 글 쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/adaco/ckeditor/ckeditor.js"></script>
<script>
function loadImage() {
	// <input type='file' name='sajin' multiple='multiple'>
	var file = $("#sajin")[0].files[0];	
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin").val("");
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_profile").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}

$(function(){
	$("#sajin").on("change", loadImage);
	var ck = CKEDITOR.replace("content", {
		height: 600,
		filebrowserUploadUrl:'http://localhost:8081/adaco/story/ckupload?${_csrf.parameterName}=${_csrf.token}'
	})
	var idx = 0;
	$("#add").on("click", function(){
		var $input = $("<input>").attr("type", "file").attr("class", "form-control-file").attr("name", "attachments[" + idx + "]");
		idx++;
		$input.appendTo($("#attachment_div"));
		
	});
	/* form 을 넘기기 전 값 확인 */
	$("#write").on("click", function(){
		
		console.log($("#writeForm").serialize());
		$("#writeForm").submit();
	});
})
</script>
</head>
<body>
	<form action="/adaco/story/writeStory" method="post" id="writeForm"	enctype="multipart/form-data">
		<div class="form-group">
				<label for="sajin">대표 이미지 등록</label>
				<input id="sajin" type="file" name="sajin" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
			</div>
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title">
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content"></textarea>
		</div>
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		<button type="button" class="btn btn-success" id="write">작성</button>
		<button type = "button" id = "add">첨부파일 추가</button>
		<div id="attachment_div"></div>
	</form>
</body>
</html>