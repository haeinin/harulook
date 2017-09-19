<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="resources/files/images/umbrella.ico">

	<title>제휴계약 현황 </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.js"></script>

</head>
<body>
	<!-- 상단 인클루드 -->
	<div class="row">
	<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
	<!-- 바디 인클루드 -->
	<div class="row">
		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
		<div class="col-xs-1"></div>
		<div class="col-xs-7">
			<h1>제휴계약관리</h1><br>
			<table data-toggle="table" data-sort-order="desc" style="font-size: 0.85em;">
				<thead>
					<tr>
						<th data-field="name" data-sortable="true">제휴계약번호</th>
						<th>제휴업체 담당자 아이디</th>
						<th>하루룩 담당자 아이디</th>
						<th data-field="start" data-sortable="true">제휴 시작 날짜</th>
						<th data-field="end" data-sortable="true">제휴 종료 날짜</th>
						<th>제휴상태</th>
						<th>결제상태</th>
						<th>관리자승인</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${list}">
						<tr>
							<td><a href="${pageContext.request.contextPath}/partnerContractDetail?cooContractNo=${b.cooContractNo}">${b.cooContractNo}</a></td>
							<td>${b.userId}</td>
							<td>${b.managerId}</td>
							<td>${b.cooContractStart}</td>
							<td>${b.cooContractEnd}</td>
							<td>${b.cooContractStat}</td>
							<td>${b.cooContractPayStat}</td>

							<td>
								<c:if test="${sessionScope.level=='관리자'}">
									<c:if test="${b.cooContractStat=='제휴신청'}"><a class="btn btn-info" href="${pageContext.request.contextPath}/partnerContractAdmit?cooContractNo=${b.cooContractNo}&managerId=${sessionScope.id}">제휴승인</a></c:if>
									<c:if test="${b.cooContractStat=='제휴승인'}">승인완료</c:if>
								</c:if>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="col-xs-1"></div>
		
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>

    <div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>  
</body>
</html>