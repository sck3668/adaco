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
</head>
<body>
<aside id="asideMain">
	<div id="aside">
		<div id="profile">
		</div>
		<div>
			<ul>
				<li><a href="/adaco">메인</a></li>
				<li><a href="/adaco/artist/orderAdmin">주문배송관리</a></li>
				<li><a href="/adaco/artist/shopMade">상점개설</a></li>
				<li class="dropdown" id="dropdown">
          	<a href="/adaco/artist/sales" id="dropdownSalesMenu">
          		<i class="fa fa-folder-open"></i> 매출관리 <i class="caret"></i>
          	</a>
          	<ul id="dropdown-menu" class="dropdown-menu" role="menu" aria-labelledby="dropdownSalesMenu"> 
          		<li class="divider"></li>
          		<li><a href="/adaco/artist/sales2"><i class="fa fa-folder"></i>상품별 매출현황</a></li> 
          		<li><a href="/adaco/artist/sales3"><i class="fa fa-folder"></i>일일 매출현황</a></li> 
          		<li><a href="/adaco/artist/sales4"><i class="fa fa-folder"></i>월별 매출현황</a></li> 
          	</ul> 
          </li>
				
			</ul>
		</div>	
	</div>
	</aside>
	<canvas id="chart">
	</canvas>
</body>
</html>