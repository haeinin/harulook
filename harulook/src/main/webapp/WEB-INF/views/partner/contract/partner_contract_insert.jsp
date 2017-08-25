<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
$(function(){
	$('#startDatepicker').datepicker({
		minDate: +0,
		dateFormat: 'yy-mm-dd'
	});
	$('#endDatepicker').datepicker({
		minDate: +0,
		dateFormat: 'yy-mm-dd'
	});
});


</script>
</head>
<body>
Insert화면입니다.
<form id="addForm" action="${pageContext.request.contextPath}/partnerContractInsert" method="post">
        <div class="form-group">
            <label for="userId">계약자 아이디 </label>
            <input class="form-control" name="userId" id="userId" type="text"/>
        </div>
        <div class="form-group">
            <label for="managerId">관리자 아이디 </label>
            <input class="form-control" name="managerId" id="managerId" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractDc">제공할 쿠폰 할인율 </label>
            <input class="form-control" name="cooContractDc" id="cooContractDc" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">수수료 정책 </label>
            <input class="form-control" name="cooContractFee" id="cooContractFee" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">계약 시작 날짜 </label>
            <input class="form-control" name="cooContractStart" id="startDatepicker" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">계약 종료 날짜 </label>
            <input class="form-control" name="cooContractEnd" id="endDatepicker" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractPayDay">수수료 지급 날짜 (매월 ?일) </label>
            <input class="form-control" name="cooContractPayDay" id="cooContractPayDay" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractCode">제공할 쿠폰 입력코드 </label>
            <input class="form-control" name="cooContractCode" id="cooContractCode" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractImg">쇼핑몰 배너 이미지</label>
            <input class="form-control" name="cooContractImg" id="cooContractImg" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractLink">배너 클릭시 이동할 URL</label>
            <input class="form-control" name="cooContractLink" id="cooContractLink" type="text"/>
        </div>
        <div>
        	 <input class="btn btn-default" id="addButton" type="submit" value="글입력"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/partnerContractList">계약목록</a>
        </div>
    </form>
</body>
</html>