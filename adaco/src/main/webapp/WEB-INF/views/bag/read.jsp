<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <title>Insert title here</title>
<style>
	td {
	text-align: center; 
	}
	#plus{
	text-align: center; display: inline-block;
	}
	#minus{
	text-align: center; display: inline-block;
	}
	#count{
	text-align: center;  width:"3px";
	}
</style>
<script>
/*$(function() {
	$("#choiseDelete").on("click",function() {
		alert("ZZ");
		$("input[name=check]:checked").each(function() { 
			var test = $(this).val();
		})
		console.log(test);
		alert("SS");
		
	});
});*/

$(function() {
	var isChoice = false;
	// 전체선택 /해제
	$("#checkAll").prop("checked", false);
	
	$("#checkAll").on("click", function() {
		isChoice = !isChoice;
		$(".check").prop("checked", isChoice);
	});
	
	
	
	//수량 증가
	$(".plus").on("click",function(){
		$artno = $("#artno").val();
		$artno1 =$(this).prev().val();
		console.log($artno);
		console.log($artno1);

		console.log("============");
		console.log($(this).next().val);
		
		$.ajax({
			url:"/adaco/bag/checkStock?artno="+$artno1
			}).then(()=>{
				var params = {
						_csrf:"${_csrf.token}",
						artno:$artno1,
						isIncrese:"1"
				}
				return $.ajax({
					url:"/adaco/bag/change",
					data:params,
					method:"post"
				})
			}).then((bag)=>{
				console.log(bag.amount);
				$(this).next().val("");
				var amount = bag.amount;
				$(this).next().val(bag.amount);
			}).fail(()=>{
				alert("실패");
			})
		
	})
	
	//수량 감소
	$(".minus").on("click",function(){
		$artno = $("#artno").val();
		$artno1 =$(this).next().val();
		console.log($artno);
		console.log($artno1);
		
		console.log($(this).prev().val);
		
		$.ajax({
			url:"/adaco/bag/checkStock?artno="+$artno1
			}).then(()=>{
				var params = {
						_csrf:"${_csrf.token}",
						artno:$artno1,
						isIncrese:"0"
				}
				console.log(params);
				return $.ajax({
					url:"/adaco/bag/change",
					data:params,
					method:"post"
				})
			}).then((bag)=>{
				console.log(bag.amount);
				$(this).prev().val("");
				var amount = bag.amount;
				$(this).prev().val(bag.amount);
			}).fail(()=>{
				alert("실팽");
			})
	})

	//선택한 상품 삭제
	$("#choiseDelete").on("click",function() {
		var ar=[];
		$(".check").each(function(idx) {
			if($(this).prop("checked")) {
				ar.push($(this).data("artno"));
			}
		});
		console.log(ar);
		alert("arr====");
		var params = {
				_csrf:"${_csrf.token}",
				_method:"delete",
				username :'sck3668',
				artnos:JSON.stringify(ar)
		}
		console.log(params);
		alert("000");
		$.ajax({
			url:"/adaco/bag/choiseDelete",
			data:params,
			method:"post",
		}).done((result)=>{
			alert("성공");
			bagList = result;
		})
		alert("마지막");
	})
})
</script>
</head>
<body>
${bagList }
	<div id="bag_area">
	</div>
   <div>
   <h1>장바구니</h1>
      <table class="table table-hover">
      	<colgroup>
      		<col width="10%">
      		<col width="10%">
      		<col width="10%">
      		<col width="10%">
      		<col width="20%">
      		<col width="10%">
      		<col width="10%">
      	</colgroup>
         <thead>
         <tr>
            <th>번호</th><th>이미지</th><th>상품명</th><th>옵션 값</th><th>수량</th><th>주문금액</th><th>선택</th>
         </tr>
         </thead>
         <tbody>
           <c:forEach items="${bagList}" var="bag"> 
                <tr> 
                   <td>${bag.art.artno }
                   		<input type="hidden" id="artno" value="${bag.art.artno}">
                   </td> 
                   <td><a href="#"></a></td> 
                   <td>${bag.art.artName }</td> 
                   <td>
                   		<c:forEach items="${bag.option }" var="option">
								${option.optionName }:
                   				${option.optionValue}<hr>
                   		</c:forEach>
                   </td>
				  <td> 
				  	<input type="hidden" id="artno" value="${bag.art.artno}">
				  	<input type="button" value="+" class="plus" name="plus">
				  	<input type="text" value="${bag.amount }" class="amount" name="amount">
				  	<input type="button" value="-" class="minus" name="minus">
				  	<input type="hidden" id="artno" value="${bag.art.artno}">
                   </td>
					<td>${bag.art.price }원</td>
					<td>
						<input type="checkbox" name="check" class="check" data-artno="${bag.artno}" value="${bag.artno }">
						<input type="hidden" id="artno" value="${bag.art.artno}">
					</td>
            	</tr> 
            </c:forEach>
            <tr>
            	<td>
            		<input type="checkbox" id="checkAll">전체선택
						<button id="deleteAll">전체삭제</button>
						<button type="button" id="OrderAll">주문하기</button>
            	</td>
            </tr>
         </tbody>
       </table>
      <button id="choiseDelete" style="float:right;">선택 삭제</button>
   </div>
</body>
</html>