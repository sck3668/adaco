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
	
	table {
		width: 800px;
		border-collapse: collapse;
		border: 1px solid lightgray;
		text-align: center;
	}
	.first { width: 40px; }
	.second { width: 160px;  }
	.third { widht: 160px; font-size: 0.8em; }
	.fourth {width: 160px;}
	.fifth { width: 240px; }
	.six {width:40px;}
	.button_area a, .button_area span { 
		font-size: 0.8em; text-align: center;
		height: 30px; line-height: 30px;
	}
	.price { padding-left: 15px; }
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

function printBag(bag,dest) {
	var $div = $("<div>").appendTo(dest);
	var $table = $("<table>").appendTo($div);
	var $tr = $("<tr>").appendTo($table);
	var bag = bag;
	
	$("<td class='first'>").append($("<input>").attr("type","checkbox").attr("class","check").attr("name","check").attr("data-artno", bag.artno)).appendTo($tr);
	$("<td class='second'>").append($("<img>").attr("src", "bag.art.mainImg").css("width", "135px")).appendTo($tr);
	$("<td class='third'>").text(bag.art.artName).appendTo($tr);

	var $td = $("<td class='fourth'>").appendTo($tr);
	$("<span>").text(bag.optionName).appendTo($td);
	$("<span>").text(":").appendTo($td);
	$("<span>").text(bag.optionValue).appendTo($td);
// 	var $optionArea = $("<div class='price' id='optionArea'>").appendTo($td);
// 	var optionList = bag.option;
// 	var $optionArea = $("#optionArea");
// 	$.each(optionList,function(idx,option) {
// 		printOption(option,$optionArea);
// 	})
// 	printOptionList()
	
	
	// 5번째 td에는 <button> 2개를 붙일 것임. 따라서 var $td로 저장
	var $td = $("<td class='fifth'>").appendTo($tr);
	$("<div class='price'>").text(bag.totalPrice+"원").appendTo($td);
	var $div = $("<div class='button_area'>").appendTo($td);
	$("<a href='#.'>+</a>").attr("class","plus").attr("data-artno", bag.artno).appendTo($div);
	$("<span>").text(bag.amount).appendTo($div);
	$("<a href='#.'>-</a>").attr("class","minus").attr("data-artno", bag.artno).appendTo($div);

	$("<td class='six'>").text(bag.art.price).appendTo($tr);
	$("<input>").attr("class","artno").attr("type","hidden").attr("id","artno").val(bag.artno).appendTo(dest);
	
// 	var $total = $("#total");
// 		var $div = $("<div id='total'>").appendTo($total);
// 	$("<span>").text(bag.lastPrice).appendTo($total);
	}
	


//1-2. 장바구니 전체 출력함수 - printCart()를 호출해 각 장바구니를 출력
function printBagList() {
	// 장바구니 출력 영역을 선택한 다음 내용을 제거
	var $bagArea = $("#bagArea");
	$bagArea.empty();


	// 장바구니 목록이 비어있다면 empty_cart.jpg 출력하고 선택삭제, 주문하기 버튼 영역을 안보이게
	/* if(bagList.length==0) {
		$("<img>").attr("src","/bag/img/empty_bag.jpg").appendTo($bagArea);
		$("#button_area").hide();
		return;
	}  */
	// 장바구니에 담긴 각 상품에 대해 printCart()를 호출해 출력
	$.each(bagList, function(idx, bag) {
		printBag(bag, $bagArea);
	});
}

// function printOption(option,dest) {
// 	$("<span>").text(option.optionName).appendTo(dest);
// 	$("<span>").text(":").appendTo(dest);
// 	$("<span>").text(option.optionValue).appendTo(dest);
// 	$("<input>").attr("class","optionValue").attr("id","optionValue").val(option.optionValue).appendTo(dest);
// 	$("<input>").attr("class","optionName").attr("id","optionName").val(option.optionName).appendTo(dest);
// 	$("<input>").attr("class","optionStock").attr("id","optionStock").val(option.optionStock).appendTo(dest);
// 	$("<input>").attr("class","optionPrice").attr("id","optionPrice").val(option.optionPrice).appendTo(dest);
	
// 	$("<input type='text' id='optionName' name='optionName' data-optionName='option.optionName'>")
// 	$("<input type='hidden' id='optionValue' name='optionValue' data-optionValue='option.optionValue' value='option.optionValue'>")
// 	$("<input type='hidden' id='optionStock' name='optionStock' data-optionStock='bag.optionStock' value='bag.optionStock'>")
// 	$("<input type='hidden' id='optionPrice' name='optionPrice' data-optionPrice='bag.optionPrice' value='bag.optionPrice'>")

// }

// function printOptionList() {
// //	var $optionArea = $("#optionArea");
// //	var optionList = bag;
// //	$.each(optionList,function(idx,option) {
// //		printOption(option,$optionArea);
// //	})
// }




$(function() {

	
	$("#check_all").prop("checked", false);
	
	var parmas ={
			_csrf:"${_csrf.token}",
	}
	
	$.ajax({
		url: "/adaco/bag/list2",
		method: "get",
		data:parmas
	}).done((result)=>{ 
		bagList = result;
		printBagList();
		
		//printOptionList();
	})
	
	
	var isChoice = false;
	// 전체선택 /해제
	$("#checkAll").prop("checked", false);
	
	$("#checkAll").on("click", function() {
		isChoice = !isChoice;
		$(".check").prop("checked", isChoice);
	});
	
	// 수량 증가
	$("#bagArea").on("click", ".plus", function(e) {
		var params = {
				_csrf:"${_csrf.token}",
				artno:$(this).attr("data-artno")	
		}
		$.ajax({
			url:"/adaco/bag/checkStock?artno="+$(this).attr("data-artno"),
			data:params,
			method:"get"
			}).then((result)=>{
				if(result==false) {
					alert("최대수량입니다");
				} else {
				var params = {
						_csrf:"${_csrf.token}",
						artno:$(this).attr("data-artno"),
						isIncrese:"1"
				}
				return $.ajax({
					url:"/adaco/bag/change",
					data:params,
					method:"post"
				}).then((bag)=>{
					$(this).next().text(bag.amount);
					$(this).parent().prev().text(bag.totalPrice + "원");
				}).fail(()=>{
				})
			}
			}).then((bag)=>{
				$(this).next().text(bag.amount);
				$(this).parent().prev().text(bag.totalPrice + "원");
			}).fail(()=>{
		})
			})
	
	//수량 감소
	$("#bagArea").on("click", ".minus", function(e) {
		var count = parseInt($(this).prev().text());
		if(count<=1)
			return;
		
				var params = {
						_csrf:"${_csrf.token}",
						artno:$(this).attr("data-artno"),
						isIncrese:"0"
				}
				$.ajax({
					url:"/adaco/bag/change",
					data:params,
					method:"post"
				}).then((bag)=>{
				$(this).parent().prev().text(bag.totalPrice + "원")
				$(this).prev().text(bag.amount);
			}).fail(()=>{
				alert("실팽");
			})
	})
		/* 
		var params = {
			_csrf: "${_csrf.token}}",
			_method: "patch",
			pno: $(this).attr("data-pno"),
			isIncrease: "0"
		}
		$.ajax({
			url:"/acart/cart/change",
			data: params,
			method: "post",
		}).done((cart)=>{
			$(this).parent().prev().text(cart.jumunMoney + "원")
			$(this).prev().text(cart.count);
		}).fail((result)=>{ console.log("fail")}) */
			
			
			

	//선택한 상품 삭제
	$("#choiseDelete").on("click",function() {
		var ar=[];
		var cnt = $("input[name='check']:checked").length;
		 if(cnt == 0){
	            alert("선택된 작품이 없습니다.");
	            return;
		 }
		
		$(".check").each(function(idx) {
			if($(this).prop("checked")) {
				ar.push($(this).data("artno"));
			}
		});
		
		var params = {
				_csrf:"${_csrf.token}",
				_method:"delete",
				artnos:JSON.stringify(ar)
		}
		$.ajax({
			url:"/adaco/bag/choiseDelete",
			data:params,
			method:"post",
		}).done((result)=>{
			bagList = result;
			printBagList();
		})
	})
	
	
	//선택한 작품 구매
	$("#order").on("click",function() {
		var ar=[];
		
		var cnt = $("input[name='check']:checked").length;
		 if(cnt == 0){
	            alert("선택된 작품이 없습니다.");
	            return;
		 }
		 else {
		$(".check").each(function(idx) {
			if($(this).prop("checked")) {
				ar.push($(this).data("artno"));
			}
		});
		
		var params = {
				username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
				_csrf:"${_csrf.token}",
				_method:"post",
				artnos:JSON.stringify(ar),
		}
		$.ajax({
			url:"/adaco/bag/ordering",
			data:params,
			method:"post",
			success:function(result) {
				ordernos=JSON.stringify(result);
				var params1 ={
						ordernos:ordernos,
						_csrf:"${_csrf.token}"
				}
				var $form = $("<form>").attr("action","/adaco/order/bagPayment").attr("method","get");
				$("<input>").attr("type","hidden").attr("name","ordernos").val(ordernos).appendTo($form);
				$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
				$form.appendTo($("body")).submit(); 
			}
		})
		}
	})
	
	
	
	// 주문 버튼을 클릭하면 해당 상품을 구입 후 이동
// 	$("#cart_area").on("click", ".buy", function() {
// 		var $form = $("<form>").attr("action","/acart/order/buy").attr("method","post");
// 		$("<input>").attr("type","hidden").attr("name","pno").val($(this).data("pno")).appendTo($form);
// 		var countStr = $(this).parent().prev().children().find("span").text();
// 		var count = parseInt(countStr);
// 		$("<input>").attr("type","hidden").attr("name","count").val(count).appendTo($form);
// 		$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
// 		$form.appendTo($("body")).submit();
// 	});
		
//장바구니에서 주문 버튼 클릭 후 경제창 이동	
//	$("#order").on("click",function() {
// 		var params  ={
// 				_csrf: '${_csrf.token}',
// 				username: '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
// 				artno:${bag.artno},
// 				totalPrice:${artPageByUser.price},
// 				amount:1, 
// 				optionName:'${artPageByUser.optionName}',
// 				optionValue:'${artPageByUser.optionValue}',
// 				optionStock:${artPageByUser.optionStock}, 
// 				optionPrice:'${artPageByUser.optionPrice}', 
			
// 			};
// 		$.ajax({
// 			url:"/adaco/order/ordering",
// 			method:"post",
// 			data:params,
// 			success:function(result) {
// 				alert("구매하기");
// 				location.href="/adaco/order/payment?artno="+result;
// 			}
// 		});
		
//	})
	
	
// 	// 주문하기
// 	$("#order").on("click",function() {
// 		var ar=[];
// 		$(".check").each(function(idx) {
// 			if($(this).prop("checked")) {
// 				ar.push($(this).data("orderno"));
// 			}
// 		})
// 		alert("찍어보자~");
// 		var params = {
// 				_csrf:"${_csrf.token}",
// 				orderno : $(this).attr("data-orderno"),
// 				username: "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}",
// // 				totalPrice: ${orders.price},
// 				_method: "get",
// 				orders:JSON.stringify(ar)
// 		}
// 		alert("또 찍어봐");
// 		$.ajax({
// 			url:"/adaco/order/payment",
// 			data:params,
// 			method:"post"
// 		}).done((result)=>{
// 			alert("OK");
// 			orders = result;
// 			printOrderList();
// 		})
// 		alert("End")
// 	})

// 	// 선택한 상품 구매
// 	$("#buyAll").on("click",function() {
// 		var ar = [];
// 		$(".check").each(function(idx) {
// 			if($(this).prop("checked")) {
// 				var countStr = $(this).parent().next().next().next().next().children().find("span").text();
// 				var count = parseInt(countStr);
// 				var obj = {
// 					artno : $(this).data("artno"),
// 					count : count
// 				};
// 				ar.push(obj);
// 			}
// 		});
// 		var $form = $("<form>").attr("action","/adaco/orderdetail/payment").attr("method","get");
// 		$("<input>").attr("type","hidden").attr("name","json").val(JSON.stringify(ar)).appendTo($form);
// 		$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
// 		$form.appendTo($("body")).submit();
// 	});
})
</script>
</head>

<body>
	<table style="width:800px;">
	<colgroup>
      		<col width="5%">
      		<col width="20%">
      		<col width="20%">
      		<col width="20%">
      		<col width="30%">
      		<col width="5%">
      	</colgroup>
		<tr>
			<th>선택</th><th>이미지</th><th>상품명</th><th>옵션</th><th>수량 및 총가격</th><th>작품가격</th>
		</tr>
	</table>
	<div id="bagArea">
	</div><br>
	<div id="total">
	</div>
	<div id="button_area">
		<input type="checkbox" id="checkAll">전체 선택 
		<button id="choiseDelete">선택삭제</button>
		<button type="button" id="order">주문하기</button>
	</div>
</body>
</html>