<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<style>
.input-group { 
		border: 3px solid gold;
		border-radius: 5px;
 		margin: auto;
 		position: relative; 
 		left: 300px; 
		} 
		#search{
		background-color: #FFFFFF;
		border:0;
		outline:0;
		padding: 10px;
		}
		#artname{
		text-indent: 1em;
		border:0;
		outline:0;
		background-color: #FFFFFF;
		width:300px;
		}
 </style> 
<script type="text/javascript">
$(function(){
	$("#search").on("click", function(){
		var artname = $("#artname").val();
		location.href = "/adaco/art/listByUser?artname="+artname;
		console.log(artname);
	});
	
});	

</script>
</head>
<body>
<%-- ${artReviewPage.artList } --%>
	<div class="container">
    <div class="row">
    	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group" >
              <input type="text"  placeholder="작품 이름 검색" aria-label="Search" aria-describedby="basic-addon2" name = "artname" id ="artname" />
	              <div class="input-group-append">
	                	<button type="button" id = "search">
		                 <span style="color:gold"><i class="fas fa-search fa-lg"></i></span>
		                </button>
	              </div>
            </div>
		 </form>
      <div class="col-lg-12">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/image/main1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/image/main2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/image/main1.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">
<c:forEach items="${artReviewPage.artList }" var="art">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="image/art1.jpg" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                    <sec:authorize access="isAnonymous()">
               		<a href="/adaco/art/readByUser?artno=${art.artno}" >
                  	<img alt="작품 사진" src="${art.mainImg }" width="250px" height="200px"></a>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')">
            		<a href="/adaco/art/readByUser?artno=${art.artno}" >
                  	<img alt="작품 사진" src="${art.mainImg }" width="250px" height="200px"></a>
            	</sec:authorize>
                <sec:authorize access="hasRole('ROLE_SELLER')">
            		<a href="/adaco/art/readByArtist?artno=${art.artno}">
                  	<img alt="작품 사진" src="${art.mainImg }"></a>
                 </sec:authorize>
                </h4>
                <h5>${art.artName}</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
            </div>
          </div>
</c:forEach>
 	</div>
<!--  	/adaco/user/artListByReview?artname= -->
<!--  	artReviewPage -->
        <!-- /.row -->
        	<div style="text-align: center;">
		<ul class="pagination justify-content-center">
			<c:if test="${artReviewPage.prev==true}">
				<li><a href="/adaco/user/artListByReview?artname=${artReviewPage.search }&pageno=${artReviewPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${artReviewPage.startPage}" end="${artReviewPage.endPage}" var="i">
				<c:choose>
					<c:when test="${artReviewPage.pageno eq i }">
						<li class="active">
						<a href="/adaco/user/artListByReview?artname=${artReviewPage.search }&pageno=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/user/artListByReview?artname=${artReviewPage.search }&pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:if test="${artReviewPage.next==true}">
				<li><a href="/adaco/user/artListByReview?artname=${artReviewPage.search }&pageno=${artReviewPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
     </div>
      </div>
      <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->
  </div>
</body>
</html>