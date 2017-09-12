<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<!-- 상단 인클루드 -->
<div class="row">
<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
</div>
    <!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-2">
	    <c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
	    </div>
	    
	    <div class="col-xs-8">
	    <div class="row" >
				<div class="col-md-1"></div>
				<div class="col-md-9" style="margin-top:50px">
	<table class="table table-bordered">
		<tr>
			<td></td>
			<td>스키니진</td>
			<td>러블리 원피스</td>
			<td>체크 남방</td>
			<td>그린 체크 남방</td>
			<td>블랙 슬랙스</td>
			<td>핏좋은 티셔츠</td>
		</tr>
		
			<tr>
			<td>총 판매량</td>
			<c:forEach var="m" items="${m}">
				<td>${m.get("total")}</td>
			</c:forEach>
			</tr>
	
			<tr>
			<td>유입판매량</td>
			<c:forEach var="m" items="${m}">
				<td>${m.get("influx")}</td>
			</c:forEach>
			</tr>
			<tr>
			<td>구매비율</td>
			<c:forEach var="m" items="${m}">
				<td>${m.get("rate")}%</td>
			</c:forEach>
			</tr>
	</table>
	</div>
	</div>
</div>
</div>




</body>
</html>