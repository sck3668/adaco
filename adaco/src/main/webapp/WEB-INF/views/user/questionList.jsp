<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	#aside {
		width:110px;
		height:500px;
		background-color: gray;
		float: left;
	}	
	#profile {
		width:200px;
		height:200px;
	}
	#section {
	width: 850px;
	padding: 5px;
	float: right;
	min-height: 600px;
	}
	#my {
		width:750px;
		padding: 0px;
		height:80px;
		background-color: gray;
		margin: 0px;
	}
	
	.list {
		margin-top:0px;
		padding-top:0px;
		display:inline-block;
		width:240px;
		height:50px;
		border: 1px solid red;
	}
</style>
<script>
$(function(){
})

</script>
</head>
<body>
<div>
<section id="section">
  <div>
   <h1>1:1 문의목록</h1>
      <table class="table table-hover">
                <colgroup>
					<col width="10%">
					<col width="30%">
					<col width="8%">
					<col width="20%">
					<col width="20%">
				</colgroup>
			<thead>
			<tr style="text-align: center;">
				<th>문의번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody id = "list">
		<c:forEach items = "${questionPage.adminQuestionList}" var = "question">
			<tr style="text-align: center;">
				<td>${question.qno}</td>
				<td><a href="/adaco/admin/question_read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writer}</td>
				<td>${question.writeDateStr}</td>
				<td>${question.state}</td>
			</tr>	
		</c:forEach>
		</tbody>
       </table>
       <ul class="pagination" style="text-align: center; margin: 0 auto; width: 0px; text-align: center;">
			<c:if test="${questionPage.prev==true}">
				<li class="page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/user/questionList?searchType=${questionPage.state}&writer=${questionPage.search }&pageno=${questionPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${questionPage.startPage}" end="${questionPage.endPage}" var="i">
				<c:choose>
					<c:when test="${questionPage.pageno eq i }">
						<li class="page-item active">
							<a class = "page-link" href="/adaco/user/questionList?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class = "page-item"><a class = "page-link" href="/adaco/user/questionList?searchType=${questionPage.state}&writer=${questionPage.search }&pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${questionPage.next==true}">
				<li class = "page-item" style="width: 60px;"><a style = "width: 60px;" class = "page-link" href="/adaco/user/questionList?searchType=${questionPage.state}&writer=${questionPage.search }&pageno=${questionPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
      <br><br><br><br><br><br><br><br><br><br><br>
   </div>		
			
	</section>
	</div>
</body>
</html>