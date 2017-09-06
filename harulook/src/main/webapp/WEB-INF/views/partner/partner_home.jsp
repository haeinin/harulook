<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
    <!-- 상단 인클루드 -->
    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    
    <!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
	    <div class="col-xs-9">

			<c:if test="${!empty list}">

				<table class="table">
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
								<td><a
									href="${pageContext.request.contextPath}/partnerMain?setNo=${b.cooContractNo}">${b.cooContractNo}</a></td>
								<td>${b.cooContractStart}</td>
								<td>${b.cooContractEnd}</td>
								<td>${b.cooContractStat}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${empty list}">
				<p>신청한 제휴계약이 없습니다</p>
				<a href="${pageContext.request.contextPath}/partnerContractInsert">제휴계약신청하기</a>
			</c:if>
			</div>
 </div>
</body>
</html>
