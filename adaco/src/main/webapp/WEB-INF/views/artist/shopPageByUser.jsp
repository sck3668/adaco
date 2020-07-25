<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<style>
 
</style>
<body>
<section id="section">
<div class="container">
  <h1 class="my-4">상점 정보보기
    <small></small><!-- 글씨 쓸수 있는 칸 -->
  </h1>
  <div class="row">
    <div class="col-md-8">
    <img id="show_profile" src="${shop.image }">
      <img class="img-fluid" id="shop_profile" src="#" alt="">
    </div>
    <div class="col-md-4">
      <h3 class="my-3"><strong>상점 이름</strong></h3>
      <span id="shopName">${shop.shopName }</span>
     <h3 class="my-3"> <strong>상점 소개</strong></h3>
      <span id="shopIntro">${shop.shopIntro }</span>
      <p></p>
      <input type="hidden" name="_csrf" value="${_csrf.token }">
    </div>
  </div>
  <h3 class="my-4">작가 작품</h3>

  <div class="row">

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="${shop.image }" alt="">
          </a>
    </div>
    <div class="col-md-3 col-sm-6 mb-4">
		<sec:authorize access="hasRole('ROLE_SELLER')">
	    	<a href="/adaco/art/readByArtist?artno=${shop.artno[1] }">
	            <img class="img-fluid" src="${shop.img[1] }" alt="">
	        </a>
	    </sec:authorize>
	    <sec:authorize access="hasRole('ROLE_USER')">
	    	<a href="/adaco/art/readByUser?artno=${shop.artno[1] }">
	            <img class="img-fluid" src="${shop.img[1] }" alt="">
	        </a>
	    </sec:authorize>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
		<sec:authorize access="hasRole('ROLE_SELLER')">
	    	<a href="/adaco/art/readByArtist?artno=${shop.artno[2] }">
	            <img class="img-fluid" src="${shop.img[2] }" alt="">
	        </a>
	    </sec:authorize>
	    <sec:authorize access="hasRole('ROLE_USER')">
	    	<a href="/adaco/art/readByUser?artno=${shop.artno[2] }">
	            <img class="img-fluid" src="${shop.img[2] }" alt="">
	        </a>
	    </sec:authorize>
    </div>
<div class="col-md-3 col-sm-6 mb-4">
		<sec:authorize access="hasRole('ROLE_SELLER')">
	    	<a href="/adaco/art/readByArtist?artno=${shop.artno[3] }">
	            <img class="img-fluid" src="${shop.img[3] }" alt="">
	        </a>
	    </sec:authorize>
	    <sec:authorize access="hasRole('ROLE_USER')">
	    	<a href="/adaco/art/readByUser?artno=${shop.artno[3] }">
	            <img class="img-fluid" src="${shop.img[3] }" alt="">
	        </a>
	    </sec:authorize>
    </div>

  </div>
  <!-- /.row -->

</div>
</section>
</body>
</html>