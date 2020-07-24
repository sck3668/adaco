<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
input[type="checkbox"],
input[type="radio"] {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}
input[type="checkbox"]:hover + label:before,
input[type="radio"]:hover + label:before {
  border-color: #999;
}
input[type="checkbox"]:active + label:before,
input[type="radio"]:active + label:before {
  transition-duration: 0;
  filter: brightness(0.2);
}
input[type="checkbox"] + label,
input[type="radio"] + label {
  position: relative;
  padding-left: 26px;
  font-weight: normal;
}
input[type="checkbox"] + label:before, input[type="checkbox"] + label:after,
input[type="radio"] + label:before,
input[type="radio"] + label:after {
  box-sizing: content-box;
  position: absolute;
  content: '';
  display: block;
  left: 0;
}
input[type="checkbox"] + label:before,
input[type="radio"] + label:before {
  top: 50%;
  width: 16px;
  height: 16px;
  margin-top: -10px;
  border: 2px solid #d9d9d9;
  text-align: center;
}
input[type="checkbox"] + label:after,
input[type="radio"] + label:after {
  background-color: #00bad2;
  top: 50%;
  left: 6px;
  width: 8px;
  height: 8px;
  margin-top: -4px;
  transform: scale(0);
  transform-origin: 50%;
  transition: transform 200ms ease-out;
}

input[type="radio"]:checked + label:before {
  -moz-animation: borderscale 300ms ease-in;
  -webkit-animation: borderscale 300ms ease-in;
  animation: borderscale 300ms ease-in;
  background-color: #fff;
}
input[type="radio"]:checked + label:after {
  transform: scale(1);
}
input[type="radio"] + label:before, input[type="radio"] + label:after {
  border-radius: 50%;
}

input[type="checkbox"] + label:after {
  background-color: transparent;
  top: 50%;
  left: 5px;
  width: 7px;
  height: 4px;
  margin-top: -5px;
  border-style: solid;
  border-color: #00bad2;
  border-width: 0 0 3px 3px;
  -moz-transform: rotate(-45deg) scale(0);
  -ms-transform: rotate(-45deg) scale(0);
  -webkit-transform: rotate(-45deg) scale(0);
  transform: rotate(-45deg) scale(0);
  -moz-transition: none;
  -o-transition: none;
  -webkit-transition: none;
  transition: none;
}
input[type="checkbox"]:checked + label:before {
  -moz-animation: borderscale 200ms ease-in;
  -webkit-animation: borderscale 200ms ease-in;
  animation: borderscale 200ms ease-in;
}
input[type="checkbox"]:checked + label:after {
  content: '';
  -moz-transform: rotate(-45deg) scale(1);
  -ms-transform: rotate(-45deg) scale(1);
  -webkit-transform: rotate(-45deg) scale(1);
  transform: rotate(-45deg) scale(1);
  -moz-transition: -moz-transform 200ms ease-out;
  -o-transition: -o-transform 200ms ease-out;
  -webkit-transition: -webkit-transform 200ms ease-out;
  transition: transform 200ms ease-out;
}

input[type="text"] {
  font-family: "Open Sans", "Helvetica Neue", Arial, sans-serif;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  padding: 5px 10px;
  background-color: #fff;
  border: 2px solid #d9d9d9;
}
input[type="text"]:focus {
  outline: none;
}
input[type="text"]:focus, input[type="text"]:hover {
  border-color: #999;
}




	body {
		padding-left: 320px;
	}
	
	#content {overflow: auto; width:900px; min-height: 800px; border-radius: 20px; box-shadow: 5px 5px 5px gray;}
	#title {width: 900px; border-radius: 20px; box-shadow: 5px 5px 5px gray;}
	::-webkit-scrollbar{width: 16px;}
		::-webkit-scrollbar-track {background-color:#4C4C4C;}
		::-webkit-scrollbar-thumb {background-color:#6799FF;border-radius: 10px;}
		::-webkit-scrollbar-thumb:hover {background: #555;}
		::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
		width:16px;height:16px;background:#4C4C4C;}
</style>
<script src="/adaco/ckeditor/ckeditor.js"></script>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<script type="text/javascript">
		var isAdmin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
	<script type="text/javascript">
		var isAdmin = false;
	</script>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_SELLER')">
	<script type="text/javascript">
		var isAdmin = false;
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script type="text/javascript">
		var isAdmin = false;
	</script>
</sec:authorize>

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
			if(isAdmin == true) {
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
	
	$(function(){
		if(notice.isImportant == true) {
			$("input:checkbox[name=checkbox]").prop("checked", true);
		}
		if(isAdmin == true) {			
			var ck = CKEDITOR.replace("content", {
				height: 600,
				filebrowserUploadUrl: 'http://localhost:8081/adaco/admin/notice/ckupload?${_csrf.parameterName}=${_csrf.token}'
			})
			$("#title").attr("readonly", false);
			$("#content").attr("readonly", false);
		}
		$("#title").val(notice.title);
		$("#write_date").text(notice.writeDateStr);
		$("#content").html(notice.content);
		printAttachment(notice.attachments);
		
		// 첨부 삭제
		$("#attachment").on("click", ".delete_attachment", function(){
			
			var params = {
					ano: $(this).data("ano"),
					noticeno: notice.noticeno,
					_method: "delete",
					_csrf: "${_csrf.token}"
			}
			$.ajax({
				url: "/adaco/attachment/delete",
				method: "post",
				data: params
			}).done((r)=>printAttachment(r)).fail((r)=>console.log(r));
		})
		
		// 글 변경
		$("#update").on("click", function() {
			if($("input:checkbox[name=checkbox]").is(":checked") == true) 
				$("#isImportant").val("1");
			else 
				$("#isImportant").val("0");
			
			var params = {
				noticeno: notice.noticeno,
				title: $("#title").val(),
				content: CKEDITOR.instances['content'].getData(),
				isImportant: $("#isImportant").val(),
				_csrf: "${_csrf.token}"
			}
			
			
			$.ajax({
				url: "/adaco/admin/notice_update",
				method: "post",
				data: params
			})
			.done((result)=>{ location.reload(); })
			.fail((result)=>{console.log(result)});
		});
		
		// 글 삭제
		$("#delete").on("click", function(){
			var params = {
					noticeno: notice.noticeno,
					_method: "delete",
					_csrf: "${_csrf.token}"
			}
			$.ajax({
				url: "/adaco/admin/notice_delete",
				method: "post",
				data: params
			}).done((r)=>location.href = r).fail((r)=>console.log(r));
		});
		
	})
</script>
</head>
<body>
	<form action="/adaco/admin/notice_write" method="post" id = "wrFrm" enctype="multipart/form-data">
		<div id = "title_div">
			<div class = "upper">
				<label for = "title">▣제목</label>
				<input type = "text" class = "form-control" id = "title" name = "title" readonly="readonly" style="background-color: white;">
			</div>
		</div>
			<div class = "form-group">
				<ul id = "attachment">
				</ul>
			</div>
			<div class = "form-group" id ="content_div">
				<label for = "content">◈내용</label>
				<div class = "form-group">
					<div class = "form-control" id = "content" name = "content" cols="50" rows="10" readonly="readonly" style="background-color: white;"></div>
				</div>
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class = "form-grop" style="margin-left: 50px;">
				<div id = "check_div">
					<input type = "hidden"id = "isImportant" name = "isImportant" value="0">
				</div>
				<div>
		        	<input id="checkbox1" id= "checkbox" name="checkbox" type="checkbox"> <label for="checkbox1">중요 공지</label>
	            </div>
				<button type = "button" class = "btn btn-success" id = "update">변경</button>
				<button type = "button" class = "btn btn-danger" id = "delete">삭제</button>
	        </div>
			<a style="margin-left: 50px;"href="/adaco/admin/notice_list" class = "btn btn-primary">뒤로가기</a>			
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_SELLER')">
			<a href="/adaco/user/noticeList" class = "btn btn-primary">뒤로가기</a>
			</sec:authorize>
			<input type = "hidden" name = "_csrf" value = "${_csrf.token }">
	</form>
</body>
</html>