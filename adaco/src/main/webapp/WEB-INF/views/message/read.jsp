<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	$("#btnSend").on("click", function() {
		location.href = "/adaco/message/listSender";
	});
	$("#btnReceive").on("click", function() {
		location.href = "/adaco/message/listReceiver";
	});	
})
</script>
</head>
<body>
	 <table>
		<tr><td>${msg.writeDate}에 ${msg.sendId }님이 ${msg.recipientId }님에게 보낸 메모</td></tr>
		<tr><td>${msg.title }</td></tr> 
		<tr><td>${msg.content }</td></tr>
		<tr><td>${msg.mno }</td></tr>
	</table>
	<button id="btnSend">보낸 메모 페이지로</button>
	<button id="btnReceive">받은 메모 페이지로</button>
</body>
</html>