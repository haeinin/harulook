<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>제휴계약 결제 예정 금액 현황</title>
</head>
<body>
<!-- 상단 인클루드 -->
    <div class="row">
    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    </div>
    <!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-2"></div>
	    <div class="col-xs-7">
	    <div class="row" >
			<table class="table">
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
							<td><a class="btn btn-default" href="${pageContext.request.contextPath}/partnerContractPayInsert?cooBillNo=${b.cooBillNo}">결제하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	    </div>
	    <div class="col-xs-1"></div>
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
</body>
</html>