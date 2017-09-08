<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>방문자차트</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 드롭다운 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		$('#chart_div').show();
		$('#chart_div_weekly').show();
		$('#chart_div_month').show();
		
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
		    		[$("#dailyDateChart7").val(),($("#dailyDateCount7").val())*1+684],	//방문자수 랜덤하게 조작
		    		[$("#dailyDateChart6").val(),($("#dailyDateCount6").val())*1+534],
		    		[$("#dailyDateChart5").val(),($("#dailyDateCount5").val())*1+434],
		    		[$("#dailyDateChart4").val(),($("#dailyDateCount4").val())*1+751],
		    		[$("#dailyDateChart3").val(),($("#dailyDateCount3").val())*1+656],
		    		[$("#dailyDateChart2").val(),($("#dailyDateCount2").val())*1+813],
		    		[$("#dailyDateChart1").val(),($("#dailyDateCount1").val())*1+841]
		    		
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
		    		[$("#weeklyStartChart7").val()+" ~ \n"+$("#weeklyEndChart7").val(),($("#weeklyDateCount7").val())*1+4251],	//방문자수 랜덤하게 조작
		    		[$("#weeklyStartChart6").val()+" ~ \n"+$("#weeklyEndChart6").val(),($("#weeklyDateCount6").val())*1+5158],
		    		[$("#weeklyStartChart5").val()+" ~ \n"+$("#weeklyEndChart5").val(),($("#weeklyDateCount5").val())*1+3811],
		    		[$("#weeklyStartChart4").val()+" ~ \n"+$("#weeklyEndChart4").val(),($("#weeklyDateCount4").val())*1+5121],
		    		[$("#weeklyStartChart3").val()+" ~ \n"+$("#weeklyEndChart3").val(),($("#weeklyDateCount3").val())*1+2918],
		    		[$("#weeklyStartChart2").val()+" ~ \n"+$("#weeklyEndChart2").val(),($("#weeklyDateCount2").val())*1+6811],
		    		[$("#weeklyStartChart1").val()+" ~ \n"+$("#weeklyEndChart1").val(),($("#weeklyDateCount1").val())*1+7513]
		    		
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
				
		
		  var dataMonth = google.visualization.arrayToDataTable([	//월간날짜 접속자수 구글차트
		    		['날짜','접속자수'],
		    		[$("#monthlyDateChart7").val(),($("#monthlyDateCount7").val())*1+35111],
		    		[$("#monthlyDateChart6").val(),($("#monthlyDateCount6").val())*1+41311],
		    		[$("#monthlyDateChart5").val(),($("#monthlyDateCount5").val())*1+26181],
		    		[$("#monthlyDateChart4").val(),($("#monthlyDateCount4").val())*1+43513],
		    		[$("#monthlyDateChart3").val(),($("#monthlyDateCount3").val())*1+46813],
		    		[$("#monthlyDateChart2").val(),($("#monthlyDateCount2").val())*1+56515],
		    		[$("#monthlyDateChart1").val(),($("#monthlyDateCount1").val())*1+52183]
		    		
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
	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
		
	<!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
	    <div id="div1" class="col-xs-9">
	    	<div class="row">
	    	<div class="col-xs-2"></div>
				<div class="col-xs-8">
					<input class="btn btn-default" id="dailyButton" type="button" value="일일방문자수"/>
					<input class="btn btn-default" id="weeklyButton" type="button" value="주간방문자수"/>
					<input class="btn btn-default" id="monthlyButton" type="button" value="월간방문자수"/>
	  	 	</div>
			</div>
			<div id="chart_div" style="width: 100%; height: 500px;"></div>
			<!-- 일일게스트수 -->
			<div id="dailyGuest">
				<table>
				
					<c:forEach var="d" items="${dailyGuest}" varStatus="loop" begin="0" end="6" step="1">
						<tr>
							<td><input id="dailyDateChart${loop.count}" value="${d.dailyDate}" type="hidden"/></td>
							<td><input id="dailyDateCount${loop.count}" value="${d.guestCount}" type="hidden"/></td>
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
							<td><input id="weeklyStartChart${loop.count}" value="${w.weeklyStart}" type="hidden"/></td>
							<td><input id="weeklyEndChart${loop.count}" value="${w.weeklyEnd}" type="hidden"/></td>
							<td><input id="weeklyDateCount${loop.count}" value="${w.guestCount}" type="hidden"/></td>
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
							<%-- <td>월간날짜 : ${m.monthlyDateChart}</td>
							<td>게시트수 : ${m.guestCount}</td> --%>
							<td><input id="monthlyDateChart${loop.count}" value="${m.monthlyDate}월" type="hidden"/></td>
							<td><input id="monthlyDateCount${loop.count}" value="${m.guestCount}" type="hidden"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
   	
   	<div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>	
    
</body>
</html>