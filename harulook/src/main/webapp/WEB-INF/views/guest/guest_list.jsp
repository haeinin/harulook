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
<script type="text/javascript">

	
</script>
</head>
<body>

	<!-- 일일게스트수 -->
	<table>
		<c:forEach var="d" items="${dailyGuest}">
			<tr>
				<td>일일날짜 : ${d.dailyDate}</td>
				<td>게시트수 : ${d.guestCount}</td>
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
</body>
</html>