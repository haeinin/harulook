<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 
<script>
    $(function() {
    	var selectedday;
    	$("#date").change(function(){
    		selectedday = this.value;
    		alert(selectedday);
    		document.getElementById('total').innerHTML = selectedday*50000;
    	});
        $("#testDatepicker" ).datepicker({
        	minDate: +0,
        });
    
    });
    	
</script>
<title>BOARD ADD(spring mvc + mybatis 방식)</title>
</head>
<body>
<div class="container">
    <h1>광고 결제(spring mvc + mybatis 방식)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/boardAdd" method="post">
    <div class="form-group">
            <label for="boardPw">광고위치</label>
            <select id="adPlace3">
            <option value=""></option>
            <option value="1">첫번째</option>
            <option value="2">두번째</option>
            <option value="3">세번째</option>
            </select> 
        </div>
    <div class="form-group">
            <label for="boardPw">계약일수</label>
            <select id="date">
            <option value=""></option>
            <option value="3">3일</option>
            <option value="7">7일</option>
            <option value="30">30일</option>
            </select> 
        </div>
        <div class="form-group">
            <label for="boardPw">시작일자</label>
            <input type="text" id="testDatepicker">  
        </div>
        
        <div class="form-group">
            <label for="boardContent">하루당 광고금액 :</label>
            50000
        </div>
        <div class="form-group">
            <label for="boardName">총 금액 :</label>
            <span id="total"></span>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>