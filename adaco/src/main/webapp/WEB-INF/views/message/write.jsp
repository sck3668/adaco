<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="hasRole('ROLE_USER')">
	<script src="/aboard/script/wsocket.js"></script>
</sec:authorize>
</head>
<body>
	<form action="/adaco/message/write" method="post" id="frm">
		<div class="form-group">
			<label for="title">제목:</label>
			<input type="text" class="form-control" id="title" name="title" placeholder="제목">
    	</div>
		<div class="form-group">
			<textarea class="form-control" rows="5" id="content" name="content"></textarea>
		</div>
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		<input type="hidden" name="recipientId" value="${recipientId }">
		<button type="submit" class="btn btn-success" id="write">작성</button>
	</form>
</body>
</html>