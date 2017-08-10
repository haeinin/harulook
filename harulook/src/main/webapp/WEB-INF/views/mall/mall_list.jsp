<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
쇼핑몰 리스트
 <table class="table table-striped">
        <thead>
            <tr>
                <th>mall_pro_no</th>
                <th>mall_pro_name</th>
                <th>mall_pro_price</th>
                <th>mall_pro_img</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/mallDetail?mallProNo=${b.mallProNo}">${b.mallProNo}</a></td>
                    <td>${b.mallProName}</td>
                    <td>${b.mallProPrice}</td>
                    <td>${b.mallProImg}</td>
                    

                </tr>
            </c:forEach>
        </tbody>
</body>
</html>