<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>
<style>
	#content {overflow: auto; width:1200px; min-height: 800px; margin-left: 50px; border-radius: 20px; box-shadow: 5px 5px 5px gray;}
	#title {width: 1200px; margin-left: 50px; border-radius: 20px; box-shadow: 5px 5px 5px gray;}
	::-webkit-scrollbar{width: 16px;}
		::-webkit-scrollbar-track {background-color:#4C4C4C;}
		::-webkit-scrollbar-thumb {background-color:#6799FF;border-radius: 10px;}
		::-webkit-scrollbar-thumb:hover {background: #555;}
		::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
		width:16px;height:16px;background:#4C4C4C;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/adaco/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	var notice = ${notice};
	console.log(notice);
	function printAttachment(attachments) {
		console.log(attachments);
		var $ul = $("#attachment");
		$ul.empty();
		$.each(attachments, function(i, attachment){
			var $li = $("<li>").appendTo($ul);
			if(attachment.image == true)
				$("<i class = 'fa fa-file-image-o'></i>").appendTo($li);			
			else 
				$("<i class = 'fa fa-paperclip'></i>").appendTo($li);
			// 첨부파일에 대한 링크를 아이콘 뒤에 추가
			$("<a href='/adaco/attachment/view?ano=" + attachment.ano + "'>" + attachment.originalFileName + "</a>").appendTo($li);
			
			// 첨부파일을 삭제하기 위한 <span></span> 출력
			// <span class = '' data-ano = '20' data-bno = '129'>
			if(isLogin == true && board.writer == loginId) {
				var str = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" 
				str += "<span class = 'delete_attachment' data-ano='";
				str += attachment.ano;
				str += "' data-bno='";
				str += attachment.bno;
				str += "' >X</span>"
				$li.append(str);
				$(".delete_attachment").css("cursor", "pointer").attr("title", "삭제하기");
			}
		});
	}
	var isLogin = false;
	
	$(function(){
		if(isLogin == true)
			var ck = CKEDITOR.replace("content", {filebrowserUploadUrl:"http://localhost:8081/adaco/admin/notice/ckupload"})
		$("#title").val(notice.title);
		$("#write_date").text(notice.writeDateStr);
		$("#content").html(notice.content);
		printAttachment(notice.attachments);
	})
</script>
</head>
<body>
	<form action="/adaco/admin/notice_write" method="post" id = "wrFrm" enctype="multipart/form-data">
		<div id = "title_div">
			<div class = "upper">
				<label for = "title" style="margin-left: 50px; margin-top: 20px;">▣제목</label>
				<input type = "text" class = "form-control" id = "title" name = "title">
			</div>
		</div>
			<div class = "form-group">
				<ul id = "attachment">
				</ul>
			</div>
			<div class = "form-group" id ="content_div">
				<label for = "content" style="margin-left: 50px;">◈내용</label>
				<div class = "form-group">
					<div class = "form-control" id = "content" name = "content" cols="50" rows="10" readonly="readonly" style="background-color: white;"></div>
				</div>
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class = "form-grop">
				<button type = "button" class = "btn btn-success" id = "write">작성</button>
				<button type = "button" id = "add">첨부파일 추가</button>
				<div id = "attachment_div">
				</div>
				<div id = "check_div">
					<input type = "hidden"id = "isImportant" name = "isImportant" value="0">
				</div>
				<div>
		       		<ul>
		            	<li>
		            		<input id="checkbox1" id= "checkbox" name="checkbox" type="checkbox"> <label for="checkbox1">중요 공지</label>
	            		</li>
		            </ul>
	            </div>
	        </div>
			</sec:authorize>
			<a style="margin-left: 50px;"href="/adaco/admin/notice_list" class = "btn btn-primary">뒤로가기</a>			
			<input type = "hidden" name = "_csrf" value = "${_csrf.token }">
	</form>
</body>
</html>