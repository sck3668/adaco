<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="isAuthenticated()">
	<script src="/aboard/script/wsocket.js"></script>
</sec:authorize>
<style>
#block { cursor: pointer; }
</style>
<script>
$(function() {
	// 주소형식 http://localhost:8081/aboard/system/board/list?job=bad_list
	var job = location.search.substring(5);
	if(job==="bad_list")
		$("th i").attr("id", "block");
	else if(job==="block_list")
		$("th i").attr("id", "unblock");

	// 신고가 많은 글 중 선택한 글을 블록	
	// 서버로 여러개의 값 넘기기 1 : ,로 구분한 문자열로 넘기는 방식
	// 	-> 서버에서 split(",")를 이용해 분리
	// 11,22,33을 선택한 경우    ->  "11,22,33,"
	$("#block").on("click", function() {
		var ar = "";
		$(".bno").each(function(idx) {
			if($(this).prop("checked")) {
				ar = ar + ($(this).val()) + "," ;
			}
		});
		// 11,22,33을 선택한 경우 -> "11,22,33,"
		
		var $form = $("<form>").attr("action","/aboard/system/board/block").attr("method","post");
		$("<input>").attr("type","hidden").attr("name","bnos").val(ar).appendTo($form);
		$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
		$form.appendTo($("body")).submit();
	})

	// 블록한 글 중 선택한 글을 블록 해제
	// 서버로 여러개의 값 넘기기 2 : JSON 문자열로 넘기는 방식
	// 자바스크립트 배열을 만든다음 JSON으로 변환한 다음 보낸다
	// 11,22,33을 선택하면 [11,22,33]이 되고 JSON으로 변환한다
	$("#unblock").on("click", function() {
		var ar = [];
		$(".bno").each(function(idx) {
			if($(this).prop("checked")) {
				ar.push($(this).val());
			}
		});
		// 자바스크립트 배열을 json으로 변환한 다음 보낸다
		// 11, 22, 33을 선택하면 [11,22,33]이 되고 json으로 변환한다
		
		
		var $form = $("<form>").attr("action","/aboard/system/board/unblock").attr("method","post");
		$("<input>").attr("type","hidden").attr("name","bnos").val(JSON.stringify(ar)).appendTo($form);
		$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
		$form.appendTo($("body")).submit();
	})
})
</script>
</head>
<body>
	<div>
		<h1>${title }</h1>
		<table class="table table-hover">
			<colgroup>
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>추천수</th>
					<th>비추수</th>
					<th><i class="fa fa-scissors" aria-hidden="true"></i></th>
				</tr>
			</thead>
			<tbody id="list">
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.bno}</td>
					<td><a href="/aboard/board/read?bno=${board.bno}">${board.title }</a></td>
					<td>${board.writer }</td>
					<td>${board.goodCnt}</td>
					<td>${board.badCnt }</td>
					<td><input type="checkbox" class="bno" value="${board.bno}"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>