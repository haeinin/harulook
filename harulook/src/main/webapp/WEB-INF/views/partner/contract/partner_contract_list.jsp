<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>제휴계약 현황 </title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#cooContractAdmitBtn').click(function(){	
			
			$('#cooContractAdmit').submit();
		});

	 });

</script>
</head>
<body>
<!-- 상단 인클루드 -->
    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    
    <!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-1">
	    
	    </div>
	    
	    <div class="col-xs-9">
	    <div class="row">
	    <div class="col-md-2"></div>
	    <div class="col-sm-10">

	<table class="table">
		<thead>
			<tr>
				<th>제휴계약번호</th>
				<th>제휴업체 담당자 아이디</th>
				<th>하루룩 담당자 아이디</th>
				<th>제휴 시작 날짜</th>
				<th>제휴 종료 날짜</th>
				<th>제휴상태</th>
				<th>결제상태</th>
				<th>관리자승인</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="b" items="${list}">
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/partnerContractDetail?cooContractNo=${b.cooContractNo}">${b.cooContractNo}</a></td>
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
	</div>
	</div>
	</div>
</body>
</html>