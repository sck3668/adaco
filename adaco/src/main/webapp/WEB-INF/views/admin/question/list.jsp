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
      table {
        width: 100%;
      }
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
		$("#search").on("click", function(){
			var writer = $("#writer").val();
			location.href = "/adaco/admin/question_list?writer="+writer;
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
				<option value="분류">카테고리 분류</option>
				<option value="결제">결제 관련</option>
				<option value="취소">취소 관련</option>
				<option value="신고">신고 관련</option>
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

</body>
</html>