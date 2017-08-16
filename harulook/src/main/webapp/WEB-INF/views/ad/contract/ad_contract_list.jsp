<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title> LIST(spring mvc + mybatis 방식)</title>
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
    $(function() {
    	var selectedday;
    	var price;
    	
    	$("#date").change(function(){
    		$('#price').load()
    		selectedday = this.value;
    		alert(selectedday);
    		document.getElementById('total').innerHTML = selectedday*50000;
    	});
    	$('#payComplete').click(function(){
    		alert('결제가 완료되었습니다.')	
    	});
    	
        $('#testDatepicker').datepicker({
        	minDate: +0,
        });
    
    });
    	
</script>
<script>
	$(document).ready(function(){
		$('#adPay').click(function(){
			alert('클릭되었습니다');
			})	
		})
</script>
</head>
<body>
<div class="container">
    <h1>현재 광고 목록</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>위치</th>
                <th>쇼핑몰</th>
                <th>광고주 아이디</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>계약 금액</th>
                <th>계약 상태</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${adcontractlist}">
            <c:choose>
            <c:when test="${b.adContractPlace=='1'}">
            <tr>
                    <td>1</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${b.adContractPlace=='2'}">
            <tr>
                    <td>2</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
            <c:choose>
            <c:when test="${b.adContractPlace=='3'}">
            <tr>
                    <td>3</td>
                    <td>${b.userBsName}</td>
                    <td>${b.userId}</td>
                    <td>${b.adContractStart}</td>
                    <td>${b.adContractEnd}</td>
                    <td>${b.adContractPrice}</td>
                    <td>${b.adContractStat}</td>
                    <td><a>광고 수정</a></td>
                </tr>
            </c:when>
            </c:choose>
                </c:forEach>
        </tbody>
    </table>
    <div>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#totalModal">결제금액산정</button>
    </div>
    <!-- totalModal -->
  <div class="modal fade" id="totalModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결제 금액 산출</h4>
        </div>
        <div class="modal-body">
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
            <span id="price"></span>
        </div>
        <div class="form-group">
            <label for="boardName">총 금액 :</label>
            <span id="total"></span>
        </div>
        <div>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#payModal">결제하기</button>
            <input class="btn btn-default" id="totalComplete" type="button" value="완료"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
        </div>
    </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="totalModal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
      <!-- payModal -->
  <div class="modal fade" id="payModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결제 금액 산출</h4>
        </div>
        <div class="modal-body">
          <form id="addForm" action="${pageContext.request.contextPath}/boardAdd" method="post">
          </form>
        </div>
        <div>
            <input class="btn btn-default" id="payComplete" type="button" value="완료"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="payModal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>