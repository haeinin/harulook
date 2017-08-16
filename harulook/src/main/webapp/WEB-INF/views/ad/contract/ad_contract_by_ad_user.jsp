<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js""></script>
 
</head>
<body>
<div class="container">
    <h1>나의 광고</h1>
    <h2>등록된 광고</h2>
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
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${adcontractlistbyusercurrent}">
            <c:choose>
            <c:when test="${b.adContractPlace=='1'}">
            <tr>
                    <td>1</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${b.adContractPlace=='2'}">
            <tr>
                    <td>2</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${b.adContractPlace=='3'}">
            <tr>
                    <td>3</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
                </c:forEach>
        </tbody>
    </table>
    <h2>신청된 광고</h2>
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
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${adcontractListbyuserother}">
            <c:choose>
            <c:when test="${b.adContractPlace=='1'}">
            <tr>
                    <td>1</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${b.adContractPlace=='2'}">
            <tr>
                    <td>2</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${b.adContractPlace=='3'}">
            <tr>
                    <td>3</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
                </c:forEach>
        </tbody>
    </table>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/adPay">광고 결제</a>
    </div>
</div>
</body>
</html>