<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
</head>
<style>
canvas {
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
}
</style>
<c:import url="../statistics/statistics_header.jsp"></c:import>

<div style="width: 80%">
    <div>
        <canvas id="canvas" height="350" width="600"></canvas>
    </div>
</div>

<c:set value="${cooContractNo}" var="no"/>
<script>
var chartLabels = [];// 받아올 데이터를 저장할 배열 선언
var chartData = [];

var cooContractNo = '<c:out value="${no}"/>';

console.log(cooContractNo);


 console.log(chartLabels);
 console.log(chartData);
 
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
		        data : chartData
		    }

		    ]
		 
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
 
$.getJSON("./getMonthlyInflux"
		,{cooContractNo:cooContractNo}
		, function (data) {
	 $.each(data, function (key, value) {
		 
		 chartLabels.push(value.statsDate);
		 chartData.push(value.statsAmount);
		 
	
	 });
	 createChart();
	 });
	 



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
