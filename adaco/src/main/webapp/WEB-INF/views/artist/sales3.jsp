<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script>



$(function() {
   var $chart = $("#chart");
   var $ctx = $chart[0].getContext('2d');
   var myChart = new Chart($ctx, {
       type: 'bar',
       data: {
           labels: ["어제", "금일"],
           datasets: [{
              label : '일일 매출 현황',
               data: ['${menCount}', '${womenCount}'], //컨트롤러에서 모델로 받아온다.
               backgroundColor: [
                   'rgba(255, 99, 132, 0.2)',
                   'rgba(54, 162, 235, 0.2)'

               ],
               borderColor: [
                   'rgba(255,99,132,1)',
                   'rgba(54, 162, 235, 1)'

               ],
               borderWidth: 1
           }
           ]
       },
       options: {
           scales: {
               yAxes: [{
                   ticks: {
                       beginAtZero:true
                   }
               }]
           }
       }
   });   
});
</script>
<style>
   #a {
      width : 200px; display : inline-block; text-align: center;
   }
   #b {
      width : 250px; display : inline-block; text-align: center;
   }
   #c {
      width : 250px; display : inline-block; text-align: center;
   }
   #d {
      width : 200px; display : inline-block; text-align: center;
   }
   a:hover {
      text-decoration: none !important; 
   }
   
    
</style>
</head>
<body>
   <hr><h4>매출 관리</h4><hr>
   <div id="cha">
      <span id = "a"><a href="/adaco/artist/sales" class="btn btn-outline-info">총 매출현황</a></span>
      <span id = "b"><a href="/adaco/artist/sales2" class="btn btn-outline-info">상품별 매출현황</a></span>
      <span id = "c"><a href="/adaco/artist/sales3" class="btn btn-outline-info">일일 매출현황</a></span>
      <span id = "d"><a href="/adaco/artist/sales4" class="btn btn-outline-info">월별 매출현황</a></span>      
   </div>
   <canvas id="chart">
   </canvas>
</body>
</html>