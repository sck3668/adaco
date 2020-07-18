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
<script>
$(document).ready(function () {
    $('#radioButton').click(function () {
      // getter
      var irum = $('input[name="irum"]:checked').val();
    /*   var params = {
    		  _csrf:'${_csrf.token}',
    		  irum: irum
      } */
		if(irum==$("#userIrum").val()) {
			$("#findId2Form").submit();
		} else {
			alert("이름이 일치하지 않습니다. 다시 인증해주세요");
			location.href="/adaco/user/findIdPwd"
		}
     });

   /*  $('#radioButton2').click(function () {
      // setter
      // 선택한 부분을 세팅할 수 있다.
      $('input[name="radioTxt"]').val(['Banana']);
    }); */
  });
</script>
<!-- irum값 랜덤으로 출력
	체크한 값만 controller로 넘겨서 확인
 -->
<head>
	<form id="findId2Form" method="post" action="/adaco/user/findId2">
	<div>
		<hr><h1>질문</h1><hr>
		<h3>가입하신 이름을 선택하세요</h3>
	</div>
		<div>
			<div>
			</div>
			<div>
				<c:forEach items="${irumAll}" var="irum" end="2">
					<input type="radio" name="irum" value="${irum}" >
					<input type="text" value="${irum }" readonly ><br>
				</c:forEach>
					<input type="radio" name="irum" value="${irum }" readonly >
					<input type="text" value="${irum}" readonly ><br>
					<input type="hidden" id="userIrum" value="${irum}" readonly >
					
			</div>
			<div>
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"><br>
			</div>
			<br>
			<div>
			 <button type="button" id="radioButton">인증하기</button>
			</div>	
		</div>
	</form>
</body>
</html>