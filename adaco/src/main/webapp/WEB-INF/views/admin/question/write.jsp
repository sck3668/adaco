<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@-moz-keyframes borderscale {
  50% {
    box-shadow: 0 0 0 2px #999;
  }
}
@-webkit-keyframes borderscale {
  50% {
    box-shadow: 0 0 0 2px #999;
  }
}
@keyframes borderscale {
  50% {
    box-shadow: 0 0 0 2px #999;
  }
}

body {
  font-family: "Open Sans", "Helvetica Neue", Arial, sans-serif;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  display: -webkit-flex;
  display: flex;
  -webkit-align-items: center;
  align-items: center;
  -webkit-justify-content: center;
  justify-content: center;
  background: #2d2d2d;
}

form {
  background: #fff;
  border-radius: 20px;
  box-shadow: 5px 5px 15px rgba(107, 173, 182, 0.6);
  padding: 1rem 2rem;
  min-width: 30vw;
}
form li {
  margin: 0.3rem 0;
}
form div {
  margin: 1.5rem 0;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

/* IE 10/11+ - This hides native dropdown button arrow so it will have the custom appearance, IE 9 and earlier get a native select - targeting media query hack via http://browserhacks.com/#hack-28f493d247a12ab654f6c3637f6978d5 - looking for better ways to achieve this targeting */
@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
  select::-ms-expand {
    display: none;
  }

  select:focus::-ms-value {
    background: transparent;
    color: grey;
  }
}

	.form-group {
		margin: 0 auto;
	}
	
	body {
		margin: 0;
		padding: 0 ;
		background : #f3f3f3;
  		padding-top: 50px;
	}
	#title {
		width: 800px;
	}
	.form-group {
		width: 800px;
	}
	
</style>
<title>문의글 작성</title>
<script src="/adaco/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function(){
		
		/* form 을 넘기기 전 값 확인 */
		$("#write").on("click", function(){
			
			console.log($("#wrFrm").serialize());
			$("#wrFrm").submit();
		});
	})
</script>
</head>
<body>
	<form action="/adaco/admin/question_write" method="post" id = "wrFrm">
		<div class = "form-group">
			<label for = "title">제목:</label>
			<input type = "text" class = "form-control" id = "title" name = "title">
		</div>
		<div class = "form-group">
			<textarea class = "form-control" id = "content" name = "content" cols="50" rows="10" style="min-height: 600px;"></textarea>
			<button type = "button" class = "btn btn-success" id = "write">작성</button>
			<a href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
        </div>
		<input type = "hidden" name = "_csrf" value = "${_csrf.token }">
	</form>
</body>
</html>