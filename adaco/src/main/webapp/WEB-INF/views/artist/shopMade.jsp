<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){ 
	$("#selectEmail").on("change", function() {
    var choice = $("#selectEmail").val();
    if(choice!="선택하기") {
       $("#email2").val(choice);
       $("#email2").prop("disabled", true);
    }
    if(choice=="선택하기") {
       // input 상자의 내용이 없어야 placeholder가 출력된다
       $("#email2").val("");
       $("#email2").attr("placeholder", choice);
       $("#email2").prop("disabled", false);
		}
    });
 })
</script>
</head>
<body>

  <!--  <article class="container"> -->
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <hr><h4>당신의 상점을 개설해주세요</h4><hr>
                </div>
            </div>
            <div id="wrap">
            	<form action="/adaco/user/join" method="post" id="joinForm" enctype="multipart/form-data">    
                    <img id="show_profile" height="100px">
                    <input type="hidden" name="_csrf" value="${_csrf.token }">
                    <div class="form-group">
						<label for="sajin">상점소개 이미지</label>
						<input id="sajin" type="file" name="sajin" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
					</div>
                    <div class="form-group">
                        <label for="irum">상점 이름</label>
                        <input type="text" class="form-control" name="irum" id="irum" placeholder="상점 이름 등록해주세요">
                    	<span id="irum_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="username">사업자 번호</label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="사업자번호를 입력해주세요">
                        <span id="username_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="password">사업자 명의 계좌</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="사업자 명의 계좌 입력해주세요">
                    	<span id="pwd_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="ppassword2">출고지</label>
                        <input type="password" class="form-control" name="password2" id="password2" placeholder="출고지를 입력">
                    	<span id="pwdCheck_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="ppassword2">반품지</label>
                        <input type="password" class="form-control" name="password2" id="password2" placeholder="반품지를 입력해주세요">
                    	<span id="pwdCheck_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">택배사</label><br>
                        <input type="text" id="email2">&nbsp;&nbsp;
					<select id="selectEmail">
						<option selected="selected">택배사 선택</option>
						<option>로젠택배</option>
						<option>혁지택배</option>
						<option>혁지짱택배</option>
					</select>
					<button id="email" type="button">확인</button>
                    	<span id="email_msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="tel">연락처</label><br>
                        <input type="text" id="tel1" maxlength="3">&nbsp-&nbsp;
						<input type="text" id="tel2" maxlength="4">&nbsp-&nbsp;
						<input type="text" id="tel3" maxlength="4">
                    	<button id="tel" type="button">확인</button>
                    	<span id="tel_msg"></span>
                    </div>
                    <div class="form-group">
                    	<input type="hidden" class="form-control" name="authorities" value="ROLE_USER">
                    </div>
                    <div class="form-group">
                    <label>상점 개설 약관 동의</label>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" checked>
                    </label>
                    <a href="#">이용약관</a>에 동의합니다.
                    </div>
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" id="join" class="btn btn-primary">
                           개설하기<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            개설취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
           		</form>
            </div>
           
   <!--      </article> -->
	
</body>
</html>