<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- $(document).ready(function(){
	var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	if(month < 10) {
		month = '0'+month;
	}
	console.log(month);
	var day = d.getDate();
	if(day < 10) {
		day = '0'+day;
	}
	var date = year+month+day+'';
	console.log(date);
	var hour = d.getHours();
	
	var minute = d.getMinutes(); 
	if(minute < 40) {
		if(hour > 0) {
			hour = hour - 1;
		} else {
			hour = 23;
		}
	}
	var apiTime = hour % 3;
	console.log('hour % 3 = '+apiTime);
	if(apiTime == 0) {
		hour -= 1;
	} else if(apiTime == 1) {
		hour -= 2;
	} 
	if(hour < 10) {
		hour = '0'+hour;
	}
	hour = hour+'00';
	console.log(hour);
	$('#date').val(date);
	$('#hour').val(hour);
});	 -->
</head>
<body>
${map}
</body>
</html>