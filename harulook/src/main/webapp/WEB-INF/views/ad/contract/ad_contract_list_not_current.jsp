<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js""></script>
 
</head>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>위치</th>
                <th>쇼핑몰</th>
                <th>광고주 아이디</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>계약 금액</th>
                <th>계약 상태</th>
                <th>수정</th>
                <th>취소</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${adcontractlist}">
            <tr>
                    <td>${b.adContractPlace}</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 계약 수정</a>
                    <td>
                    <c:if test="${sessionScope.SA=='관리자'}">
                    	 <c:if test="${b.adContractStat=='승인대기'}"><a href="./approveContract?adConTractNo=${b.adContractNo}">계약 승인</a></c:if>
                    	 <c:if test="${b.adContractStat=='취소요청'}"><a href="./approveCancel?adConTractNo=${b.adContractNo}">취소 승인</a></c:if>
                    </c:if>
                     <c:if test="${sessionScope.SA=='광고주'}">
                    	<c:if test="${b.adContractStat=='승인대기'}"><a href="./deleteContract?adConTractNo=${b.adContractNo}&adConTractPrice=${b.adContractPrice}">계약 취소</a></c:if>
                    	<c:if test="${b.adContractStat=='광고등록대기'}"><a href="#">광고&nbsp;등록</a></c:if>
                    </c:if>
                    </td>
                    
                </tr>
                </c:forEach>
        </tbody>
    </table>