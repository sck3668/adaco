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
	.number a, .number span { 
	text-align: center; 
	font-size: 0.8em; 
	height: 20px; 
	width: 30px; 
	line-height: 20px;
	border: 0.8px solid gray; 
	display: inline-block;
	}
	.number a {  
	text-decoration: none; 
	color: black; 
	border-radius: 2px; 
	 }
	.number span{
	 
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
		$("<button>").css('background-color', '#f44336').attr('class','report_comment').attr("data-username",comment.username).attr("data-cno",comment.cno).text("신고").appendTo($lower_div).css("float","right");
		 if(comment.username===loginId){
			var btn = $("<button>").attr("class","delete_comment").attr("data-username", comment.username).attr("data-cno",comment.cno)
			.text("삭제").appendTo($center_div).css("float","right")
		}
	})
}	
/* <div id="comments">
	<div id="upper_div">
		<span>
		</span>
	</div>
	<div id="center_div">
		<img src="comment.profile">
		<div>
		</div>
	</div>
	<div id="lower_div">
		<span>
		</span
	</div>
</div>

 */

function checkFavorite() {
	 var $isFavorite = '${artPageByUser.isFavorite}';
	 if ( typeof $isFavorite == "undefined" || $isFavorite == null || $isFavorite == "" ){
		return false;
	 } else {
		if($isFavorite == true)
			$("#favorite").text("★즐겨찾기");
		else
			$("#favorite").text("☆즐겨찾기");
	 }
}

$(function() {
	printReview(art.reviews)
	printComment(art.artComments)
	
	 $("#sajin").on("change", loadImage); 

	//신고글기능
	$("#comments").on("click",".report_comment",function(){
		var $artno = $("#artno").val()
		var parmas={
				_method:"patch",
				_csrf:"${_csrf.token}",
				cno:$(this).data("cno"),
				artno:$artno
		}
		console.log(parmas)
		$.ajax({
			data:parmas,
			method:"post",
			url:"/adaco/user/commentReport"
		}).done((r)=>{ 
			Swal.fire('신고하시겠습니까?')
		}).fail((r)=>{ 
			Swal.fire('이미 신고된 댓글입니다.')})
	      
	})
	
	
	//리뷰작성
	 $("#review_write").on("click",function(){
		var $artno = $("#artno").val()
		var params = {
				_csrf:"${_csrf.token}",
				artName:"${artPageByUser.artName}"
		};
		console.log(params);
		 $.ajax({
				url:"/adaco/art/paymentCheck",
				data:params,
				method:"get",
				success:function(result) {
					//작품을 구매한 경우 result = true
					if(result==true) {
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
					} else {
						Swal.fire('리뷰는 구매한 사람만 작성이 가능합니다.');
					}
				} 
			})		
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
		const patt = /^.{1,1000}$/;
		var $content =$("#comment_textarea").val();
		 if(patt.test($content)==false)
			 return false;
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
		if(typeof loginId == "undefined") {
			Swal.fire(
					  '로그인이 필요합니다.',
					  '',
					  'warning'
					)
			return false;
		}
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
		if(typeof loginId == "undefined") {
			Swal.fire(
					  '로그인이 필요합니다.',
					  '',
					  'warning'
					)
			return false;
		}
		var $amount = $("#numberUpDown").val(); 
		var params  ={
			_csrf: '${_csrf.token}',
			username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
// 			orderno : ${ordering.orderno},
// 			orderDate: '${ordering.orderDate}',
// 			shippingCharge : '${ordering.shippingCharge}',
// 			artName : ${ordering.artName},
			artno:${artPageByUser.artno},
			totalPrice:${artPageByUser.price},
			amount:$('#numberUpDown').text(),
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
					location.href="/adaco/order/payment?artno="+result;
				}
			});
		}) ;
	
	//장바구니 추가
	$("#addBag").on("click",function() {
		// 총 금액
		console.log($("#totalPrice").text());
		if(typeof loginId == "undefined") {
			Swal.fire(
					  '로그인이 필요합니다.',
					  '',
					  'warning'
					)
			return false;
		}
		var confirm_val = confirm("장바구니로 이동하시겠습니까?");
  		if(confirm_val) {
  			var $amount = $("#numberUpDown").val(); 
			var params = {
				_csrf : "${_csrf.token}",
				username: "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}",
				artno:${artPageByUser.artno},
				totalPrice:${artPageByUser.price},
				amount:$('#numberUpDown').text(),
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


//1. 작품 상세(고객용)에서 수량 카운트는 되나 실제로 적용 안됨
// 수량 증가 감소
$(function(){
	$('#decreaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
			Swal.fire(
					  '한 개 이상 구매가 가능합니다.',
					  '<a href>도움이 필요하신가요?<a>',
					  'warning'
					)
			num =1;
		}
		$('#numberUpDown').text(num);
	 	$("#totalPrice").text($('#numberUpDown').text()*${artPageByUser.price+artPageByUser.optionPrice}+${artPageByUser.couriPrice});
	});
	
	$('#increaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat,10);
		num++;
		if(num>${artPageByUser.stock}) {
			Swal.fire(
					  '남은 수량을 확인해주세요.',
					  '<a href>도움이 필요하신가요?<a>',
					  'warning'
					)
			num=${artPageByUser.stock};
		}
		$('#numberUpDown').text(num);
		// 수량 변경시 적용되는 총 금액
	 	$("#totalPrice").text($('#numberUpDown').text()*${artPageByUser.price+artPageByUser.optionPrice}+${artPageByUser.couriPrice});
	});
	// 기본 수량 1일 때의 총 금액
 	$("#totalPrice").text($('#numberUpDown').text()*${artPageByUser.price+artPageByUser.optionPrice}+${artPageByUser.couriPrice});
});

</script>
</head>
<body>
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
			<h3><strong>${artPageByUser.artName }</strong><a href="http://localhost:8081/adaco/artist/shopPageByUser?artno=${artPageByUser.artno }" style="text-decoration: none;">
					<button type="button" class = "btn btn-outline-info" id="shop" style="margin-bottom: 10px; " > <!--style="float:right"  -->
						상점 구경하러가기
					</button>
				</a></h3>
				<br>
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
						<select id="selectOption" >
							<option selected="selected" id="selected">${artPageByUser.optionName }을 선택하세요</option>
							<option value="${artPageByUser.optionName }" id="optionName">${artPageByUser.optionValue }</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class = "amount">수량 선택</td>
					<td>
<!-- 						<div data-v-794fc8d2="" class="option_card__counter"> -->
<!-- 							<button data-v-794fc8d2="" type="button" class="ui_btn--mini" id="minus"> -->
<!-- 				                - -->
<!-- 				            </button>  -->
<!--            					 <input data-v-794fc8d2="" type="number" min="1" max="999" name="count" style="text-align: center;">   -->
<!--            					<button data-v-794fc8d2="" type="button" class="ui_btn--mini" id="plus"> -->
<!-- 				                + -->
<!-- 				            </button> -->
<!--             			</div> -->

						<div class="number">
						    <a href="#" id="decreaseQuantity" data-artno="${artPageByUser.artno}" style="text-decoration: none; border:0 solid black;" ><i class="far fa-minus-square"></i></a>
							<span id="numberUpDown" style="width: 100px; height:23px;">1</span>
							<a href="#" id="increaseQuantity" data-artno="${artPageByUser.artno}" style="text-decoration: none; border:0 solid black; "><i class="fas fa-plus-square" ></i></a>
						
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
						<strong id="totalPrice">${artPageByUser.price+artPageByUser.optionPrice+artPageByUser.couriPrice}</strong>
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
			ㅇㄴㅁㄴㅁㅇㅁㄴㅇㅁㅇㄴ
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