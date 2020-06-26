<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#header  {
	letter-spacing: 0.75em
}
#header p {
	font-size: 1.75em;
	text-align: center;
}
#logo {
	display:inline-block; float:left; width:300px;
}
.ui_gnb__menu {
	display: inline-block; width:120px;
}
.dropdown-menu {
	display: inline-block; width:120px;
}
</style>
<script>
function init() {
	$("#dropdownCategoryMenu").hide();
	}
$(function() {
	init();
/* 	$(".dropdown").on("click", function() {
		}); */
	})
</script>
</head>
<body>
      <a href="/adaco/" id="logo"><img src="image/hanstory.png" alt="" style="width:40px; height:40px;">HandStory</a>
      <div class="full-w gnb-scroll ">
      <div class="inner-w container_gnb">
        <ul class="ui_gnb">
          <li class="dropdown">
          	<a href="#" id="dropdownCategoryMenu" data-toggle="dropdown">
          		<i class="fa fa-folder-open"></i> 카테고리 <i class="caret"></i>
          	</a>
          	<ul id="dropdown-menu" class="dropdown-menu" role="menu" aria-labelledby="dropdownCategoryMenu"> 
          		<li><a href="/category"><i class="fa fa-folder"></i> 전체보기</a></li> 
          		<li class="divider"></li> 
          		<li><a href="/category/1"><i class="fa fa-folder"></i>악세사리</a></li> 
          		<li><a href="/category/2"><i class="fa fa-folder"></i>인테리어</a></li> 
          		<li><a href="/category/3"><i class="fa fa-folder"></i>공예</a></li> 
          		<li><a href="/category/4"><i class="fa fa-folder"></i>기타</a></li> 
          	</ul> 
          <li class="ui_gnb__menu">
            <a href="#">최신작품</a>
          </li>
          <li class="ui_gnb__menu">
            <a href="#">인기작품</a>
          </li>
          <li class="ui_gnb__menu">
            <a href="#">스토리</a>
          </li>
          
          
          </li>

          
        </ul>
      </div>
      </div>
</body>
</html>