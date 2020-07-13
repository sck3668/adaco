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
   window.chartColors = {
      red : 'rgb(255, 99, 132)',
      orange : 'rgb(255, 159, 64)',
      yellow : 'rgb(255, 205, 86)',
      green : 'rgb(75, 192, 192)',
      blue : 'rgb(54, 162, 235)',
      purple : 'rgb(153, 102, 255)',
      grey : 'rgb(201, 203, 207)'
   };
   var $chart = $("#chart");
   var $ctx = $chart[0].getContext('2d');
   var list = JSON.parse("${list}");
   var myChart = new Chart($ctx, {
      type : 'doughnut',
      data : {
         labels : [ '신발', '옷', '팔찌', '시계', '음식' ],
         datasets : [{
            label : '',
            data : list,
            backgroundColor : [ window.chartColors.red,
                  window.chartColors.orange,
                  window.chartColors.yellow,
                  window.chartColors.green,
                  window.chartColors.blue, ]
         }]
      },
      options : {
         responsive : true,
         legend : {
            position : 'top',
         },
         title : {
            display : true,
            text : '상품별 매출현황'
         },
         animation : {
            animateScale : true,
            animateRotate : true
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