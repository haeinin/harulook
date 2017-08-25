<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.container {
	padding: 80px 100px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
/* 	$(document).ready(function() {

		$('#dailyBtn').click(function() {
			$('#daily').submit();
		});
		$('#monthlyBtn').click(function() {
			$('#monthly').submit();
		});
	}); */
		
</script>		
</head>
<div class="container">
<input type="button" id="dailyBtn" name="btn" value="일별보기" onclick="location.href='././daily?cooContractNo=${cooContractNo}'">
<input type="button" id="monthlyBtn" name="btn" value="월별보기" onclick="location.href='././monthly?cooContractNo=${cooContractNo}'">
<input type="button" id="weeklyBtn" name="btn" value="주별보기" onclick="location.href='././getWeeklyVisitorTable?cooContractNo=${cooContractNo}'">


</div>


