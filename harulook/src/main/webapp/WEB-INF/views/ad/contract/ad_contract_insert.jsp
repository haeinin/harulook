<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 <!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>광고계약 신청</title>
</head>
<body>
<div class="container">
    <h1>광고계약 입력(spring mvc + mybatis 방식)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/adContractInsert" method="post">
        <div class="form-group">
            <label for="boardContent">광고 위치</label>
            <select>
            	<option>위치 1</option>
            	<option>위치 2</option>
            	<option>위치 3</option>
            </select>
        </div>
        <div class="form-group">
            <label for="boardName">광고 시작 일자</label>
            <input class="form-control" name="adContractStart" type="date"/>
        </div>
        <div class="form-group">
            <label for="boardPw">광고 종료 일자</label>
            <input class="form-control" name="adContractEnd" type="date"/>
        </div>
        <div class="form-group">
            <label for="boardPw">광고 계약 일자</label>
            <input class="form-control" name="adContractDate" type="date"/>
        </div>
        <div class="form-group">
            <label for="boardPw">광고 단가</label>
            <input class="form-control" name="adCostNo" type="text"/>
        </div>
        <div class="form-group">
            <label for="boardPw">광고할인율</label>
            <input class="form-control" name="adDcNo" type="text"/>
        </div>
        <div class="form-group">
            <label for="boardPw">결제예정금액</label>
            <input class="form-control" name="adContractPrice" type="text"/>
        </div>
        <div class="form-group">
            <label for="boardPw">광고상태</label>
            <input class="form-control" name="adContractStat" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" type="submit" value="계약신청"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/adContractList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>

