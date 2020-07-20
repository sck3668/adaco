<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
	background: linear-gradient(to bottom right, #F6F6F6, #FFFFFF);
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.my-hr3 {
	asd border: 0;
	height: 3px;
	background: #ccc;
}
</style>
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
		<hr>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
		<img src="${pageContext.request.contextPath}/image/hanstory.png"
		style="width: 350px; height: 150px;" alt="">
	<br>
	<br>
	<hr class="my-hr3">
	<br>
	<br>
	</div>
	
	
		<div>
			<div class="card align-middle" style="width: 30rem; border-radius: 20px;">
			<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">이름 퀴즈~!</h2>
				<h5>&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;ㅡ 가입하신 이름을 선택하세요 ㅡ</h5>
			<div>
				<c:forEach items="${irumAll}" var="irum" end="2"><br>
				<div>&emsp;
					<input type="radio" name="irum" value="${irum}" >&emsp;&nbsp;
					<input type="text"  value="${irum }" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly >
				</div>
				</c:forEach>
				<div>&nbsp;<br>
					&emsp;&nbsp;<input type="radio" name="irum" value="${irum }" readonly >&emsp;&nbsp;
					<input type="text" value="${irum}" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly >
				</div>
				<div>&emsp;
					<input type="hidden" id="userIrum" value="${irum}" readonly >&nbsp;&nbsp;&nbsp;
				</div>
					
			</div>
			<div>
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</div>
			<div class="card-body">
			 <button type="button" id="radioButton" value="인 증 하 기" class="btn btn-lg btn-primary btn-block" onclick="radio_chk();">인증하기</button>
			</div>	
			</div>
			</div>
		</div>
	<br><br><br><br><br><br></form>
</body>
</html>