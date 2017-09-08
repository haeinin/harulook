<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="stylesheet" href="<c:url value="resources/css/partner-menu.css" />" type="text/css">
</head>
<div style="margin-top:1.5em;"> 
	<nav class="cbp-spmenu cbp-spmenu-vertical">
		<h3>Menu</h3>
		<a href="${pageContext.request.contextPath}/partnerContractInsert">제휴신청하기</a>
		<a href="${pageContext.request.contextPath}/partnerContractDetail?cooContractNo=${setNo}">제휴현황보기</a>
		<a href="${pageContext.request.contextPath}/partnerContractBillList">결제예정금액</a>
		<a href="${pageContext.request.contextPath}/partnerPayList">제휴결제내역</a>
		<a href="${pageContext.request.contextPath}/StatsView">쇼핑몰통계</a>
		<a href="${pageContext.request.contextPath}/getBuyRate">구매율보기</a>
		<a href="${pageContext.request.contextPath}/partnerHome">제휴 메인으로</a>
	</nav>
</div>