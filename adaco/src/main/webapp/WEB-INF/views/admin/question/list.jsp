<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록</title>
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
<h3>문의 목록</h3>
	<input type="text" id="serch" name="serch" placeholder="검색	">
	<label class="serch">	
		<button type="submit" name="serch">
			<i class="ui_icon--serch">
					<i class="ui_icon--serch::before"></i>
			</i>
		</button><br>
		<select class="category">
			<option value="분류">카테고리 분류</option>
			<option value="결제">결제 관련</option>
			<option value="취소">취소 관련</option>
			<option value="신고">신고 관련</option>
		</select>
	</label>
	<table >
		<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="30%">
				<col width="40%">
			</colgroup>
	 <caption><strong> <h3>문의 목록</h3></strong></caption>
		<thead>
			<tr>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일</th>
				<th>처리 상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${question.writer}</td>
				<td><a href="/adaco/question/read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writeDate}</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>${question.writer}</td>
				<td><a href="/adaco/question/read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writeDate}</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>${question.writer}</td>
				<td><a href="/adaco/question/read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writeDate}</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>${question.writer}</td>
				<td><a href="/adaco/question/read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writeDate}</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>${question.writer}</td>
				<td><a href="/adaco/question/read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writeDate}</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>${question.writer}</td>
				<td><a href="/adaco/question/read?qno=${question.qno}">${question.title}</a></td>
				<td>${question.writeDate}</td>
				<td>${user.email}</td>
			</tr>
			
		</tbody>
	</table>

</body>
</html>