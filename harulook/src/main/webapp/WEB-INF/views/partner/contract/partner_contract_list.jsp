<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>제휴계약 현황 </title>
</head>
<body>

 <table border="1px">
        <thead>
            <tr>
                <th>제휴계약번호</th>
                <th>제휴업체 담당자 아이디</th>
                <th>하루룩 담당자 아이디</th>
                <th>제휴 시작 날짜</th>
                <th>제휴 종료 날짜</th>
                <th>제휴 계약 날짜</th>
                <th>제공할 쿠폰 할인율</th>
                <th>수수료 정책</th>
                <th>수수료 결제 날짜</th>
                <th>쿠폰 코드</th>
                <th>쇼핑몰 배너</th>
                <th>배너URL</th>
                <th>제휴상태</th>
                <th>결제상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/partnerContractDetail?cooContractNo=${b.cooContractNo}">${b.cooContractNo}</a></td>
                    <td>${b.userId}</td>
                    <td>${b.managerId}</td>
                    <td>${b.cooContractStart}</td>
                    <td>${b.cooContractEnd}</td>
                    <td>${b.cooContractDate}</td>
                    <td>${b.cooContractDc}</td>
                    <td>${b.cooContractFee}</td>
                    <td>${b.cooContractPayDay}</td>
                    <td>${b.cooContractCode}</td>
                    <td>${b.cooContractImg}</td>
                    <td>${b.cooContractLink}</td>
                    <td>${b.cooContractStat}</td>
                    <td>${b.cooContractPayStat}</td>
 
                </tr>
            </c:forEach>
        </tbody>
        </table>
</body>
</html>