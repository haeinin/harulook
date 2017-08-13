<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
				<td>제휴계약번호</td>
				<td>${dto.cooContractNo}</td>
			</tr>
			<tr>
				<td>제휴업체 담당자 아이디</td>
				<td>${dto.userId}</td>
			</tr>
			<tr>
				<td>하루룩 담당자 아이디</td>
				<td>${dto.managerId}</td>
			</tr>
			<tr>
				<td>제휴 시작 날짜</td>
				<td>${dto.cooContractStart}</td>
			</tr>
			<tr>
				<td>제휴 종료 날짜</td>
				<td>${dto.cooContractEnd}</td>
			</tr>
			<tr>
				<td>제휴 계약 날짜</td>
				<td>${dto.cooContractDate}</td>
			</tr>
			<tr>
				<td>제공할 쿠폰 할인율</td>
				<td>${dto.cooContractDc}</td>
			</tr>
			<tr>
				<td>수수료 정책</td>
				<td>${dto.cooContractFee}</td>
			</tr>
			<tr>
				<td>수수료 지급 날짜</td>
				<td>${dto.cooContractPayDay}</td>
			</tr>
			<tr>
				<td>쿠폰 코드</td>
				<td>${dto.cooContractCode}</td>
			</tr>
			<tr>
				<td>쇼핑몰 배너 이미지</td>
				<td>${dto.cooContractImg}</td>
			</tr>
			<tr>
				<td>배너URL</td>
				<td>${dto.cooContractLink}</td>
			</tr>
			<tr>
				<td>제휴상태</td>
				<td>${dto.cooContractStat}</td>
			</tr>
			<tr>
				<td>결제상태</td>
				<td>${dto.cooContractPayStat}</td>
			</tr>

		</table>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/partnerContractUpdate?cooContractNo=${dto.cooContractNo}">수정</a>

		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/partnerContractList">글목록</a>
	</div>
</body>
</html>