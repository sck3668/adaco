<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<style>
table {
        width: 100%;
      }
      table, th, td {
        border: 1px solid #bcbcbc;
      }
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
	<table >
		<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="30%">
				<col width="40%">
			</colgroup>
	 <caption><strong> <h3>회원 상세</h3></strong></caption>
		<thead>
			<tr>
				<th>프로필</th>
				<td>${user.profile}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${user.username}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>**********</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>email</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${user.tel}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>권한부여
				<select name="authorities">
  				  <option value="작가">일반유저</option>
  				  <option value="작가">작가</option>
				</select>
				
				&nbsp;&ensp;&emsp;&nbsp;&ensp;&emsp;&nbsp;<button>저장</button>
				</td>
			</tr>
		</thead>
		</table>
		<button>유저 블락</button>
		<button>저장</button>
</body>
</html>