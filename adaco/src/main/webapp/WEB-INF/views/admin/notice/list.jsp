<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
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
</head>
<body>
<div>
		<table class="table table-hover">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="40%">
				<col width="30%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>비고</th>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody id="list">
			<c:forEach items="${noticePage.adminNoticeList}" var="notice">
				<tr>
					<td><c:choose>
							<c:when test="${notice.important==true }">공지 
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</td>
					<td>${notice.noticeno }</td>
					<td><a href="/adaco/admin/notice_read?noticeno=${notice.noticeno}">${notice.title }</a></td>
					<td>${notice.writeDateStr }</td>
					<td>${notice.writer}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${noticePage.prev==true}">
				<li><a href="/adaco/admin/notice_list?pageno=${noticePage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${noticePage.startPage}" end="${noticePage.endPage}" var="i">
				<c:choose>
					<c:when test="${noticePage.pageno eq i }">
						<li class="active">
							<a href="/adaco/admin/notice_list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/adaco/admin/notice_list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${noticePage.next==true}">
				<li><a href="/adaco/admin/notice_list?pageno=${noticePage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div class="form-group">
		<button type="button" id="write" class="btn btn-info">글쓰기</button>
	</div>
	<div class = "modal fade" id = "myModal" role = "dialog">
		<div class = "modal-dialog">
			<div class = "modal-content">
				<div class = "modal-body">
					<ul>
						<li id = "read_by_id">게시물 보기</li>
						<li id = "find_joindate">가입일 보기</li>
						<sec:authorize access = "isAuthenticated()">
							<li id = "write_msg">쪽지 보내기</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>