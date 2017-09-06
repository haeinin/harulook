<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>~하루룩~</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>홈</title>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>

</head>
<body>
	<!-- 상단 인클루드 -->
	<c:import url="/WEB-INF/views/module/header.jsp"></c:import>


	<!-- 바디 인클루드 -->
	<div class="row">

		<div class="col-xs-1">
			<c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
		</div>
		<div class="col-xs-9">
			<div class="container">

				<input type="button" id="dailyBtn" name="btn" value="일별보기"  onclick="location.href='././daily'"> 
				<input type="button" id="monthlyBtn" name="btn" value="월별보기" onclick="location.href='././monthly'"> 
				<input type="button" id="weeklyBtn" name="btn" value="주별보기" onclick="location.href='././getWeeklyVisitorTable?cooContractNo=${cooContractNo}'">

			</div>



			<div id="graph" style="width: 80%; margin: 20px;">
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




</body>
</html>
