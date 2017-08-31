<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- 주소 api --> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script> 
<!-- 유효성검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 구글 차트  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		//일일방문자수
		
		$('#chart_div').hide();
		$('#chart_div_weekly').hide();
		$('#chart_div_month').hide();
		
		$('#dailyButton').click(function(){	//일일차트
			$('#chart_div').show();
			$('#chart_div_weekly').hide();
			$('#chart_div_month').hide();
		});
		
		$('#weeklyButton').click(function(){	//주간차트
			$('#chart_div').hide();
			$('#chart_div_weekly').show();
			$('#chart_div_month').hide();
		});
		
		$('#monthlyButton').click(function(){	//월간차트
			$('#chart_div').hide();
			$('#chart_div_weekly').hide();
			$('#chart_div_month').show();
		});
		
		
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
				
		   var data = google.visualization.arrayToDataTable([	//일일 날짜 접속자수 구글차트
		    		['날짜','접속자수'],
		    		[$("#aa7").val(),($("#bb7").val())*65],	//방문자수 랜덤하게 조작
		    		[$("#aa6").val(),($("#bb6").val())*71],
		    		[$("#aa5").val(),($("#bb5").val())*86],
		    		[$("#aa4").val(),($("#bb4").val())*51],
		    		[$("#aa3").val(),($("#bb3").val())*54],
		    		[$("#aa2").val(),($("#bb2").val())*76],
		    		[$("#aa1").val(),($("#bb1").val())*103]
		    		
		   ]);
		
		  var options = {
		    title: '일일방문자수',
		    hAxis: {title: '일일방문자수',  titleTextStyle: {color: '#333'}},
		    vAxis: {minValue: 0}
		  };
		
		  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
		  chart.draw(data, options);
		}
		
		//주간방문자수
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChartWeekly);
		
		function drawChartWeekly() {
				
		
		  var dataWeekly = google.visualization.arrayToDataTable([	//주간 접속자수 구글차트
		    		['날짜','접속자수'],
		    		[$("#aaa7").val(),($("#bbb7").val())*652],	//방문자수 랜덤하게 조작
		    		[$("#aaa6").val(),($("#bbb6").val())*711],
		    		[$("#aaa5").val(),($("#bbb5").val())*862],
		    		[$("#aaa4").val(),($("#bbb4").val())*513],
		    		[$("#aaa3").val(),($("#bbb3").val())*544],
		    		[$("#aaa2").val(),($("#bbb2").val())*765],
		    		[$("#aaa1").val(),($("#bbb1").val())*1036]
		    		
		   ]);
		
		  var optionsWeekly = {
		    title: '주간방문자수',
		    hAxis: {title: '주간방문자수',  titleTextStyle: {color: '#333'}},
		    vAxis: {minValue: 0}
		  };
		
		  var chartWeekly = new google.visualization.AreaChart(document.getElementById('chart_div_weekly'));
		  chartWeekly.draw(dataWeekly, optionsWeekly);
		}
		
		//월간방문자수
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChartMonth);
		
		function drawChartMonth() {
				
		
		  var dataMonth = google.visualization.arrayToDataTable([	//일일 날짜 접속자수 구글차트
		    		['날짜','접속자수'],
		    		[$("#aaaa7").val(),($("#bbbb7").val())*3455],
		    		[$("#aaaa6").val(),($("#bbbb6").val())*4356],
		    		[$("#aaaa5").val(),($("#bbbb5").val())*4566],
		    		[$("#aaaa4").val(),($("#bbbb4").val())*2344],
		    		[$("#aaaa3").val(),($("#bbbb3").val())*6788],
		    		[$("#aaaa2").val(),($("#bbbb2").val())*3456],
		    		[$("#aaaa1").val(),($("#bbbb1").val())*7897]
		    		
		   ]);
		
		  var optionsMonth = {
		    title: '월간방문자수',
		    hAxis: {title: '월간방문자수',  titleTextStyle: {color: '#333'}},
		    vAxis: {minValue: 0}
		  };
		
		  var chartMonth = new google.visualization.AreaChart(document.getElementById('chart_div_month'));
		  chartMonth.draw(dataMonth, optionsMonth);
		}
		
	});
	
</script>
</head>
<body>
	<!-- 해더인클루드 -->
	<c:import url="../module/header.jsp"></c:import>	
	<!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-1"></div>
	    <div id="div1" class="col-xs-9">
			<input class="btn btn-default" id="dailyButton" type="button" value="일일방문자수"/>
			<input class="btn btn-default" id="weeklyButton" type="button" value="주간방문자수"/>
			<input class="btn btn-default" id="monthlyButton" type="button" value="월간방문자수"/>
	  	 
			
			<div id="chart_div" style="width: 100%; height: 500px;"></div>
			<!-- 일일게스트수 -->
			<div id="dailyGuest">
				<table>
				
					<c:forEach var="d" items="${dailyGuest}" varStatus="loop" begin="0" end="6" step="1">
						<tr>
							<td><input id="aa${loop.count}" value="${d.dailyDate}" type="hidden"/></td>
							<td><input id="bb${loop.count}" value="${d.guestCount}" type="hidden"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div id="chart_div_weekly" style="width: 100%; height: 500px;"></div>
			<!-- 주간게스트수 -->
			<div id="weeklyGuest">
				<table>
					<c:forEach var="w" items="${weeklyGuest}" varStatus="loop" begin="0" end="6" step="1">
						<tr>
							<%-- <td>주간날짜 : ${w.weeklyStart}</td>
							<td>주간날짜 : ${w.weeklyEnd}</td>
							<td>게시트수 : ${w.guestCount}</td> --%>
							<td><input id="aaa${loop.count}" value="${w.weeklyStart}~${w.weeklyEnd}" type="hidden"/></td>
							<td><input id="bbb${loop.count}" value="${w.guestCount}" type="hidden"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div id="chart_div_month" style="width: 100%; height: 500px;"></div>
			<!-- 월간게스트수 -->
			<div id="monthlyGuest">
				<table>
					<c:forEach var="m" items="${monthlyGuest}" varStatus="loop" begin="0" end="6" step="1">
						<tr>
							<%-- <td>월간날짜 : ${m.monthlyDate}</td>
							<td>게시트수 : ${m.guestCount}</td> --%>
							<td><input id="aaaa${loop.count}" value="${m.monthlyDate}월" type="hidden"/></td>
							<td><input id="bbbb${loop.count}" value="${m.guestCount}" type="hidden"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!-- 우측 베너 인클루드 -->
	    <c:import url="../module/right.jsp"></c:import>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../module/footer.jsp"></c:import>	
    
</body>
</html>