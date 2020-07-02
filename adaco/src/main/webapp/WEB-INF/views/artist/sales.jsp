<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<div>
<aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
				<li><a href="/adaco">메인</a></li>
				<li><a href="/adaco/artist/sales">매출관리</a></li>
				<li><a href="/adaco/artist/orderAdmin">주문/배송관리</a></li>
				<li><a href="/adaco/artist/shopMade">상점개설</a></li>
			</ul>
		</div>
	</div>
	</aside>
	<section id="section">
	<div>
   <h1>장바구니</h1>
      <table class="table table-hover">
         <thead>
         <tr>
            <th>번호</th><th>이미지</th><th>상품명</th><th>상품코드</th><th>옵션 값</th><th>수량</th><th>주문금액</th><th>선택</th>
         </tr>
         </thead>
         <tbody>
         			<tr> 
                  <td></td>
                  <td></td>
                  <td></td>               
                  <td></td>
                  <td></td>
                  <td>
					<input type="button" value="하나 더" id="PLUS"><input type="text" value="1" style="text-align:center"><input type="button" value="빼기" id=Minus>
                  <td></td>
                  <td><input type="checkbox" class="bag" value="${bag}"></td>
           </tr>
         </tbody>
      </table>
      <br><br><br><br><br><br><br><br><br><br><br>
      <button style="float:right;">선택 삭제</button>
   </div>
	</section>
	</div>
	</section>
	</div>
	
</body>
</html>