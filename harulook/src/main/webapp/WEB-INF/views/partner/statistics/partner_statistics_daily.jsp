<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
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




<c:set value="${cooContractNo}" var="no" />
<script>
	

	


	$(document).ready(function() {

		
		var chartLabels = [];// 받아올 데이터를 저장할 배열 선언
		var chartData = [];
		var month="";
	
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
							backgroundColor:"#bfdaf9",
							borderColor: "#80b6f4",
				            pointBorderColor: "#80b6f4",
				            pointBackgroundColor: "#80b6f4",
				            pointHoverBackgroundColor: "#80b6f4",
				            pointHoverBorderColor: "#80b6f4",
				            fill: false,
				            borderWidth: 4,
							data : chartData
						} ]

					}
				createChart();
				
			});
		})

		
	})
	
</script>

<!-- 헤더 -->
<div class="row">
	<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
</div>

	
	<div class="row">
		<div class="col-xs-2">
			<c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
		</div>
			<div class="col-xs-8" style="margin-top:20px;">
			<div class="col-md-1"></div>
			<div class="container">

				<input type="button" id="dailyBtn" name="btn" value="일별보기"  onclick="location.href='././daily'"> 
				<input type="button" id="monthlyBtn" name="btn" value="월별보기" onclick="location.href='././monthly'"> 
				<input type="button" id="weeklyBtn" name="btn" value="주별보기" onclick="location.href='././getWeeklyVisitorTable?cooContractNo=${cooContractNo}'">

				<div style="margin-top:20px; margin-left:80px">
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
				</div>
			</div>



			<div id="graph" style="width: 80%; margin: 30px;">
				<div>
					<canvas id="canvas" height="350" width="600"></canvas>
				</div>
			</div>
		</div>

		<div class="col-xs-2">
			<!-- 우측 베너 인클루드 -->
			<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
		</div>
	</div>




