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
		
		
	body{
    animation: fadein 250ms ease-out;
    -moz-animation: fadein 250ms ease-out; /* Firefox */
    -webkit-animation: fadein 250ms ease-out; /* Safari and  Chrome */
    -o-animation: fadein 250ms ease-out; /* Opera */
	}
	@keyframes fadein {
	    from {opacity:0;}
	    to {opacity:1;}
	}
	@-moz-keyframes fadein { /* Firefox */
	    from {opacity:0;}
	    to {opacity:1;}
	}
	@-webkit-keyframes fadein { /* Safari and Chrome */
	    from {opacity:0;}
	    to {opacity:1;}
	}
	@-o-keyframes fadein { /* Opera */
	    from {opacity:0;}
	    to {opacity: 1;}
	}


 </style> 
<script type="text/javascript">
$(function(){
// 	$("#category").on("click",function() {
// 		var url = decodeURIComponent(window.location.href);
// 		var idx = url.lastIndexOf("=");
// 		var category = url.substring(idx+1);
// 		console.log(category);
// 		if(category!='${artPage.pageno}') {
// 			/adaco/art/listByUser?artname=${artPage.search }&pageno=${i}&category=${artPage.artList[i].category}
// 			$("#category").attr("href","/adaco/art/listByUser?pageno="+${i}&category=${artPage.artList[i].category});
// 		};
// 	});
	
	   
	$("#search").on("click", function(){
		var artname = $("#artname").val();
		var url = decodeURIComponent(window.location.href);
//			http://localhost:8081/adaco/art/listByUser?category=인테리어22
		var idx = url.lastIndexOf("=");
		var category = url.substring(idx+1);
		location.href = "/adaco/art/listByUser?artname="+artname+"&category="+category;
	});
	$("#artname").on("keypress",function(key) {
		var artname = $("#artname").val();
		var url = decodeURIComponent(window.location.href);
		var idx = url.lastIndexOf("=");
		var category = url.substring(idx+1);
		if(key.keyCode!=13) {
			return;
		} else {
			alert(category);
			location.href = "/adaco/art/listByUser?artname="+artname+"&category="+category;
		}
	})
    
    $("body").css("display", "none");
    $("body").fadeIn(100);
    $("a.transition").click(function(event){
    event.preventDefault();
    linkLocation = this.href;
    $("body").fadeOut(100, redirectPage);
    });
    function redirectPage() {
    window.location = linkLocation;
    }


});	

</script>


</head>
<body>
	<div class="container">
    <div class="row">
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		            <div class="input-group" >
		              <input type="text"  placeholder="작품 이름 검색" aria-label="Search" aria-describedby="basic-addon2" name = "artname" id ="artname"/>
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
<c:forEach items="${artPage.artList }" var="art">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
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
                  	<img alt="작품 사진" src="${art.mainImg }" width="250px" height="200px"></a>
                 </sec:authorize>
                </h4>
                <h5>${art.artName}</h5>
                <p class="card-text"></p>
              </div>
            </div>
          </div>
</c:forEach>
	
        </div>
        <!-- /.row -->
        	<div style="text-align: center;">
		<ul class="pagination justify-content-center">
			<c:if test="${artPage.prev==true}">
				<li><a href="/adaco/art/listByUser?artname=${artPage.search }&pageno=${artPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${artPage.startPage}" end="${artPage.endPage}" var="i">
				<c:choose>
					<c:when test="${artPage.pageno eq i }">
						<li class="active">
						<a href="/adaco/art/listByUser?artname=${artPage.search }&pageno=${i}&category=${artPage.category}">${i}</a></li>
					</c:when>
					<c:otherwise>
								<li><a href="/adaco/art/listByUser?artname=${artPage.search }&pageno=${i}&category=${artPage.category}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${artPage.next==true}">
				<li><a href="/adaco/art/listByUser?artname=${artPage.search }&pageno=${artPage.endPage+1}">다음</a></li>
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