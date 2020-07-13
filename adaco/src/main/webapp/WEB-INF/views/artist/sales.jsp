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
      yellow : 'rgb(255, 205, 86)',
      blue : 'rgb(54, 162, 235)',
   };
   var $chart = $("#chart");
   var $ctx = $chart[0].getContext('2d')
   var lastYearList = JSON.parse("${lastYearList}");
   var thisYearList = JSON.parse("${thisYearList}");
   var myChart = new Chart($ctx, {
      type : 'line',
      data : {
         labels : [ '1/4', '2/4', '3/4', '4/4' ],
         datasets : [ {
            label : '작년 총매출액',
            data : lastYearList,
            fill : false,
            backgroundColor : window.chartColors.red,
            borderColor : window.chartColors.red
         }, {
            label : '금년 총매출액',
            data : thisYearList,
            fill : false,
            backgroundColor : window.chartColors.blue,
            borderColor : window.chartColors.blue
         } ]
      },
      options : {
         responsive : true,
         title : {
            display : true,
            fontSize : 20,
            text : '총 매출현황'
         },
         tooltips : {
            mode : 'index',
            intersect : false,
         },
         hover : {
            mode : 'nearest',
            intersect : true
         },
         scales : {
            xAxes : [ {
               display : true,
               ticks : {
                  fontSize : 16
               },
               scaleLabel : {
                  display : true,
                  labelString : '분기',
                  fontSize : 16
               }
            } ],
            yAxes : [ {
               display : true,
               ticks : {
                  min : 250,
                  max : 450,
                  stepSize : 50,
                  fontSize : 16
               },
               scaleLabel : {
                  display : true,
                  labelString : '매출액',
                  fontSize : 16
               }
            } ]
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