<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
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
<form action="/adaco/notice/list" method="get" id="findIdForm">
<h2>FAQ 목록</h2>
	
	<table >
		<colgroup>
				<col width="10%">
				<col width="40%">
			</colgroup>
			<button>작성</button>
		<thead>
		
			<tr>
				<th>${faq.faqno}</th>
				<th>${faq.title}</th>
			</tr>
			
		
			<tr>
				<td>${faq.faqno}</td>
				<td><a href="/adaco/faq/read?faqno=${faq.faqno}">${faq.title}</a>
				 <input type="checkbox" >
				</td>
			</tr>
			<tr>
				<td>${faq.faqno}</td>
				<td><a href="/adaco/faq/read?faqno=${faq.faqno}">${faq.title}</a>
				 <input type="checkbox">
				</td>
			</tr>
			<tr>
				<td>${faq.faqno}</td>
				<td><a href="/adaco/faq/read?faqno=${faq.faqno}">${faq.title}</a>
				 <input type="checkbox">
				</td>
			</tr>
			<tr>
				<td>${faq.faqno}</td>
				<td><a href="/adaco/faq/read?faqno=${faq.faqno}">${faq.title}</a>
				 <input type="checkbox">
				</td>
			</tr>
			<tr>
				<td>${faq.faqno}</td>
				<td><a href="/adaco/faq/read?faqno=${faq.faqno}">${faq.title}</a>
				 <input type="checkbox">
				</td>
			</tr>
			<tr>
				<td>${faq.faqno}</td>
				<td><a href="/adaco/faq/read?faqno=${faq.faqno}">${faq.title}</a>
				 <input type="checkbox">
				</td>
			</tr>
		</thead>	
	</table>
	<button> 수정 </button>
	<button> 삭제</button>
</form>
</body>
</html>