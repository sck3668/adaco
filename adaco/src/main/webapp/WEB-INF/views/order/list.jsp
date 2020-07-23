
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
   
   #aside {
   width:110px;
   height:500px;
   background-color: gray;
   float: left;
  }
     #section {
   width: 850px;
   padding: 5px;
   float: right;
   min-height: 600px;
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
   td { 
     background-color: #e3f2fd; 
   } 
   
   
   
   #orderMain {
   }
   </style>
<script type="text/javascript">
 
</script>
</head>
<body>
 <aside id="asideMain">
   <div id="aside">
      <div id="profile">
      </div>
      <div>
         <ul>
            <li><a href="/adaco/user/read" style="color: black;">내정보보기</a></li>
            <li><a href="/adaco/order/list"style="color: black;">주문내역</a></li>
            <li><a href="/adaco/user/reviewList" style="color: black;">내리뷰보기</a></li>
            <li><a href="/adaco/user/favoriteList" style="color: black;">즐겨찾기목록</a></li>
            <li><a href="/adaco/user/pointList" style="color: black;">포인트함 </a>
            <li><a href="/adaco/user/messageList" style="color: black;">메세지함</a>
         </ul>
      </div>
   </div>
   
   </aside>
   <section id="section">
<!--    <div> -->
<!--             <li>번호</li> -->
<!--             <li>주문일자</li> -->
<!--             <th>작품명</th> -->
<!--             <th>금액</th> -->
<!--             <th>배송비</th> -->
<!--             <th>주문상태</th> -->
<!--    </div> -->
   <h3>주문 내역</h3>
   <div>
   <input type="text" id="username" name="username" placeholder="사용자 검색">
   <button type = "button" id = "search">검색</button>
   </div>
   <div>
      <select class="category">
            <option value="선택">선택</option>
            <option value="유저">모든 유저</option>
            <option value="아티스트">판매자</option>
      </select>
   </div>   
   ${page }
   <div id="orderMain">
   <table>
      <colgroup>
            <col width="6%">
            <col width="15%">
            <col width="40%">
            <col width="10%">
            <col width="10%">
            <col width="20%">
         </colgroup>
      <thead>
         <tr id="thead">
            <th>번호</th>
            <th>주문일자</th>
            <th>작품명</th>
            <th>금액</th>
            <th>배송비</th>
            <th>주문상태</th>
         </tr>
      </thead>
      <tbody id = "list">
      <c:forEach items="${page.orderList}" var = "list">
                <tr>
                	<td>${list.orderno }</td>
                	<td>${list.orderDateStr}</td>
                	<td>${list.artName }</td>
                	<td>${list.artPrice }</td>
                	<td>${list.shippingCharge }</td>
                </tr>
                
      </c:forEach>
      </tbody>
   </table>
   </div>
     <div style="text-align:center;">
      <ul class="pagination">
         <c:if test="${page.prev==true}">
            <li><a href="/adaco/order/list?pageno=${artistPage.startPage-1}">이전</a></li>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                  <li class="active">
                     <a href="/adaco/order/list?pageno=${i}">${i}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li><a href="/adaco/order/list?username=&pageno=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>
            
         </c:forEach>
         <c:if test="${Page.next==true}">
            <li><a href="/adaco/order/list?username=${page.endPage+1}">다음</a></li>
         </c:if>
      </ul>
   </div>
   </section>
</body>
</html>