<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>광고리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js""></script>
 
</head>
<body>
<div class="container">
    <h1>광고 목록</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>광고 게시물 번호</th>
                <th>계약번호</th>
                <th>광고 상품1</th>
                <th>광고 상품2</th>
                <th>최저온도</th>
                <th>최고온도</th>
                <th>이미지</th>
                <th>광고등록일자</th>
                <th>광고내용</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${adboardlist}">

            <tr>
                    <td>${b.adBoardNo}</td>
                    <td>${b.adContractNo}</td>
                    <td><a href="./selectAdBoardGoods?adBoardGoodsNo=${b.adBoardGoods1}">${b.adBoardGoods1}</a></td>
                    <td><a href="./selectAdBoardGoods?adBoardGoodsNo=${b.adBoardGoods2}">${b.adBoardGoods2}</a></td>
                    <td>${b.adBoardTempMin}</td>
                    <td>${b.adBoardTempMax}</td>
                    <td><img alt="no Image" src="${b.adBoardImage}"></td>
                    <td>${b.adBoardDate}</td>
                    <td>${b.adBoardContent}</td>
                    <td><a>광고 수정</a></td>
                </tr>
                </c:forEach>
        </tbody>
    </table>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/adPay">광고 결제</a>
    </div>
</div>
</body>
</html>