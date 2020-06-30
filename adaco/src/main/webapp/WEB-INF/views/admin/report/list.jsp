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
    <script type="text/javascript">
    	$(function() {
    		$("#delete").on("click", function(){
    			var ar = "";
    			$(".cno").each(function(idx) {
    				if($(this).prop("checked")) {
    					ar = ar + ($(this).val()) + ",";
    				}
    			});
    			
    			var $form = $("<form>").attr("action", "/adaco/admin/report_delete").attr("method", "post")
    			$("<input>").attr("type", "hidden").attr("name", "cnos").val(ar).appendTo($form);
    			$("<input>").attr("type", "hidden").attr("name", "_csrf").val("${_csrf.token}").appendTo($form);
    			$form.appendTo($("body")).submit();
    		})
    	})
    </script>
</head>
<body>
<h3>신고 댓글 목록</h3>
	
	<div>
	<table class = "table table-hover">
		<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="5%">
				<col width="3%">
			</colgroup>
	 	<caption><strong>삭제할 항목을 체크하여 삭제해주세요.</strong></caption>
		<thead>
			<tr>
				<th>댓글 번호</th>
				<th>유저명</th>
				<th>내용</th>
				<th>작성일</th>
				<th>신고수</th>
				<th><i class="fa fa-scissors" aria-hidden="true">처리</i></th>
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
				<td><input type="checkbox" class="cno" value="${report.cno}"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button id = "delete">삭제</button>
	</div>
	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${report.prev==true}">
				<li><a href="/adaco/admin/report_list?pageno=${page.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${reportPage.startPage}" end="${reportPage.endPage}" var="i">
				<c:choose>
					<c:when test="${reportPage.pageno eq i }">
						<li class="active">
							<a href="/adaco/admin/report_list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/admin/report_list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${reportPage.next==true}">
				<li><a href="/adaco/admin/report_list?pageno=${reportPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>