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
	
	
	$("<td class='first'>").append($("<input>").attr("type","checkbox").attr("class","check").attr("data-artno", bag.artno)).appendTo($tr);
	$("<td class='second'>").append($("<img>").attr("src", "").css("width", "135px")).appendTo($tr);
	$("<td class='third'>").text(bag.art.artName).appendTo($tr);

	var $td = $("<td class='fourth'>").appendTo($tr);
	
	var $optionArea = $("<div class='price' id='optionArea'>").appendTo($td);
	var optionList = bag.option;
	var $optionArea = $("#optionArea");
	$.each(optionList,function(idx,option) {
		printOption(option,$optionArea);
	})
	printOptionList()
	
	
	// 5번째 td에는 <button> 2개를 붙일 것임. 따라서 var $td로 저장
	var $td = $("<td class='fifth'>").appendTo($tr);
	$("<div class='price'>").text(bag.totalPrice+"원").appendTo($td);
	var $div = $("<div class='button_area'>").appendTo($td);
	$("<a href='#'>+</a>").attr("class","plus").attr("data-artno", bag.artno).appendTo($div);
	$("<span>").text(bag.amount).appendTo($div);
	$("<a href='#'>-</a>").attr("class","minus").attr("data-artno", bag.artno).appendTo($div);

	$("<td class='six'>").text(bag.totalPrice).appendTo($tr);
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

function printOption(option,dest) {
	$("<span>").text(option.optionName).appendTo(dest);
	$("<span>").text(":").appendTo(dest);
	$("<span>").text(option.optionValue).appendTo(dest);
}

function printOptionList() {
//	var $optionArea = $("#optionArea");
//	var optionList = bag;
//	$.each(optionList,function(idx,option) {
//		printOption(option,$optionArea);
//	})
}




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
		printOptionList();
	})
	
	
	var isChoice = false;
	// 전체선택 /해제
	$("#checkAll").prop("checked", false);
	
	$("#checkAll").on("click", function() {
		isChoice = !isChoice;
		$(".check").prop("checked", isChoice);
	});
	
	
	//수량 증가
	$("#bagArea").on("click", ".plus", function(e) {
		$.ajax({
			url:"/adaco/bag/checkStock?artno="+$(this).attr("data-artno")
			}).then(()=>{
				var params = {
						_csrf:"${_csrf.token}",
						artno:$(this).attr("data-artno"),
						isIncrese:"1"
				}
				return $.ajax({
					url:"/adaco/bag/change",
					data:params,
					method:"post"
				})
			}).then((bag)=>{
				$(this).next().text(bag.amount);
				$(this).parent().prev().text(bag.totalPrice + "원");
			}).fail(()=>{
				alert("실패");
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
			printBagList();
		})
		alert("마지막");
	})
	// 주문하기
	$("#order").on("click",function() {
		var ar=[];
		$(".check").each(function(idx) {
			if($(this).prop("checked")) {
				ar.push($(this).data("orderno"));
			}
		})
		alert("찍어보자~");
		var params = {
				_csrf:"${_csrf.token}",
				_method:"get",
				orders:JSON.stringify(ar)
		}
		alert("또 찍어봐");
		$.ajax({
			url:"/adaco/order/payment",
			data:params,
			method:"get"
		}).done((result)=>{
			alert("OK");
			orders = result;
			printOrderList();
		})
		alert("End")
	})
		$ajax({
			url=:"/adaco/order/payment]"
			data:params,
			method:"get",
		}).doen((result)=>{
			aflert("얼ㄹㄹㄹ럿")
		orsers = result;
			printOrders();
		})
		})
	
	
	// 선택한 상품 구매
	$("#buyAll").on("click",function() {
		var ar = [];
		$(".check").each(function(idx) {
			if($(this).prop("checked")) {
				var countStr = $(this).parent().next().next().next().next().children().find("span").text();
				var count = parseInt(countStr);
				var obj = {
					artno : $(this).data("artno"),
					count : count
				};
				ar.push(obj);
			}
			
		});
		var $form = $("<form>").attr("action","/adaco/orderdetail/payment").attr("method","get");
		$("<input>").attr("type","hidden").attr("name","json").val(JSON.stringify(ar)).appendTo($form);
		$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
		$form.appendTo($("body")).submit();
	});
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
			<th>선택</th><th>이미지</th><th>상품명</th><th>옵션</th><th>수량</th><th>가격</th>
		</tr>
	</table>
	<div id="bagArea">
	</div>
	<div id="button_area">
		<input type="checkbox" id="checkAll">전체 선택 
		<button id="choiseDelete">선택삭제</button>
		<button type="button" id="order">주문하기</button>
	</div>
  <%--  <div>
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
   </div> --%>
</body>
</html>