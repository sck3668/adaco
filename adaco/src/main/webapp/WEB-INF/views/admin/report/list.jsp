<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>신고 댓글 목록</title>
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
</head>
<body>
<h3>신고 댓글 목록</h3>
	<input type="text" id="serch" name="serch" placeholder="작가 검색">
	<label class="serch">	
		<button type="submit" name="serch">
			<i class="ui_icon--serch">
					<i class="ui_icon--serch::before"></i>
			</i>
		</button>
	</label>
	<div>
	<table class = "table table-hover">
		<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="5%">
			</colgroup>
	 	<caption><strong>신고 댓글 목록</strong></caption>
		<thead>
			<tr>
				<th>댓글 번호</th>
				<th>유저명</th>
				<th>내용</th>
				<th>작성일</th>
				<th>신고수</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items = "${reportPage.adminReportList}" var = "report">
			<tr>
				<td>${report.cno }</td>
				<td>${report.username }</td>
				<td>${report.content }</td>
				<td>${report.writeDateStr }</td>
				<td>${report.reportCnt }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>