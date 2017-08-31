<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
.cbp-spmenu {
	background: #CDF4ED;
}

.cbp-spmenu h3 {
	font-size: 1.5em;
	padding: 20px;
	margin: 0;
	font-weight: 300;
	background: #8BE5D4;
}

.cbp-spmenu-vertical {
	width: 140px;
	height: 100%;
	top: 0;
	z-index: 1000;
}

.cbp-spmenu-vertical a {
	border-bottom: 1px solid #77AF9C;
	padding: 1em;
}

.cbp-spmenu a {
	display: block;
	color: #08211D;
	font-size: 1.0em;
	font-weight: 300;
}

.cbp-spmenu a:hover {
	background: #9ee8d5;
}
</style>
</head>
<div>
	<%-- <nav class="cbp-spmenu cbp-spmenu-vertical">

		<h3>Menu</h3>
		<a href="${pageContext.request.contextPath}/partnerContractInsert">제휴신청하기</a>
		<a href="${pageContext.request.contextPath}/partnerContractList">제휴현황보기</a> 
		<a href="${pageContext.request.contextPath}/partnerContractBillList">결제예정금액</a> 
		<a href="${pageContext.request.contextPath}/partnerPayMain">제휴결제내역</a> 
		<a href="${pageContext.request.contextPath}/partnerStatsMain">쇼핑몰통계</a>
		<a href="${pageContext.request.contextPath}/">사과</a>
	</nav> --%>
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