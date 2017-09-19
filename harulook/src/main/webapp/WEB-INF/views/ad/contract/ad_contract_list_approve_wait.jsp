<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
    <table id="table"
               data-toggle="table"
               data-pagination="true"
               data-search="true">
        <thead>
            <tr>
                <th>위치</th>
                <th>쇼핑몰</th>
                <th>광고주 아이디</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>계약 금액</th>
                <th>계약 상태</th>
                <th>수정하기</th>
                <th></th>
            </tr>
        </thead>
        <tbody>							
            <c:forEach var="b" items="${adcontractlistapprovewait}">
            <tr>
                    <td>${b.adContractPlace}</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td>
                    <c:if test="${sessionScope.level=='관리자'}">
                    	 <c:if test="${b.adContractStat=='승인대기'}"><a class="btn btn-info" href="./approveContract?adContractNo=${b.adContractNo}">계약 승인</a></c:if>
                    	 <c:if test="${b.adContractStat=='취소요청'}"><a class="btn btn-info" href="./approveCancel?adConTractPrice=${b.adContractPrice}&adContractNo=${b.adContractNo}">취소 승인</a></c:if>
                    </c:if>
                     <c:if test="${sessionScope.level=='사업자'}">
                    	<c:if test="${b.adContractStat=='승인대기'}"><a href="./adContractUpdate?adContractNo=${b.adContractNo}">수정하기</a></c:if>
                    	<c:if test="${b.adContractStat=='광고등록대기'}"><a class="btn btn-info" href="./insertAdBoard?adContractNo=${b.adContractNo}">광고&nbsp;등록</a></c:if>
                    </c:if>
                    </td>
					<c:if test="${sessionScope.level=='사업자'}">
                    <c:if test="${b.adContractStat=='광고대기'}">
                    <td>
                    <a class="btn btn-info" href="./adBoardUpdate?adContractNo=${b.adContractNo}">수정하기</a>
                    </td>
                    </c:if>
                    </c:if>                         
                </tr>
                </c:forEach>
        </tbody>
    </table>