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
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 아이피받아오기 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script type="text/javascript">
		
	$(document).ready(function(){
		/* 받아온 아이피 */
		console.log(ip());
		var addr;
		
		/* function ipv(){
		  return -1 !=ip().indexOf(":")?6:4
		}
		alert(ip);
		console.log(ip); */
		
		/* 현재내위치좌표 */
		navigator.geolocation.getCurrentPosition(function(position){
	    console.log('latitude: ', position.coords.latitude);
	    addr = position.coords.latitude;	////////////////////////나중에 주소(도)로 바꿔서 넘겨야함
	    
	    console.log('longitude: ', position.coords.longitude);
	    });

		var request = $.ajax({
			  url: "./guestAdd", //호출 경로
			  method: "POST",	//전송방식
			  data: { 'ip' : ip() }, //전송해줄값
			  dataType: "text" //결과값 타입 (리턴)
		});
	});
		

</script>
<title>홈</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
	<c:import url="./module/header.jsp"></c:import>

	
</body>
</html>
