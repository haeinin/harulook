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
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		var value =  new Array();
		var value1 =  new Array();
		$("input[name=2]").each(function(idx){   
	        value = $(this).val();
	         value = value*1
	       	 console.log(value);
	    });
		$("input[name=1]").each(function(idx){   
			value1 = $(this).val();
	       	 console.log(value1);
	       	 
	       
	    });
		
		function drawChart() {
				
		for(var i = 0; i < 6; i++) {
			  var data = google.visualization.arrayToDataTable([
			    	['날짜','접속자수'],
			    	[value1[i], value[i]]
			   ]);
		 }
		  var options = {
		    title: '일일방문자수',
		    hAxis: {title: '일일방문자수',  titleTextStyle: {color: '#333'}},
		    vAxis: {minValue: 0}
		  };
		
		  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
		  chart.draw(data, options);
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
	
			<div id="chart_div" style="width: 100%; height: 500px;"></div>
			
			<!-- 일일게스트수 -->
			<table>
				<c:forEach var="d" items="${dailyGuest}">
					<tr>
						<td><input name="1" id="1" value="${d.dailyDate}"/> : 일일날짜  </td>
						<td><input name="2" id="2" value="${d.guestCount}"/>: 게스트수  </td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 주간게스트수 -->
			<table>
				<c:forEach var="w" items="${weeklyGuest}">
					<tr>
						<td>주간날짜 : ${w.weeklyStart}</td>
						<td>주간날짜 : ${w.weeklyEnd}</td>
						<td>게시트수 : ${w.guestCount}</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 월간게스트수 -->
			<table>
				<c:forEach var="m" items="${monthlyGuest}">
					<tr>
						<td>월간날짜 : ${m.monthlyDate}</td>
						<td>게시트수 : ${m.guestCount}</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		
		<!-- 우측 베너 인클루드 -->
	    <c:import url="../module/right.jsp"></c:import>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../module/footer.jsp"></c:import>	
    
</body>
</html>