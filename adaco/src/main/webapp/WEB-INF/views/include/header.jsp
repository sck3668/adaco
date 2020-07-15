<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>           
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

a {text-decoration: none;}
#header  {
	letter-spacing: 0.75em
}
#header p {
	font-size: 1.75em;
	text-align: center;
}
.ui_gnb {}
.ui_gnb__menu {
	display: inline-block; width:120px;
}
#dropdown-menu {
	display: inline-block; width:120px;
}
#dropdown {float: left; display:inline-block; width:120px; }


</style>
<script>
$(function(){
	$("#search").on("click", function(){
		var category = $("#category").val();
		location.href = "/adaco/art/listByArtist?category="+category;
	});
});	

function init() {
	$("#dropdown-menu").hide();
	}
$(function() {
	init();
	$("#dropdown-menu").hide();
 	$("#dropdownCategoryMenu").on("click", function() {
		$("#dropdown-menu").toggle();	
 		}); 
	})
	
</script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_USER')">
      <div class="full-w gnb-scroll ">
      <div class="inner-w container_gnb">
        <ul class="ui_gnb">
           <li class="dropdown" id="dropdown">
          	<a href="#" id="dropdownCategoryMenu">
          		<i class="fa fa-folder-open"></i> 카테고리 <i class="caret"></i>
          	</a>
          	<ul id="dropdown-menu" class="dropdown-menu" role="menu" aria-labelledby="dropdownCategoryMenu"> 
          		<li><a href="/adaco/art/listByUser"><i class="fa fa-folder"></i> 전체보기</a></li> 
          		<li class="divider"></li> 
          		<li><a href="http://localhost:8081/adaco/art/listByUser?category=악세사리"><i class="fa fa-folder"></i>악세사리</a></li> 
          		<li><a href="http://localhost:8081/adaco/art/listByUser?category=인테리어"><i class="fa fa-folder"></i>인테리어</a></li> 
          		<li><a href="http://localhost:8081/adaco/art/listByUser?category=공예"><i class="fa fa-folder"></i>공예</a></li> 
          		<li><a href="http://localhost:8081/adaco/art/listByUser?category=기타"><i class="fa fa-folder"></i>기타</a></li> 
          	</ul> 
          </li>
          <li class="ui_gnb__menu">
            <a href="#">최신작품</a>
          </li>
          <li class="ui_gnb__menu">
            <a href="/adaco/user/artListByReview">인기작품</a>
          </li>
          <li class="ui_gnb__menu">
            <a href="/adaco/story/listStory">스토리</a>
          </li>
        </ul>
      </div>
      </div>
      </sec:authorize>
</body>
</html>