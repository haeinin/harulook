<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

 <table border="1px">
        <thead>
            <tr>
                <th>제휴계약번호</th>
                <th>제휴 시작 날짜</th>
                <th>제휴 종료 날짜</th>
                <th>제휴상태</th>

                <c:if test="${sessionScope.level == '관리자'}">
                <th>관리자승인</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/partnerStatsMain?cooContractNo=${b.cooContractNo}">${b.cooContractNo}</a></td>
                    <td>${b.cooContractStart}</td>
                    <td>${b.cooContractEnd}</td>
                    <td>${b.cooContractStat}</td>
                </tr>
            </c:forEach>
        </tbody>
        </table>
</body>
</html>