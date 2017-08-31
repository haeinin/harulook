<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
</head>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>
<c:import url="../statistics/statistics_header.jsp"></c:import>
<div class="row">
	<div class="col-xs-1"></div>
	<div class="col-xs-9">
		<div style="width: 80%">
			<div>
				<canvas id="canvas" height="350" width="600"></canvas>
			</div>
		</div>
	</div>
</div>

<c:set value="${cooContractNo}" var="no" />
<script>
	var chartLabels = [];// 받아올 데이터를 저장할 배열 선언
	var chartData1 = [];
	var chartData2 = [];

	var cooContractNo = '<c:out value="${no}"/>';

	console.log(cooContractNo);

	var lineChartData = {
		labels : chartLabels,
		datasets : [ {
			label : "월별 방문자 수 조회",
			fillColor : "rgba(220,220,220,0.2)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : chartData1
		}, {
			label : "월별 유입 수 조회",
			fillColor : "rgba(100,100,100,0.2)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(151,187,205,1)",
			data : chartData2
		} ]

	}

	function createChart() {
		var ctx = document.getElementById("canvas").getContext("2d");
		LineChartDemo = Chart.Line(ctx, {
			data : lineChartData,
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
	}

	$.getJSON("./getMonthlyVisitor", {
		cooContractNo : cooContractNo
	}, function(data) {
		$.each(data, function(key, value) {

			chartLabels.push(value.statsDate);
			chartData1.push(value.statsAmount);

		});
	});
	$.getJSON("./getMonthlyInflux", {
		cooContractNo : cooContractNo
	}, function(data) {
		$.each(data, function(key, value) {
			chartData2.push(value.statsAmount);

		});
		createChart();
	});

	console.log(chartLabels);
	console.log(chartData1);
	console.log(chartData2);

	/*   var ctx = document.getElementById("canvas").getContext("2d");
	   LineChartDemo = Chart.Line(ctx, {
	       data : lineChartData,
	       options : {
	           scales : {
	               yAxes : [ {
	                   ticks : {
	                       beginAtZero : true
	                   }
	               } ]
	           }
	       }
	   }); */
</script>
