<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
      table, th, td {
        border: 1px solid #bcbcbc;
      }   
      table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  th {
    background-color: #bbdefb;
  }
/*   td { */
/*     background-color: #e3f2fd; */
/*   } */
    </style>
<script type="text/javascript">
	$(function(){
		var a = location.href;
		console.log(a);
		$("#search").on("click", function(){
			var writer = $("#writer").val();
			location.href = "/adaco/admin/question_list?writer="+writer	
		});
		$(".category").on("change", function(){
			var $category = $(".category").val();
			location.href = "/adaco/admin/question_list?searchType="+$category
		});
	});	
</script>
</head>
<body>
<h3>문의 목록</h3>
	<div>
	<input type="text" id="writer" name="writer" placeholder="작성자 검색">
	<button type = "button" id = "search">검색</button>
	</div>
	<div>
		<select class="category">
				<option value="선택">선택</option>
				<option value="답변대기">미답변 문의</option>
				<option value="답변완료">답변 완료문의</option>
				<option value="">전체</option>
		</select>
	</div>	
	<table>
		<colgroup>
				<col width="5%">
				<col width="30%">
				<col width="10%">
				<col width="20%">
				<col width="5%">
			</colgroup>
	 <caption><strong> <h3>문의 목록</h3></strong></caption>
		<thead>
			<tr>
				<th>문의번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items="${questionPage.adminQuestionList }" var = "question">
			<tr>
				<td>${question.qno}</td>
				<td><a href="/adaco/admin/question_read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writer}</td>
				<td>${question.writeDateStr}</td>
				<td>${question.state}</td>
			</tr>					
		</c:forEach>
		</tbody>
	</table>
 	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${question.prev==true}">
				<li><a href="/adaco/admin/question_list?pageno=${page.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${questionPage.startPage}" end="${questionPage.endPage}" var="i">
				<c:choose>
					<c:when test="${questionPage.pageno eq i }">
						<li class="active">
							<a href="/adaco/admin/question_list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/admin/question_list?searchType=답변대기&pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${questionPage.next==true}">
				<li><a href="/adaco/admin/question_list?pageno=${questionPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>