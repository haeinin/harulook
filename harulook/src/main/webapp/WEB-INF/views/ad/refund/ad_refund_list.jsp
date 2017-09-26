<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<title>환불리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.css" />
<link rel="stylesheet" href="<c:url value="resources/css/cartoony-weather.css?ver=2" />" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat' rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/style.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="resources/js/modernizr.js"></script>
</head>
<body>
	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
		
	<div class="row">
		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
    	<div class="col-xs-1"></div>
	    <div id="div1" class="col-xs-7">
	    <h1>광고 환불 목록 </h1>
			<div id="container">
				<table id="table"
               data-toggle="table"
               data-pagination="true"
               data-search="true">
			        <thead>
			            <tr>
			            	<th>환불번호</th>
			                <th>계약번호</th>
			                <th>아이디</th>
			                <th>환불금액</th>
			                <th>환불신청일자</th>
			                <th>환불일자</th>
			                <th>환불상태 </th>
			                <th>비고</th>
			            </tr>
			        </thead>
			        <tbody>
     				   <c:forEach var="b" items="${adrefundlist}">
					   <tr>
		            		<td>${b.refundNo}</td>
		                    <td>${b.adContractNo}</td>
		                    <td>${b.userId}</td>
		                    <td>${b.refundPrice}</td>
		                    <td>${b.refundRequestDate}</td>
		                    <td>${b.refundDate}</td>
		                    <td>${b.refundStat}</td>
		                    <td>
		                    	<c:if test="${sessionScope.level=='관리자'}">
		                    	<c:if test="${b.refundStat=='결제정보입력대기'}"></c:if>
		                    	<c:if test="${b.refundStat=='환불정보입력완료'}"><a href="./approveRefund?refundNo=${b.refundNo}">환불 승인</a></c:if>
		                    	</c:if>
		                    	<c:if test="${sessionScope.level=='사업자'}">
		                    	<c:if test="${b.refundStat=='결제정보입력대기'}"><a href="./insertRefundValue?refundNo=${b.refundNo}">환불정보입력</a></c:if>
		                    	<c:if test="${b.refundStat=='환불정보입력완료'}"></c:if>
		                    	</c:if>
		                    </td>
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
 
    <div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
</body>
</html>