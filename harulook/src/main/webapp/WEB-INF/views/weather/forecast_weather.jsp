<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<link href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="resources/css/style.css?ver=1">

<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="resources/js/modernizr.js"></script>
<!-- 아이피받아오기 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>

<!-- 지오코딩다음 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41149e966427f3ed0a2d1b8fe3bcf837&libraries=services"></script>  


<title>날씨 예보</title>
<script type="text/javascript">
$(function(){
	
	var forecastSky = '';
	var forecastRain = '';
	
	for(var i=1; i<19; i++) {
		
		forecastSky = $('#forecastSky').children().eq(i).children().eq(0).val();
		forecastRain = $('#forecastSky').children().eq(i).children().eq(1).val();
		console.log('forecastSky : ',forecastSky);
		console.log('forecastRain : ',forecastRain);
		
		// 하늘 상태 
	    switch(forecastSky) {
	    case '1' :     // 맑음
	        $('#forecastWeater').attr('class','sunny');
	        break;
	    case '2' :     // 구름 조금
	        $('#forecastWeater').attr('class','partly_cloudy');
	        $('#forecastSun').attr('class','partly_cloudy__sun');
	        $('#forecastCloud').attr('class','partly_cloudy__cloud');
	        break;
	    case '3' :    // 구름 많음
	        $('#forecastWeater').attr('class','cloudy');
	        break;
	    case '4' :    // 흐림
	        $('#forecastWeater').attr('class','rainy');
	        $('#forecastCloud').attr('class','rainy__cloud');
	        break;
	    default :
	        $('#forecastWeater').attr('class','');
	        break;
	    }
		
		// 강수형태 - 비나 눈
		switch(forecastRain) {    
		case '1' :    // 비
		    if(data.precipitation > 5) { // 강수량이 5 이상일 때, 폭우 
		        $('#forecastRain').attr('class','thundery__rain');
		    } else {
		        $('#forecastRain').attr('class','rainy__rain');
		    }
		    break;
		case '3' :    // 눈 (가져온 날씨 css에 눈 그림이 없어서 폭우 그림으로 대체. 눈 그림은 추후에 추가 예정)
		    $('#forecastRain').attr('class','thundery__rain');
		    break;
		default :    //없음
		    $('#forecastRain').removeAttr('class');
		    break;
		}
	}
});
</script>
</head>
<body>
	<div class="row">
	    <!-- 상단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
	<!-- 바디 인클루드 -->

	<div class="row">
		<div class="col-xs-1">
   		<!-- 좌측 베너 인클루드 -->
    	</div>

   		<div class="col-xs-9">
   		<table class="table table-striped">
   			<tr>
   				<th>날짜</th>
   				<c:forEach items="${weatherList}" var="wl">
   					<th>${wl.updateDate}</th>
   				</c:forEach>
   			</tr>
   			<tr>
   				<td>시간</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td>${wl.updateHour}</td>
   				</c:forEach>
   			</tr>
   			<tr>
   				<td>기온</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td>${wl.temp3hour}</td>
   				</c:forEach>
   			</tr>
   			<tr id="forecastSky">
   				<td>하늘</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td>
   					<input type="hidden" value="${wl.sky}">		
   					<input type="hidden" value="${wl.rainStat}">	
   					<div class="weather_body">
						<div id="forecastWeater">
							<div id="forecastSun"></div>
							<div id="forecastCloud"></div>
							<div id="forecastRain"></div>
						</div>
					</div>
					</td>
   				</c:forEach>
   			</tr>
   			<tr>
   				<td>습도</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td>${wl.humidity}</td>
   				</c:forEach>
   			</tr>
   			<tr>
   				<td>강수확률</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td>${wl.rainProbability}</td>
   				</c:forEach>
   			</tr>
   			<tr>
   				<td>최저기온</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td style="color: blue;">${wl.tempMin}</td>
   				</c:forEach>
   			</tr>
   			<tr>
   				<td>최고기온</td>
   				<c:forEach items="${weatherList}" var="wl">
   					<td style="color: red;">${wl.tempMax}</td>
   				</c:forEach>
   			</tr>
   		</table>

   		</div>
   		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
	</div>
	
    <!-- 하단 인클루드 -->
    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>
</body>
</html>