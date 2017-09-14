<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 드롭다운버튼용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
    
    <!-- 바디 인클루드 -->
	<div class="row">
		<!-- 좌측 베너 인클루드 -->
		<div class="col-xs-1">
			<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
		</div>
		<div class="col-xs-9">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-7">

					<c:if test="${!empty list}">
						<div style="width: 100%; height: 600px;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>제휴계약번호</th>
										<th>제휴 시작 날짜</th>
										<th>제휴 종료 날짜</th>
										<th>제휴상태</th>

										<c:if test="${sessionScope.level == '관리자'}">
											<th>관리자승인</th>
										</c:if>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="b" items="${list}">
										<tr>
											<c:if test="${b.cooContractStat == '제휴정지'}">
												<td><a
													href="${pageContext.request.contextPath}/partnerOverdue?setNo=${b.cooContractNo}">${b.cooContractNo}</a>
												</td>
											</c:if>
											<c:if test="${b.cooContractStat != '제휴정지'}">
												<td><a
													href="${pageContext.request.contextPath}/partnerMain?setNo=${b.cooContractNo}">${b.cooContractNo}</a>
												</td>
											</c:if>

											<td>${b.cooContractStart}</td>
											<td>${b.cooContractEnd}</td>
											<td>${b.cooContractStat}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
					<c:if test="${empty list}">
						<div style="width: 100%; height: 600px;">
							<p>신청한 제휴계약이 없습니다</p>
							<a
								href="${pageContext.request.contextPath}/partnerContractNewInsert">제휴계약신청하기</a>

						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- 하단 인클루드 -->
		<c:import url="/WEB-INF/views/module/footer.jsp"></c:import>
	</div>
</body>
</html>
