<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 댓글 목록</title>
<script src="/adaco/js"></script>
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
	<table >
		<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="30%">
				<col width="40%">
			</colgroup>
	 <caption><strong> <h3>신고 댓글 목록</h3></strong></caption>
		<thead>
			<tr>
				<th>아이디</th>
				<th>내용</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="/adaco/adminuser/read?username=${user.uesrname}">${user.username}</a></td>
				<td>content</td>
				<td>email1</td>
			</tr>
			<tr>
				<td><a href="/adaco/adminuser/read?username=${user.uesrname}">${user.username}</a></td>
				<td>content</td>
				<td>email1</td>
			</tr>
			<tr>
				<td><a href="/adaco/adminuser/read?username=${user.uesrname}">${user.username}</a></td>
				<td>content</td>
				<td>email1</td>
			</tr>
			<tr>
				<td><a href="/adaco/adminuser/read?username=${user.uesrname}">${user.username}</a></td>
				<td>content</td>
				<td>email1</td>
			</tr>
			<tr>
				<td><a href="/adaco/adminuser/read?username=${user.uesrname}">${user.username}</a></td>
				<td>content</td>
				<td>email1</td>
			</tr>
			<tr>
				<td><a href="/adaco/adminuser/read?username=${user.uesrname}">${user.username}</a></td>
				<td>content</td>
				<td>email1</td>
			</tr>
		</tbody>
	</table>
</body>
</html>