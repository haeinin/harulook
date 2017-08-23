<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            <c:forEach var="b" items="${adcontractcurrentlist}">
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