<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div>
	<h1>보낸쪽지함</h1>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th><th>받는사람</th><th>제목</th><th>보낸날짜</th><th>읽음여부</th><th></th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="message">
					<tr>
						<td></td>
						<td></td>
						<td><a href="/adaco/message/read?mno="></a></td>
						<td></td>					
						<td>
							<c:choose>
								<c:when test="">O</c:when>
								<c:otherwise>X</c:otherwise>
							</c:choose>
						</td>
						<td><input type="checkbox" class="mno" value=""></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br><br><br><br><br><br><br><br><br><br>
		<button style="float:right;">쪽지삭제</button>
	</div> 
</body>
</html>