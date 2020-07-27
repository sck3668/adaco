<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 리스트</title>

<style>
.articles-v3 {}

.articles-v3__img {
  display: block;
  transition: opacity .3s;
  border-radius: var(--radius-md);
  overflow: hidden;

  img {
    display: block;
    width: 100%;
  }

  &:hover {
    opacity: 0.85;
  }
}

.articles-v3__headline {
  font-size: var(--text-xl);

  a {
    color: var(--color-contrast-higher);
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }
}

.articles-v3__author {
  display: grid;
  grid-template-columns: 3em 1fr;
  grid-gap: var(--space-xs);
  align-items: center;
  margin-top: var(--space-md);
}

.articles-v3__author-img {
  display: block;
  width: 3em;
  height: 3em;
  border-radius: 50%;
  overflow: hidden;
  transition: transform .3s var(--ease-out-back);
  
  img {
    display: block;
    width: inherit;
    height: inherit;
  }

  &:hover {
    transform: scale(1.1);
  }
}

.articles-v3__author-name {
  font-weight: bold;
  color: var(--color-contrast-higher);
  text-decoration: none;

  &:hover {
    text-decoration: underline;
  }
}
	
	
	#storyList {
		border: 1px solid gray;
		width:250px;
		height:300px;
		display: inline-block;
		margin: 20px;
	}
	.writeDate {
		font-size: 0.75em;
		text-align: right;
	}
	#textAreadown {
		display: inline-block;
	}
	.image {
		display:inline-block;
		width:70px;
		height:70px;
	}
	#textAreaUp {
		height:70px;
	}
	
	
	
	
	
	body{
    animation: fadein 500ms ease-out;
    -moz-animation: fadein 500ms ease-out; /* Firefox */
    -webkit-animation: fadein 500ms ease-out; /* Safari and  Chrome */
    -o-animation: fadein 500ms ease-out; /* Opera */
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
<script>
	$(function() {
		var url = window.location.href;
		var page = url.split("/");
		console.log(page[5]);
		//if("${memoMsg}"!=="")
		//	toastr.info("새로운 메모가 있습니다");
		
		// 1. 아이디를 클릭하면 나타나는 가입일보기, 게시물보기, 메모보내기로 구성된 컨텍스트 메뉴에 대한 처리
		// 1-1. 게시물보기, 메모보내기 기능을 실행하려면 사용자 아이디를 필요로 하므로 클릭한 아이디를 컨텍스트 메뉴로 복사
		$(".writer").on("click", function() {
			// 글쓴사람 아이디를 클릭하면 모달 메뉴를 출력
			// 아이디는 td에 data-writer로 저장. 모달 메뉴를 띄우는 순간에 메뉴쪽에 복사	
			$(".modal-body li").attr("data-writer", $(this).attr("data-writer"));
		});
		
		// 1-2. 게시물 보기를 선택했을 때
		$("#read_by_id").on("click", function() {
			location.href = "/adaco/art/listByUser?writer=" + $(this).data("writer");
		});
		
		// 1-5. 모달 대화상자의 메모 보내기
		$("body").on("click", "#write_memo", function() {
			location.href = "/adaco/message/write?recipientId=" + $(this).attr("data-writer")
		});
		
		
		
		var $endPage = ${story.endPage};
	    var check = true;
	    
	    $(window).scroll(function(){
	        let $window = $(this);
	        let scrollTop = $window.scrollTop();
	        let windowHeight = $window.height();
	        let documentHeight = $(document).height();
	        
	       	// 현재 스크롤 위치 확인 
	        // console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	        
	        if( scrollTop + windowHeight + 30 > documentHeight && check == true){
		 		fetchList();   	
	 		    check = false;
	        }
	    
	    })
	    function fetchList() {
		    var url = window.location.href;
		    var pageno = url.split("=");
		    var thisPage = pageno[1];
		    if(thisPage == null) {
		    	thisPage= 1;
		    }
	        if(thisPage == $endPage){
	            return;
	        }
	        
	       	var startNo = thisPage*1+1;
	       	var artistno = ${story.artistno};
	       	// 작가회원이 아닐시 artistno는 0이 들어옴 
	       	// artistno가 0 인 경우는 일반회원
	       	// artistno가 0 이 아닌 경우는 작가
	       	if(artistno!=0) {
		        $.ajax({
		            url:"/adaco/story/listStory?pageno="+startNo+"&artistno="+${story.artistno},
		            method: "GET",
		        }).done(()=>{
			        history.pushState(null, null, "/adaco/story/listStory?pageno="+startNo+"&artistno="+${story.artistno});
				    location.reload(true);
		        }).fail((f)=>console.log(f));
	       	} else {
	       	 $.ajax({
		            url:"/adaco/story/listStory?pageno="+startNo,
		            method: "GET",
		        }).done(()=>{
			        history.pushState(null, null, "/adaco/story/listStory?pageno="+startNo);
				    location.reload(true);
		        }).fail((f)=>console.log(f));
	       	}
	    }
	    
	    
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
	    
	    $("#top").on("click", function(e){
	    	e.preventDefault();
	    	$('html,body').animate({scrollTop:$(this.hash).offset().top}, 800);
	    })
	})
</script>
</head>
<body>
	<h1 id = "target">스토리</h1>
	<hr>
	<section class="articles-v3">
	  <div class="container max-width-adaptive-lg">
	    <ul class="grid gap-lg">
		<c:forEach items="${story.storyList}" var="story">
		      <li style="margin-bottom: 10px; border: 3px solid pink;">
	            <div class="articles-v3__author">
	              <a href="#0" class="articles-v3__author-img">
	                <img src="${story.profile}" alt="Author picture" style="width: 50px; height: 50px;">
	              </a>
	        
	              <div class="text-component text-sm line-height-xs v-space-xs">
	                <p style="margin-bottom: 0px;"><a href="#0" class="articles-v3__author-name writer" rel="author" data-toggle="modal" data-target="#myModal" data-writer="${story.writer }" style="">${story.writer }</a></p>
	                <p class="color-contrast-medium"><time>${story.writeDateStr }</time>, &mdash; ${story.times } </p>
	              </div>
	            </div>
	            <hr style="border: 1.5px solid pink;">
		        <div class="grid gap-md items-start" style="text-align: center;">
		          <a href="/adaco/story/readStory?storyno=${story.storyno }" class="articles-v3__img col-6@md col-7@xl">
		            <figure class="media-wrapper">
		              <img src="${story.image }" alt="Image description">
		            </figure>
		          </a>
		    
		          <div class="col-6@md col-5@xl" style="  overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 90%; height: 250px;">
		            <div class="text-component">
		              <h2 class="articles-v3__headline"><a href="/adaco/story/readStory?storyno=${story.storyno }" style="color: #ff4757; font-weight: bold;">${story.title }</a></h2>
		              <br><br><br>
		              <p>${story.content }</p>
		            </div>
		    
		          </div>
		        </div>
		      </li>
		</c:forEach>
		</ul>
		<a href="#target" class = "btn btn-primary" id="top">상단으로</a>
		</div>
	</section>
	
	<sec:authorize access="hasRole('ROLE_SELLER')">
		<div class="form-group">
			<a href="/adaco/story/writeStory" class="btn btn-success">글쓰기</a>
		</div>
	</sec:authorize>
	
	
	<div class="modal fade" id="myModal" role="dialog" style="top:40%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" >
					<ul>
						<li id="read_by_id" data-dismiss='modal'>작가 작품보기</li>
						<sec:authorize access="hasRole('ROLE_USER')">
							<li id="write_memo">메보 보내기</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>