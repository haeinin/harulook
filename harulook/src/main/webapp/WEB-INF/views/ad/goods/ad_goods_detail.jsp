<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<title>상품 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js""></script>
 
</head>
<body>
<div class="container">
    <h1>상품 상세보기</h1>
    <table class="table">
            <tr>
                <td>상품번호</td>
                <td>${adgoods.adGoodsNo}</td>
            </tr>
            <tr>
                    <td>이미지</td>
                    <td><img alt="no Image" src="${adgoods.adGoodsImage}" width="500px" height="500px"></td>
            </tr>
            <tr>
                	<td>링크</td>
                    <td><input type="text" value="${adgoods.adGoodsLink}" readonly></td>
            </tr>
    </table>
    <form action="./updateGoodsForm" method="POST">
    <input type="hidden" name="adBoardGoodsNo" value="${adgoods.adGoodsNo}">
    <button>수정하기</button>
    </form>
</div>
</body>
</html>