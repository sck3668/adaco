<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
</head>
<body>
<form> 
<div>
 <aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
				<li><a href="/adaco/user/read">내정보보기</a></li>
				<li><a href="#">주문내역</a></li>
				<li><a href="/adaco/user/reviewList">내리뷰보기</a></li>
				<li><a href="/adaco/user/favoriteList">즐겨찾기목록</a></li>
				<li><a href="/adaco/user/pointList">포인트함 </a>
			</ul>
		</div>
	</div>
	</aside>
	<section id="section">
		<div>
			<img id ="show_profile" height="200px;"src="${shop.image }">
		</div>
		<div>
			<input type="file" name="image" id="image">
		</div>
		<table class="table table-hover" id="user">
			<tr>
				<td class="first">이름:</td>
				<td><span id="irum">${shop.shopName }</span></td>
			</tr>	
			<tr>
				<td class="first1">소개:</td>
				<td><span id="username">${shop.shopIntro }</span></td>
			</tr>
			<tr>
				<td class="first1">사업자번호:</td>
				<td><span id="birthDate">${shop.businessno }</span></td>
			</tr>
			<tr>
				<td class="first1">계좌번호:</td>
				<td><span id="birthDate">${shop.account}</span></td>
			</tr>
			<tr>
				<td class="first1">출고지</td>
				<td><span id="birthDate">${shop.forwarding }</span></td>
			</tr>
			<tr>
				<td class="first1">반품지:</td>
				<td><span id="birthDate">${shop.back }</span></td>
			</tr>
			<tr>
				<td class="first">비밀번호:<span id="passwordspan"></span></td>
				<td><button type="button"class="btn btn-info" id="pwdbtn">비밀번호 수정</button>
				<div id ="passwordArea">
					<span class="key">현재비밀번호:</span><input type="password" id="password"><br>
					<span class="key">새 비밀번호 : </span><input type="password" id="newPassword"><br>     
					<span class="key">새 비밀번호 확인 : </span><input type="password" id="newPassword2">
					<button type="button" class="btn btn-info" id="changePwd">변경</button>
				</div>
				</td>
			</tr>
			<tr>
			<td class="first">이메일</td>
			<td colspan="2">
				<input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">&nbsp;&nbsp;
				<select id="selectEmail">
					<option selected="selected">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</tr>
			<tr><td class="first">연락처</td>
			<td colspan="2">
				<input type="text" name="tel1" id="tel1" maxlength="3">&nbsp;
				<input type="text" name="tel2" id="tel2" maxlength="4">&nbsp;
				<input type="text" name="tel3" id="tel3" maxlength="4">&nbsp;
			</td>
			</tr>
		</table>	
		<button type="button" class="btn btn-info" id="update">변경하자</button>
	</section>
	</div>
</form>
</body>
</html>