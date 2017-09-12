<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
</head>

<c:import url="../statistics/statistics_header.jsp"></c:import>

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
			data : chartData1
		}, {
			label : "월별 유입 수 조회",
			backgroundColor:"#f6b2b2",
			borderColor: "#f08080",
            pointBorderColor: "#f08080",
            pointBackgroundColor: "#f08080",
            pointHoverBackgroundColor: "#f08080",
            pointHoverBorderColor: "#f08080",
            pointStyle: 'circle',
            fill: false,
            borderWidth: 4,
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
