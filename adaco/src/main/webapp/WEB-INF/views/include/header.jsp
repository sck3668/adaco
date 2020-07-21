<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>            
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<title></title>
</head>
<script type="text/javascript">
$(document).ready(function() {	
	$('#nav li').hover(function() {
		$('ul', this).slideDown(200);
		$(this).children('a:first').addClass("hov");fqj
	}, function() {
		$('ul', this).slideUp(100);
		$(this).children('a:first').removeClass("hov");		
	});
});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, Tahoma, sans-serif;
	font-size: 11px;
	color: #232323;
}

.wrap {
	width: 750px;
	margin: 0 auto;
}

/* @group core nav menu */
#nav {
	margin: 0;
	padding: 0;
	list-style: none;
	border-left: 1px solid #d5dce8;
	border-right: 1px solid #d5dce8;
	border-bottom: 1px solid #d5dce8;
	border-bottom-left-radius: 4px;
	-moz-border-radius-bottomleft: 4px;
	-webkit-border-bottom-left-radius: 4px;
	border-bottom-right-radius: 4px;
	-moz-border-radius-bottomright: 4px;
	-webkit-border-bottom-right-radius: 4px;
	height: 50px;
	padding-left: 15px;
	padding-right: 15px;
	background: #edf3f7;
}

#nav li {
	float: left;
	display: block;
	background: none;
	position: relative;
	z-index: 999;
	margin: 0 1px;
}

#nav li a {
	display: block;
	padding: 0;
	font-weight: 700;
	line-height: 50px;
	text-decoration: none;
	color: #818ba3;
	zoom: 1;
	border-left: 1px solid transparent;
	border-right: 1px solid transparent;
	padding: 0px 12px;
}

#nav li a:hover, #nav li a.hov {
	background-color: #fff;
	border-left: 1px solid #d5dce8;
	border-right: 1px solid #d5dce8;
	color: #576482;
}

/* @group subnav */
#nav ul {
	position: absolute;
	left: 5px;
	display: none;
	margin: 0;
	padding: 0;
	list-style: none;
	border: 1px #d5dce8 solid;
}

#nav ul li {
	width: 180px;
	float: cneter;
	border-top: 1px solid #fff;
	text-align: left;
}

#nav ul li:hover {
	border-left: 0px solid transparent;
	border-right: 0px solid transparent;
	background: #eee
}
/*  #nav ul a { display: block; height: 20px; line-height: 20px; padding: 8px 5px; color: #666; border-bottom: 1px solid transparent; text-transform:  uppercase; color: #797979; font-weight: normal; }  */
#nav ul a:hover {
	text-decoration: none;
	border-right-color: transparent;
	border-left-color: transparent;
	background: transparent;
	color: #4e4e4e;
}

* html #nav ul {
	margin: 0 0 0 -2px;
}

/** @group clearfix **/
.clearfix:after {
	content: ".";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}

.clearfix {
	display: inline-block;
}

html[xmlns] .clearfix {
	display: block;
}

* html .clearfix {
	height: 1%; 
}
</style>
<body>   
<sec:authorize access="isAnonymous()">
    <div class="wrap">
	<ul id="nav" style="background-color: #C2E2E8">
		<li><a href="#">카테고리</a>
			<ul>
				<li style="background: #C2E2E8;"><a href="/adaco/art/listByUser">전체 보기</a></li>
			</ul>
		</li>
		<li><a href="http://localhost:8081/adaco/"><i class="fas fa-home">HOME</i></a></li>
		<li><a href="http://localhost:8081/adaco/art/listByUser?category=공예"><i class="fas fa-drafting-compass">공예</i></a></li>
		<li><a href="http://localhost:8081/adaco/art/listByUser?category=인테리어"><i class="fas fa-american-sign-language-interpreting">인테리어</i></a></li>
		<li><a href="http://localhost:8081/adaco/art/listByUser?category=악세사리"><i class="fas fa-hat-wizard">악세사리</i></a></li>
		<li><a href="/adaco/user/artListByReview"><i class="fas fa-kiss-wink-heart">인기 작품</i></a></li>
		<li><a href="/adaco/story/listStory"><i class="fas fa-book-open">스토리</i></a></li>
	</ul>
</div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
    <div class="wrap">
	<ul id="nav" style="background-color: #C2E2E8">
		<li><a href="#">카테고리</a>
			<ul>
				<li style="background: #C2E2E8;"><a href="/adaco/art/listByUser">전체 보기</a></li>
			</ul>
		</li>
		<li><a href="http://localhost:8081/adaco/"><i class="fas fa-home">HOME</i></a></li>
		<li><a href="http://localhost:8081/adaco/art/listByUser?category=공예"><i class="fas fa-drafting-compass">공예</i></a></li>
		<li><a href="http://localhost:8081/adaco/art/listByUser?category=인테리어"><i class="fas fa-american-sign-language-interpreting">인테리어</i></a></li>
		<li><a href="http://localhost:8081/adaco/art/listByUser?category=악세사리"><i class="fas fa-hat-wizard">악세사리</i></a></li>
		<li><a href="/adaco/user/artListByReview"><i class="fas fa-kiss-wink-heart">인기 작품</i></a></li>
		<li><a href="/adaco/story/listStory"><i class="fas fa-book-open">스토리</i></a></li>
	</ul>
</div>
</sec:authorize>
</body>
</html>