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
	<div class="col-xs-1">

	</div>
	<div class="col-xs-9">
		
		
	</div>
</div>
<div>
	

</div>

<c:set value="${cooContractNo}" var="no" />
<script>
	var chartLabels = [];// 받아올 데이터를 저장할 배열 선언
	var chartData = [];
	var chartData2 = [];


	var cooContractNo = '<c:out value="${no}"/>';

	console.log(cooContractNo);

	console.log(chartLabels);
	console.log(chartData);

	var lineChartData = {
		labels : chartLabels,
		datasets : [ {
			label : "주별 방문자 수 조회",
			backgroundColor:"#bfdaf9",
			borderColor: "#80b6f4",
            pointBorderColor: "#80b6f4",
            pointBackgroundColor: "#80b6f4",
            pointHoverBackgroundColor: "#80b6f4",
            pointHoverBorderColor: "#80b6f4",
            pointStyle: 'rectRot',
            pointRadius: 5,
            fill: false,
            borderWidth: 4,
           
			data : chartData2
		},{
			label : "주별 유입 방문자 수",
			backgroundColor:"#f6b2b2",
			borderColor: "#f08080",
            pointBorderColor: "#f08080",
            pointBackgroundColor: "#f08080",
            pointHoverBackgroundColor: "#f08080",
            pointHoverBorderColor: "#f08080",
            pointStyle: 'circle',
            fill: false,
            borderWidth: 4,
			data : chartData
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
							beginAtZero : true,
							
						}
					} ]
				}
			}
		});
	}
	$.getJSON("./getWeeklyVisitor", {
		cooContractNo : cooContractNo
	}, function(data) {
		$.each(data, function(key, value) {
			chartData2[5-key]= value.statsAmount;
		});
	});
	$.getJSON("./getWeeklyInflux", {
		cooContractNo : cooContractNo
	}, function(data) {
		$.each(data, function(key, value) {

			chartLabels[5-key] = value.statsStartDate;
			chartData[5-key]= value.statsAmount;

		});
		createChart();
	});
</script>