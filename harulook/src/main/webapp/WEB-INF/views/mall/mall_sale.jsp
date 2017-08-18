<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
.container {
	padding: 80px 100px;
	margin-top: 100px;
}
</style>
</head>
<body>
<div class="container">구매감사합니다!</div>
 <table class="table table-striped" border="1px">
        <thead>
            <tr>
                <th>mallProName</th>
                <th>mallSaleAmount</th>
                <th>mallSaleTotal</th>
                <th>mallSaleDate</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                    
                    <td>${b.mallProName}</td>
                    <td>${b.mallSaleAmount}</td>
                    <td>${b.mallSaleTotal}</td>
                    <td>${b.mallSaleDate}</td>
                    

                </tr>
            </c:forEach>
        </tbody>
        </table>
</body>
</html>