<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tel1 {width:50px;}
	#tel2 {width:50px;}
	#tel3 {width:50px;}
	#email1 {width:80px;}
	#email2 {width:100px;}
</style>
</head>
<body>
<form>
       <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <hr><h4>회원가입에 오신걸 환영합니다</h4><hr>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" action="/adaco/user/join" id="joinForm" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_csrf" value="${_csrf.token }">
                    <div class="form-group">
                        <label for="irum">이름</label>
                        <input type="text" class="form-control" id="irum" placeholder="이름을 입력해 주세요">
                    	<span id="irum_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="username">아아디</label>
                        <input type="email" class="form-control" id="username" placeholder="아이디를 입력해주세요">
                        <span id="username_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="pwd">비밀번호</label>
                        <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요">
                    	<span id="pwd_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="pwdCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwdCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    	<span id="pwdCheck_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label><br>
                        <input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">&nbsp;&nbsp;
					<select id="selectEmail">
						<option selected="selected">직접 입력</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select>
                    	<span id="email_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="tel">연락처</label><br>
                        <input type="text" name="tel1" id="tel1" maxlength="3">&nbsp-&nbsp;
						<input type="text" name="tel2" id="tel2" maxlength="4">&nbsp-&nbsp;
						<input type="text" name="tel3" id="tel3" maxlength="4">
                    	<span id="tel_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="birthDay">생년월일</label>
                        <input type="tel" class="form-control" id="birthDay" placeholder="생년월일을 입력해 주세요">
                    	<span id="birthDay_msg"></span>
                    </div>

                    <div class="form-group">
                    <label>약관 동의</label>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" checked>
                    </label>
                    <a href="#">이용약관</a>에 동의합니다.
                    </div>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                </form>
            </div>

        </article>
</form>
</body>
</html>