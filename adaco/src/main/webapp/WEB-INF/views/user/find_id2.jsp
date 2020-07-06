<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(function(){
	var a = "${irum}"
	console.log()
		$("#button").on("click",function(){
			if($(this)==a){
				console.log($("#findId2Form").serialize());
				$("#findId2Form").submit();
				
		}
	})
})
</script>

	
<!-- irum값 랜덤으로 출력
	체크한 값만 controller로 넘겨서 확인

	
 -->
 
	<form id="findId2Form" method="post" action="/adaco/user/findId2">
	<div>
		<hr><h1>질문</h1><hr>
		<h3>가입하신 이름을 선택하세요</h3>
	</div>
		<div>
			<div>
				<input type="radio">
			</div>
				<span id="first" name="first">gg</span>
			<div>
				<span id="first" name="first">hh</span>
			</div>
			<div>
				<span id="first" name="first">jj</span>
			</div>
			<div>
				<span id="first" name="first">qq</span>
			</div>
			<div>
			</div>
			<div>
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"><br>
			</div>
			<br>
			<div>
			 <button type="button" id="button">인증하기</button>
			</div>	
		</div>
	</form>
</body>
</html>