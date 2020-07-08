<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<style>
#dropdown-menu {
	display: inline-block; width:120px;
}
#dropdown {float: left; display:inline-block; width:120px; }
.ui_gnb {}
.ui_gnb__menu {
	display: inline-block; width:120px;
}

</style>


<script>


function init() {
	$("#dropdown-menu1").hide();
	}
$(function() {
	init();
	$("#dropdown-menu1").hide();
 	$("#dropdownSalesMenu").on("click", function() {
		$("#dropdown-menu1").toggle();	
 		}); 
	})




$(function() {
	window.chartColors = {
		red : 'rgb(255, 99, 132)',
		yellow : 'rgb(255, 205, 86)',
		blue : 'rgb(54, 162, 235)',
	};
	var $chart = $("#chart");
	var $ctx = $chart[0].getContext('2d');
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
          	<a href="#" id="dropdownSalesMenu">
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