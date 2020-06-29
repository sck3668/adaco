<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 글 쓰기</title>
</head>
<body>	
	<button>스토리 글 쓰기</button>
	<form action="/adaco/story/write" method="post" id="writeForm" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">제목:</label>
			<input type="text" class="form-control" id="title" name="title">
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content"></textarea>
		</div>
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		<button type="button" class="btn btn-success" id="write">작성</button>
		<button type="button" id="add">첨부파일 추가</button>
		<div id="attachment_div">
		
		</div>
	</form>
</body>
</html>