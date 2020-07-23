
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
   
     #section {
   width: 850px;
   padding: 5px;
   float: right;
   min-height: 600px;
   }
    table, th, td {
        border: 1px solid #bcbcbc;
        text-align: center;
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
   <section id="section">
<!--    <div> -->
<!--             <li>번호</li> -->
<!--             <li>주문일자</li> -->
<!--             <th>작품명</th> -->
<!--             <th>금액</th> -->
<!--             <th>배송비</th> -->
<!--             <th>주문상태</th> -->
<!--    </div> -->

   <h3><br><br><br>주문 내역</h3>
   <hr>
   <div id="orderMain">
   <table>
      <colgroup>
            <col width="10%">
            <col width="18 %">
            <col width="40%">
            <col width="10%">
            <col width="10%">
            <col width="20%">
         </colgroup>
      <thead>
         <tr id="thead">
            <th>번 호</th>
            <th>주 문 일 자</th>
            <th>작 품 명</th>
            <th>금 액</th>
            <th>배 송 비</th>
            <th>주 문 상 태</th>
         </tr>
      </thead>
      
      <tbody id = "list">
      <c:forEach items="${page.orderList}" var = "list">
                <tr>
                	<td>${list.orderno }</td>
                	<td>${list.orderDateStr}</td>
                	<td><a href="/adaco/user/orderRead?artName=${list.artName }">${list.artName }</a></td>
                	<td>${list.artPrice }</td>
                	<td>${list.shippingCharge }</td>
                	<td>${list.orderstate }</td>
                </tr>
                
      </c:forEach>
      </tbody>
   </table>
   </div>
   
     <div style="text-align:center;">
      <ul class="pagination">
         <c:if test="${page.prev==true}">
            <li><a href="/adaco/user/orderList?pageno=${page.startPage-1}">이전</a></li>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                  <li class="active">
                     <a href="/adaco/user/orderList?pageno=${i}">${i}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li><a href="/adaco/user/oderList?username=&pageno=${i}">${i}</a></li>
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