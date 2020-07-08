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
	var list = JSON.parse("${list}");
	var myChart = new Chart($ctx, {
		type : 'bar',
		data : {
			labels : [ '1월', '2월', '3월', '4월', '5월', '6월' ],
			datasets : [ {
				label : '월별 매출 현황',
				data : list,
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
				borderColor : [ 'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
				borderWidth : 1
			}]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
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