<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$('.button').click("function"(){
		$(this).next().css("color","red");
	})
	$('.button').click("function"(){
		$(this).prev().css("color","red");
	})
</script>
</head>
<body>
<a href="#"><img src="file:///C:/git/adaco/adaco/src/main/webapp/image/art1.jpg" alt="이미지"></img></a>
<a href="#"><img src="file:///C:/git/adaco/adaco/src/main/webapp/image/art1.jpg" alt="이미지x"></img></a>
<!-- 	var cnt = parseint($(this).next()).next; 값 읽어내기 -->

<div>
<button class="button1">버튼1</button> 
<button class="button2">버튼2</button> 
</div>
</body>
</html>