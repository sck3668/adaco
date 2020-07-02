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
$(function() {
	var params ={
			username: "spring131",
	}
	console.log(params);
	$.ajax({
		url:"/adaco/bag/read",
		method:"get",
		data:params
	}).done((result)=>{
		alert("3333");
		bagList = result;
		printBagList(bagList);
	})
	
	$("#choiseDelete").on("click",function() {
		alert("ZZ");
		$("input[name=check]:checked").each(function() { 
			var test = $(this).val();
			console.log(test);
			alert("SS");
			var params = {
				artno:$(this).val()
			}
			console.log(params);
			alert("CCCC");
			$.ajax({
				url:"/adaco/bag/delete",
				data:params,
				method:"post",
			}).done((result)=>{
				alert("ok");
			})
		})
	});
});

function printBagList() {
	var $bagArea = $("#bagArea");
	$.each(bagList, function(idx,bag) {
		printBag(bag,$bagArea);
	})
}

function printBag(bag,dest) {
	var $div = $("#<div>").appendTo(dest);
	var $table = $("<table>").appendTo($div);
	var $tr = $("<tr>").appendTo($table);

	$("<td class='first'>").append($("<input>").attr("type","checkbox").attr("class","select").attr("data-artno", bag.artno)).appendTo($tr);
	$("<td class='second'>").text(bag.artno).appendTo($tr);
	$("<td class='second'>").text(bag.artno).appendTo($tr);
	$("<td class='second'>").text(bag.artno).appendTo($tr);
}


</script>
</head>
<body>
<div id="bagArea">
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
           <c:forEach items="${list1}" var="bag"> 
                <tr> 
                   <td>${bag.artno }</td> 
                  <%--  <td><img src="${bag.mainImg }"></td>  --%>
                   <td><a href="#"></a></td> 
                   <td>원</td> 
				  <td> 
				  	<input type="button" value="+" class="plus">
				  	<input type="text" value="1" class="count">
				  	<input type="button" value="-" class="minus">
                   </td>
					<td>원</td>
					<td>
						<input type="checkbox" name="check" class="check" value="${bag.artno }">
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