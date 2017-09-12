<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="<c:url value="resources/css/partner-menu.css" />" type="text/css">
</head>
<div style="margin-top:1.5em;"> 
	<nav class="side-nav">
		<a class="side-nav-button" href="${pageContext.request.contextPath}/partnerHome"><i class="fa fa-home i-size"></i>&nbsp; &nbsp;제휴 메인으로</a>
		<a class="side-nav-button " href="${pageContext.request.contextPath}/partnerContractInsert"><i class="fa fa-plus i-size"></i>&nbsp; &nbsp;제휴신청하기</a>
		<a class="side-nav-button " href="${pageContext.request.contextPath}/partnerContractDetail?cooContractNo=${setNo}"><i class="fa fa-clipboard i-size"></i>&nbsp; &nbsp;제휴현황보기</a>
		<a class="side-nav-button " href="${pageContext.request.contextPath}/partnerContractBillList"><i class="fa fa-calendar-check-o i-size"></i>&nbsp; &nbsp;결제예정금액</a>
		<a class="side-nav-button " href="${pageContext.request.contextPath}/partnerPayList"><i class="fa fa-credit-card i-size"></i>&nbsp; &nbsp;제휴결제내역</a>
		<a class="side-nav-button " href="${pageContext.request.contextPath}/StatsView"><i class="fa fa-bar-chart i-size"></i>&nbsp; &nbsp;쇼핑몰통계</a>
		<a class="side-nav-button " href="${pageContext.request.contextPath}/getBuyRate"><i class="fa fa-line-chart i-size"></i>&nbsp; &nbsp;구매율보기</a>

	</nav>	
</div>