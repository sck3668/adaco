<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<style>
	#review_textarea{
	width: 600px;
	float: right;
}
	#reviews{
		overflow: auto;
		height: 450px;
	}
	#comments{
		overflow: auto;
		height: 450px;
	}
	.visual_img li {
	position: relative;
	display: inline;
}

	.visual_img img {
		width: 500px;
		height: 400px;	
	}
</style>
<script></script>
<sec:authorize access="isAuthenticated()">
	<script>
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		var isLogin = false;
		var loginId = undefined;
	</script>
</sec:authorize>
<script>
var art = ${art}
function loadImage() {
	var file = $("#sajin")[0].files[0];	
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin").val("");
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_profile").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}
function printReview(reviews){
	var $reviews = $("#reviews");
	$reviews.empty();
	$.each(reviews,function(i,review){
		var $review = $("<div>").appendTo($reviews)
		var $upper_div = $("<div>").appendTo($review)
		var $center_div=$("<div>").appendTo($review)
		var $lower_div=$("<div>").appendTo($review)
	  	$("<span></span>").text(review.username).appendTo($upper_div);
		$("<div>").html(review.content).css("display","inline-block").appendTo($center_div);
		$("<span>").text(review.writeDateStr).appendTo($lower_div);
		if(review.image!==null){
			$("<img>").attr("src",review.image).appendTo($lower_div);	
		}
// 		$("<span>").hmtl(review.star).appendTo($lower_div)
		 if(review.username===loginId){
				var btn = $("<button>").attr("class","delete_review").attr("data-username", review.username).attr("data-rno",review.rno)
				.text("삭제").appendTo($center_div).css("float","right")
			}
	})
	
}


function printComment(comments){
	var $comments = $("#comments");
	$comments.empty();
	$.each(comments,function(i,comment){
		var $comment = $("<div>").appendTo($comments)
		var $upper_div =$("<div>").appendTo($comment)
		var $center_div=$("<div>").appendTo($comment)
		var $lower_div =$("<div>").appendTo($comment)
		$("<span></span>").text(comment.username).appendTo($upper_div);
		$("<img>").attr("src",comment.profile).css("width","60px").css("height","60px").appendTo($center_div);
		$("<div>").html(comment.content).css("display","inline-block").appendTo($center_div);
		$("<span>").text(comment.writeDateStr).appendTo($lower_div);
		 if(comment.username===loginId){
			var btn = $("<button>").attr("class","delete_comment").attr("data-username", comment.username).attr("data-cno",comment.cno)
			.text("삭제").appendTo($center_div).css("float","right")
		}
	})
	
}	

function checkFavorite() {
	var $isFavorite = ${artPageByUser.isFavorite}
	if($isFavorite == true)
		$("#favorite").text("★즐겨찾기");
	else
		$("#favorite").text("☆즐겨찾기");
}

$(function() {
	printReview(art.reviews)
	printComment(art.artComments)
	
	 $("#sajin").on("change", loadImage); 


	//리뷰작성
	 $("#review_write").on("click",function(){
					
		const patt = /^.{5,1000}$/;
		var $content =$("#review_textarea").val();
		 if(patt.test($content)==false)
			 return false;
		 var $artno = $("#artno").val();
			var formData = new FormData();
			formData.append("content",$content);
			formData.append("artno",$artno);
  			if($("#sajin")[0].files[0]!=undefined){
			formData.append("sajin", $("#sajin")[0].files[0]);	
  			}
			formData.append("_csrf", "${_csrf.token}");
			formData.append("_method", "put");
			
				for (var key of formData.keys()) {
					  console.log(key);
					}
				for (var value of formData.values()) {
					  console.log(value);
					}
			$.ajax({
				url:"/adaco/artReview/review",
				method:"post",
				data:formData,
				processData:false,
				contentType:false
			}).done((r)=>{printReview(r),$("#review_textarea").val(""),location.reload(true)})
			  .fail((r)=>{console.log(r)})
})
// 		var parmas={
// 			_csrf:"${_csrf.token}",
// 			_method:"put",
// 			content:$("#review_textarea").val(),
// 			artno:$("#artno").val(),
// 		}
// 		console.log(parmas)
	//리뷰삭제하기	
	$("#reviews").on("click",".delete_review",function(){
		var $artno = $("#artno").val()
		//data -ano 속성의 값을 꺼낼떄
		//data("ano") ->넣은 값의 타입 그대로
		//attr("data-ano")->문자열
		var params={
				rno: $(this).data("rno"),
				artno :$artno,
 				_method:"delete",
 				_csrf:"${_csrf.token}"
		}
		console.log(params)
		$.ajax({
			url:"/adaco/artReview/reviewDelete",
			method:"post",
			data:params
		}).done((r)=>{printReview(r)})
		  .fail((r)=>{console.log(r)})
		
	})
	
	
	
	//댓글작성
	$("#comment_write").on("click",function(){
		var parmas = {
				artno :$("#artno").val(),
				content:$("#comment_textarea").val(),
				_csrf:"${_csrf.token}",
				_method:"put",
		}
		console.log(parmas)
		$.ajax({
			url:"/adaco/artcomment/write",
			method:"post",
			data:parmas
		}).done((r)=>{printComment(r),$("#comment_textarea").val("")})
		  .fail((r)=>{console.log(r)})
		
	})
	//댓글삭제
	$("#comments").on("click",".delete_comment",function(){
      
		var $artno = $("#artno").val()
		//data -ano 속성의 값을 꺼낼떄
		//data("ano") ->넣은 값의 타입 그대로
		//attr("data-ano")->문자열
		console.log(this)
		var params={
				cno: $(this).data("cno"),
				artno :$artno,
 				_method:"delete",
 				_csrf:"${_csrf.token}"
		}
		console.log(params)
		$.ajax({
			url:"/adaco/artcomment/delete",
			method:"post",
			data:params
			
		}).done((r)=>{printComment(r)})
		  .fail((r)=>{console.log(r)})
		
	})
	
	
	
	
	
	checkFavorite();
	var image_ul = document.querySelector(".visual_img");

	var imgCnt = 0;
	/* Animation: sliding setting */
	image_ul.querySelectorAll("li").forEach(()=> {
		imgCnt ++;
	});
	image_ul.style.width = (image_ul.offsetWidth * imgCnt) + "px";
	
	//console.log(imgCnt);
	//console.log(image_ul.style.width);
	slideShow(imgCnt);

	/* Animation: sliding */
	function slideShow(imgCnt) {
		var curIndex = 0;
		
		setInterval( () => {
			image_ul.style.transition = "transform 5s ease-out";
			image_ul.style.transform = "translate3d(-" + 414*(curIndex+1)+"px, 0px, 0px)";
			curIndex++;
			
			console.log(curIndex);
			if( curIndex === imgCnt-1 ) {
				curIndex = -1;
			}
		},5000);	
	};
	//즐겨찾기 추가
	$("#favorite").on("click",function() {
		var params ={
				_csrf:"${_csrf.token}",
				artno: ${artPageByUser.artno},
		}
		$.ajax({
			url:"/adaco/user/favoriteUpdate",
			method:"post",
			data:params
		}).done(()=>location.reload(true)).fail(()=>alert("알 수 없는 오류가 발생했습니다."))
	});
	
	// 구매하기
	$("#payment").on("click",function(){
		
		var params  ={
			_csrf: '${_csrf.token}',
			username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
// 			orderno : ${ordering.orderno},
// 			orderDate: '${ordering.orderDate}',
// 			shippingCharge : '${ordering.shippingCharge}',
// 			artName : ${ordering.artName},
			artno:${artPageByUser.artno},
			totalPrice:${artPageByUser.price},
			amount:1, 
			//optionName:'${artPageByUser.optionName}',
			optionName:$("#optionName").val(),
			optionValue:'${artPageByUser.optionValue}',
			optionStock:${artPageByUser.optionStock}, 
			optionPrice:'${artPageByUser.optionPrice}', 
		
		};
			$.ajax({
				url:"/adaco/order/ordering",
				method:"post",
				data:params,
				success:function(result) {
					alert("구매하기");
					location.href="/adaco/order/payment?artno="+result;
				}
			});
		}) ;
	
	//장바구니 추가
	$("#addBag").on("click",function() {
		var confirm_val = confirm("장바구니로 이동하시겠습니까?");
  		if(confirm_val) {
			var params = {
				_csrf : "${_csrf.token}",
				username: "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}",
				artno:${artPageByUser.artno},
				totalPrice:${artPageByUser.price},
				amount:1,
				//optionName:'${artPageByUser.optionName}',
				optionName:$("#optionName").val(),
				optionValue:'${artPageByUser.optionValue}',
				optionStock:${artPageByUser.optionStock},
				optionPrice:'${artPageByUser.optionPrice}',
			};
			$.ajax({
				url:"/adaco/bag/add",
				method:"post",
				data:params,
				success:function(result){
					if(result=="1") {
						location.href="/adaco/bag/view"
					}
					else
						alert("실패");
				},error:function(result) {
					console.log(result);
					alert("실패실패");
				}
			});
  		}
	});
	
});

// 수량 증가
$(function() {
	$("#plus").on("click", function(this){  

     var abc = $(this).prev().val();

     $(this).prev().val(parseInt(abc)+1);

      console.log(abc);

});
});
</script>
</head>
<body>
${art }	
<div>
	<div id="main">
		<div>
		  <div class="container_visual">
		    <!-- Promotion -->
		    <!-- 슬라이딩기능: 이미지 (type = 'th')를 순차적(javascript) 으로 노출 -->
		    <ul class="visual_img">
		      <c:forEach items="${image}" var="image">
		        <li><img src="${image.gyungro}"/></li>
		      </c:forEach>
		    </ul>
		  </div>
		  <span class="nxt_fix" style="display:none;"></span>
		</div>
		<div id="content">
			<h3><strong>${artPageByUser.artName }</strong></h3>
				<a href="http://localhost:8081/adaco/artist/shopPage">
					<button type="button" class = "btn btn-warning" id="shop" > <!--style="float:right"  -->
						상점
					</button>
				</a><br>
			<div id="content1">
			<table class = "table table-hover" style="text-align: center;">
				<tr>
					<td class = "price">가격 </td>
					<td>${artPageByUser.price } 원</td>
				</tr>
				<tr>
					<td class = "price">적립금</td>
					<td>${artPageByUser.accumulated } 원</td>
				</tr>
				<tr>
					<td class = "price">배송사</td>
					<td>${artPageByUser.courier }</td>
				</tr>
				<tr>
					<td class = "couri">배송비</td>
					<td>${artPageByUser.couriPrice } 원</td>
				</tr>
				<tr>
					<td class = "stock">남은 수량</td>
					<td>${artPageByUser.stock }</td>
				</tr>
				<tr>
					<td class = "option">옵션 선택</td>
					<td>
						<select id="selectOption">
							<option selected="selected" id="selected">${artPageByUser.optionName }을 선택하세요</option>
							<option value="${artPageByUser.optionName }" id="optionName">${artPageByUser.optionValue }</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class = "amount">수량 선택</td>
					<td>
						<div data-v-794fc8d2="" class="option_card__counter">
							<button data-v-794fc8d2="" type="button" class="ui_btn--mini" id="minus">
				                -
				            </button> 
           					 <input data-v-794fc8d2="" type="number" min="1" max="999" name="count" > 
           					<button data-v-794fc8d2="" type="button" class="ui_btn--mini" id="plus">
				                +
				            </button>
            			</div>
					</td>
				</tr>
			</table>
				<div>
			       	 					
<%-- 						<c:forEach items="${artPageByUser}" var="artPageByUser"> --%>
<!-- 							<select>	 -->
<%-- 								<strong class=option>${artPageByUser.optionName}</strong> --%>
<!-- 								<option>옵션명 선택</option> -->
<%-- 								<option>${artPageByUser.optionName}</option> --%>
<!-- 							</select> -->
<!-- 							<select> -->
<%-- 								<strong class=option>${artPageByUser.optionValue}</strong> --%>
<!-- 								<option>옵션값 선택</option> -->
<%-- 								<option>${artPageByUser.optionValue}</option> --%>
<!-- 							</select> -->
<%-- 						</c:forEach> --%>
					<br><br>
					<div>
						<span>총 결제 금액</span>
						<strong>${artPageByUser.price+artPageByUser.optionPrice+artPageByUser.couriPrice}</strong>
					</div>				
				</div>
			</div>
		</div>
	</div>
	<div id="button" style="text-align: center;">
		<button type="button" class = "btn btn-success" id="addBag">장바구니</button>
		<button type="button" class = "btn btn-primary" id="payment">구매하기</button>
		<button type="button" class = "btn btn-warning" id="favorite">☆즐겨찾기</button>

	</div>
	<br><br><br><br>
	<h3><strong>작품 소개</strong></h3>
	<br>
	<textarea style="width: 900px; min-height: 600px; text-align: center; border: none;" readonly="readonly">
		${artPageByUser.artDetail }
	</textarea>
<div class="form-group">
				<label for="review_textarea" id="review1">리뷰을 입력하세요</label>
				<textarea class="form-control" rows="5"	id="review_textarea" placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다" maxlength="1000">
				</textarea>
				<div>
					<img id="show_profile" height="240px"> <input type="hidden"
				name="_csrf" value="${_csrf.token }">
			<div class="form-group">
				<label for="sajin">프로필 사진</label> <input id="sajin" type="file"
					name="sajin" class="form-control"
					accept=".jpg,.jpeg,.png,.gif,.bmp">
			</div>	
			</div>
			</div>
			<button type="button" class="btn btn-info" id="review_write">리뷰작성</button>
		</div>
			<div id="reviews">
	</div>
	<!-- <div>
			<div class="form-group">
				<label for="review_textarea">리뷰을 입력하세요</label>
				<textarea class="form-control" rows="5"	id="review_textarea" placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다"></textarea>
			</div>
			<button type="button" class="btn btn-info" id="comment_write">댓글 작성</button>
			
	</div> -->
	<div>
			<div class="form-group">
				<label for="comment_textarea">댓글을 입력하세요</label>
				<textarea class="form-control" rows="5"	id="comment_textarea" placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다"></textarea>
				<input type="hidden" id="artno" value="${artPageByUser.artno }">
			</div>
			<button type="button" class="btn btn-info" id="comment_write">댓글 작성</button>
		</div>
		<div id="comments">
	</div>

</html>