<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>제휴계약 결제 예정 금액 현황</title>
</head>
<body>
	<table border="1px">
		<thead>
			<tr>
				<th>제휴계약번호</th>
				<th>단위기간</th>
				<th>수수료</th>
				<th>결제 예정 날짜</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>${b.cooContractNo}</td>
					<td>${b.cooBillMonth}</td>
					<td>${b.cooBillValue}</td>
					<td>${b.cooBillDate}</td>
					<td><a class="btn btn-default" href="${pageContext.request.contextPath}/partnerContractPayInsert?cooContractNo=${b.cooContractNo}">결제하기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>