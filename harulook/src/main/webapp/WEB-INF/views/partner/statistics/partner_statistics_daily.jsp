<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<c:set value="${cooContractNo}" var="no" />
<script>
	

	


	$(document).ready(function() {
		var chartLabels = [];// 받아올 데이터를 저장할 배열 선언
		var chartData = [];
		var month="";
		var lineChartData = {
				labels : chartLabels,
				datasets : [ {
					label : "월별 PC 판매량",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : chartData
				} ]

			}
		var cooContractNo = '<c:out value="${no}"/>';
		
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


		
		
		$('#selectMonth').change(function() {
			var changeMonth = $('#selectMonth option:selected').val();
			month = changeMonth;
			console.log('month:'+month);
			
			
			 
		});
		
		
		$('#btn').click(function(){
			
			chartLabels = [];
			chartData=[];

			$.getJSON("./getDailyVisitor", {
				cooContractNo : cooContractNo,
				month : month
			}, function(data) {
				$.each(data, function(key, value) {
					
					chartLabels.push(value.statsDate);
					chartData.push(value.statsAmount);
				});
				
				lineChartData = {
						labels : chartLabels,
						datasets : [ {
							label : "일별 방문자 수",
							data : chartData
						} ]

					}
				createChart();
				
			});
		})

		
	})
	
</script>
	<div class="row">
		<div class="col-xs-1"></div>
		<div class="col-xs-9">
	<select name="selectMonth" id="selectMonth">
		<option value="1">JAN</option>
		<option value="2">FEB</option>
		<option value="3">MAR</option>
		<option value="4">APR</option>
		<option value="5">MAY</option>
		<option value="6">JUN</option>
		<option value="7">JUL</option>
		<option value="8">AUG</option>
		<option value="9">SEP</option>
		<option value="10">OCT</option>
		<option value="11">NOV</option>
		<option value="12">DEC</option>
	</select>
	<button id="btn">보기</button>
	
	<div id="graph" style="width: 80%">
	<div>
		<canvas id="canvas" height="350" width="600"></canvas>
	</div>
</div>
</div>
</div>


