<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="page">
	<div id="main">
		<table id="list" class="table table-hover">
			<colgroup>
				<col width="20%"><col width="40%"><col width="20%"><col width="10%"><col width="10%">
			</colgroup>
			<thead>
				<tr><th>받는이</th><th>제목</th><th>보낸 날짜</th><th>읽음</th><th></th>
			</thead>
			<c:forEach items="${list}" var="message">
				<tr>
					<td>${message.recipientId}</td>
					<td><a href="/adaco/message/read?mno=${message.mno}">${message.title}</a></td>
					<td>${message.writeDate}
					<td>
						<c:choose>
							<c:when test="${message.msgCheck==true}">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose>
					</td>
					<td><input type="checkbox" class="mno" value="${message.mno}"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<button id="delete">체크한 메모 삭제</button>
</div>
</body>
</html>