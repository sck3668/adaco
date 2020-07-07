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
<style>
	#user td {
		height: 60px;
		line-height: 60px;
	}
	
	#user td input {
		height: 25px;
	}
	
	#tel1, #tel2, #tel3 {
		width: 125px;
	}
	
	.first {
		background-color: #f3f3f3;
		text-align: center;
	}
	#profile_sajin {
		line-height: 25px;
	}
	.key {
		width: 35%;
		display: inline-block;
	}
</style>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>

</head>
<body>
	<div>
		<img id="show_profile" height="200px;" src="${user.profile }">
	</div>
	<div>
		<input type="file" name="sajin" id="sajin">
	</div>
	<table class="table table-hover" id="user">
		<tr>
			<td class="first">이름</td>
			<td><input type="text" id="irum" value="${user.irum}">&nbsp;	<button type="button" class="btn btn-info" id="changeIrum">이름변경</button></td>
			<td><img width="120px" id="profile">
			</td>
		</tr>
		<tr>
			<td class="first">아이디</td><td colspan="2"><span id="username">${user.username }</span></td>
		</tr>
		<tr>
			<td class="first">생년월일</td><td colspan="2"><span id="birthDate">${user.birthDateStr }</span></td>
		</tr>
		<tr>
			<td class="first">가입일</td><td colspan="2"><span id="joinDate">${user.joinDateStr }</span></td>
		</tr>
		<tr>
			<td class="first">가입기간</td><td colspan="2"><span id="days">${user.days }</span>일</td>
		</tr>
		<tr>
			<td class="first">레벨</td><td colspan="2"><span id="level">${user.levelStr }</span></td>
		</tr>
		<tr><td class="first">비밀번호</td>
			<td colspan="2">
				<button type="button" class="btn btn-info" id="activateChangePwd">비밀번호 수정</button>
				<div id="passwordArea">
					<span class="key">현재 비밀번호 : </span><input type="password" id="password" ><br>
					<span class="key">새 비밀번호 : </span><input type="password" id="newPassword"><br>
					<span class="key">새 비밀번호 확인 : </span><input type="password" id="newPassword2">
	  				<button type="button" class="btn btn-info" id="changePwd">변경</button>
				</div>
			</td></tr>
		<tr><td class="first">이메일</td>
			<td colspan="2">
				<input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">&nbsp;&nbsp;
				<select id="selectEmail">
					<option selected="selected">직접 입력</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</td></tr>
		<tr><td class="first">연락처</td>
			<td colspan="2">
				<input type="text" name="tel1" id="tel1" maxlength="3">&nbsp;
				<input type="text" name="tel2" id="tel2" maxlength="4">&nbsp;
				<input type="text" name="tel3" id="tel3" maxlength="4">
			</td></tr>
		<tr><td class="first">회원정보</td>
			<td colspan="2">
				로그인 횟수 : <span id="loginCnt">${user.loginCnt }</span><br>
				작성 글수 : <span id="writeCnt">${user.writeCnt }</span>
			</td></tr>
	</table>
	<button type="button" class="btn btn-success" id="update">변경하기</button>
</body>
</html>