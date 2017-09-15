<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환불리스트</title>
<!-- 드롭다운 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
			<div id="container">
				<table class="table table-striped">
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