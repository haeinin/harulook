<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>제휴계약 수정하기</title>
</head>
<body>
 <!-- 상단 인클루드 -->
    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    
    <!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-1">
	    <c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
	    </div>
	    <div class="col-xs-1"></div>
	    <div class="col-xs-8">
	    <div class="container">
<div class="container">
    <form id="modifyForm" action="${pageContext.request.contextPath}/partnerContractUpdate" method="post">
        <div class="form-group">
            <label for="cooContractNo">계약번호 </label>
            <input class="form-control" name="cooContractNo" id="cooContractNo" value="${dto.cooContractNo}"type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">계약 시작 날짜 </label>
            <input class="form-control" name="cooContractStart" id="cooContractFee" value="${dto.cooContractStart}" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">계약 종료 날짜 </label>
            <input class="form-control" name="cooContractEnd" id="cooContractFee" value="${dto.cooContractEnd}" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractDc">제공할 쿠폰 할인율 </label>
            <input class="form-control" name="cooContractDc" id="cooContractDc" value="${dto.cooContractDc}" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">수수료 정책 </label>
            <input class="form-control" name="cooContractFee" id="cooContractFee" value="${dto.cooContractFee}" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractPayDay">수수료 지급 날짜 (매월 ?일) </label>
            <input class="form-control" name="cooContractPayDay" id="cooContractPayDay" value="${dto.cooContractPayDay}" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractImg">쇼핑몰 배너 이미지</label>
            <input class="form-control" name="cooContractImg" id="cooContractImg" value="${dto.cooContractImg}" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractLink">배너 클릭시 이동할 URL</label>
            <input class="form-control" name="cooContractLink" id="cooContractLink" value="${dto.cooContractLink}" type="text"/>
        </div>
        <div>
        	 <input class="btn btn-default" id="addButton" type="submit" value="수정신청"/>
        </div>
    </form>
</div>
</div>
</div>
</div>
</body>
</html>
