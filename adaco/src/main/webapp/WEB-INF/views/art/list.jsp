<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 작품 목록</title>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
		#categoryChoice{
		width:200px;
		}
		.search-group{
		left: 800px; 	
		}
		#deleteOne{
		border:0;
		outline:0;
		background-color: #FFFFFF;
		opacity: 0.5; 
		}
		#readArt{
		border:0;
		outline:0;
		background-color: #FFFFFF;
		opacity: 0.5; 
		}
 </style> 
<sec:authorize access="isAuthenticated()">
	<script>
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>

<script>
	//카테고리로 작품 찾기
	$(function(){
		$("#search").on("click", function(){
			var category = $("#category").val();
			location.href = "/adaco/art/listByArtist?category="+category;
		});
	});	
	
	// 카테고리 선택해서 작품 찾기
	$(function() {
	 $("#categoryChoice").on("change", function() {
	     var choice = $("#categoryChoice").val();
	     if(choice!="직접 입력") {
	        $("#category").val(choice);
	        $("#category").prop("disabled", true);
			 }
	     })
	  });
	
	// '작품 등록'클릭 시 작품 등록 화면으로 이동
	$(function() {
		$("#write_Btn").on("click", function() {
			location.href="/adaco/art/write";
		});
		
	// 전체 체크박스 선택 및 선택해제	
		$("#check_all").on("click", function(){
		 var chk = $("#check_all").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
		});
	
	// 전체 체크박스 선택 후  개별 체크박스 선택 시 전체 체크박스 해제
		$(".chBox").on("click",function(){
			  $("#check_all").prop("checked", false);
			 });
	
	// 삭제버튼을 클릭하면 해당 작품 삭제
		$(".deleteOne").on("click", function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");
	  		if(confirm_val) {
			var params = {
				_csrf: "${_csrf.token}",
				_method: "delete",
				artno: $(this).attr("data-artno")	
			}
			console.log(params);
			$.ajax({
				url:"/adaco/art/delete",
				data: params,
				method: "post"
			}).done((result)=>{
				alert("삭제처리 되었습니다.")
				location.reload(true);
			}).fail((result)=>alert("삭제실패"))
			return;
		}
		})
	
	
	// 선택한 작품 삭제, 선택작품 없을 시 "선택된 작품이 없습니다" 팝업 출력
	$("#delete_Btn").click(function(){
		var cnt = $("input[name='chBox']:checked").length;
        if(cnt == 0){
        	Swal.fire(
        			  '선택된 작품이없습니다',
        			  '',
        			  'warning'
        			)
            return;
        } else{
	  	var confirm_val = confirm("정말 삭제하시겠습니까?");
	  		if(confirm_val) {
			  var ar = [];
				$(".chBox").each(function(idx) {
					if($(this).prop("checked")) {
						ar.push($(this).data("artno"));
					}
				});
				var params = {
					_csrf: "${_csrf.token}",
					_method: "delete",
					artnos: JSON.stringify(ar),
					pageno:${artPage.pageno}
				}
 				console.log(params)
				$.ajax({
					url:"/adaco/art/deleteChoice",
					data: params,
					method: "post",
				}).done((result)=>{
					alert("삭제처리 되었습니다.");
					location.reload(true);
		   		}).fail((result)=>{
		  			alert("삭제 실패")
		   			location.reload(true);
					return;
		  		})
			}
        }
 		});
	
	});
</script>

</head>
<body>
<%-- ${artPage } --%>
<%--  	${artPage.artList }  --%>
 	<h5>작품 목록</h5>	
	<div>
		<hr> 작품 검색&nbsp;
			<input type="hidden" name = "category" id ="category"> 
			<select id = "categoryChoice" class="custom-select">
				<option selected="selected">카테고리 선택</option>
				<option value="악세사리">악세사리</option>
				<option value="인테리어">인테리어</option>
				<option value="공예">공예</option>
				<option value="기타">기타</option>
			</select>
			<button type="button" id="search" class="btn btn-success" >검색</button>
		<hr>
	</div>
	
	<div class="form-group">
		<button type="button" id="delete_Btn" class="btn btn-primary" >
			선택 삭제
		</button>
		<button type="button" id="write_Btn" class="btn btn-warning" >
			작품 등록
		</button>
	</div>
	<div>
		<table class="table">
			<colgroup>
				<col width="5%">
				<col width="15%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="check_all" id="check_all"></th>
					<th>작품 번호</th>
					<th>카테고리</th>
					<th>작품 이미지</th>
					<th>작품명</th>
					<th>가격</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach items="${artPage.artList}" var="art">
					<tr>
						<td style="vertical-align: middle;"><input type="checkbox" name="chBox" class="chBox" data-artno="${art.artno}" /></td>
						<td style="vertical-align: middle;">${art.artno}</td>
						<td style="vertical-align: middle;">${art.category}</td>
						<td style="vertical-align: middle;"><a href="/adaco/art/readByArtist?artno=${art.artno}"><img src="${art.mainImg }" width="100px" height="100px"></a></td>
						<td style="vertical-align: middle;">${art.artName}</td>
						<td style="vertical-align: middle;">${art.price}</td>
						<td style="vertical-align: middle;">
							<button type="button" class="deleteOne" id="deleteOne" data-artno="${art.artno}">
								<i class="far fa-trash-alt"></i>
							</button> /
							<a href="/adaco/art/readByArtist?artno=${art.artno}">
								<button type="button" id="readArt" data-artno="${art.artno}">
									<i class="far fa-edit"></i>
								</button>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align: center;">
		<ul class="pagination justify-content-center">
			<c:if test="${artPage.prev==true}">
				<li><a href="/adaco/art/listByArtist?category=${artPage.search }&pageno=${artPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${artPage.startPage}" end="${artPage.endPage}" var="i">
				<c:choose>
					<c:when test="${artPage.pageno eq i }">
						<li class="active">
						<a href="/adaco/art/listByArtist?category=${artPage.search }&pageno=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/art/listByArtist?category=${artPage.search }&pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:if test="${artPage.next==true}">
				<li><a href="/adaco/art/listByArtist?category=${artPage.search }&pageno=${artPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>