<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div, span {
		display: inline-block;
	}
	span {
		width: 175px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function() {
	// 3. 장바구니에 추가
	$(".cart").on("click", function() {
		var params = {
			artno: $(this).attr("data-artno"),
			_csrf: "${_csrf.token}"
		}
		$.ajax({ 
			url: "/acart/bag/add",
			method: "post",
			data: params,
		}).done(()=>{
			var choice = confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
			if(choice==true)	
				location.href = "/acart/bag/view"
		}).fail((xhr)=>{
			alert(xhr.responseText);
		})
	});
});
</script>
</head>
<body>
	<a href="/acart/cart/view">장바구니로</a><br>
	<c:forEach items="${list1}" var="product" varStatus="status">
		<img alt="art" src="${product.mainImg }">
		<div style="width: 176px; margin-right: 25px;">
			<div>
				<span>${product.price }원</span>
				<span style="font-size: 0.75em;">1개당 </span>
				<span style="font-size: 0.75em;"></span>
			</div>
			<div>
				<button class="cart" data-pno="">장바구니 담기</button>
			</div>
		</div>
		<c:if test="">
			<hr>
		</c:if>
	</c:forEach>
</body>
</html>