<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 드롭다운 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>광고계약</title>


<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script type="text/javascript">
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
	
<script>
    $(function() {
    	var price;
    	var dc;
    	var period;
    	var startdate;
    	var enddate;
    	var calcprice;
    	/* 누락된 값이 없게 하기 위한 유효성 검사 */
    	$('#priceOk').click(function(){
    		if($('#adType').val()==""){
    			alert('광고종류를 선택하세요');
    			$('#adType').focus();
    		}else if($('#adPlace').val()==""){
    			alert('광고기간을 선택하세요');
    			$('#adPlace').focus();
    		}else if($('#date').val()==""){
    			alert('계약일수를 선택하세요');
    			$('#date').focus();
    		}else if($('#datepicker').val()==""){
    			alert('시작일자를 선택하세요');
    			$('#datepicker').focus();
    		}
    		if($('#adType').val()!="" && $('#adPlace').val()!="" && $('#date').val()!="" && $('#datepicker').val()!="" ){
				$('#contractForm').submit();
			}
    	})
    	/****************************/
    	/* 총 합계를 계산해 놓으면 텍스트박스에 NaN이라는 값이 출력되서 날짜를 선택해야 총 합계가 나오게 만듬 */
    	$('#date').change(function(){

			if($('#date').val() == 'ad_dc_01'){
				period = 3;
			}else if($('#date').val() == 'ad_dc_02'){
				period = 7;
			}else if($('#date').val() == 'ad_dc_03'){
				period = 30;
			}
			
		/* 기간을 선택했을때 ajax를 이용하여 기간별 할인율을 전송받음*/
			$.ajax({
    			type : "POST",
    			url : "./getDc",
    			data : { adCostNo : $('#date').val()},
    			success : function(data){
    				console.log("수수료 : " + data);
    				dc = data;
    				$('#dcForPrice').val(data);
    				calc();
    				$('#priceTotal').val(calcprice);
    			}
    		})
    		enddate = new Date($('#datepicker').val());
        	enddate.setDate(enddate.getDate() + period);
        	var year = enddate.getFullYear();
        	var month = ((enddate.getMonth()+101)+"").substring(1,3);
			var day = enddate.getDate();
        	console.log('년 :' + year);
        	console.log('월 :' + month);
        	console.log('일 :' + day);
        	console.log(enddate);
        	console.log(year + '-' + month + '-' + day);
        	if(day < 10)
        	$('#datepicker2').val(year+'-'+month+'-0'+day);
        	else
        	$('#datepicker2').val(year+'-'+month+'-'+day);
        	calc();
    	/****************************************/
    	calc();
    	})
    	/*****************************************************************/
    	/* 광고종류를 선택했을때 ajax를 이용하여 광고에 해당하는 하루 금액을 전송받음 */
    	$("#adType").change(function(){
    		$.ajax({
    			type : "POST",
    			url : "./getPrice",
    			data : { adtype : $('#adType').val()},
    			success : function(data){
    				console.log("하루당 광고비용 : " + data);
    				price = data;
    				$('#pricePerDay').val(data);
    				calc();
    				$('#priceTotal').val(calcprice);
    			}
    		})	
    	});
    	/***********************************************/
    	
    	/* 날짜 선택시 옵션 지정 (선택가능한 최소날짜 오늘부터, 날짜 형식 지정)*/
        $("#datepicker").datepicker({
        	minDate: +0,
        	dateFormat: 'yy-mm-dd'
        });
        $("#datepicker").change(function(){
        	if($('#date').val() == 'ad_dc_01'){
				period = 3;
			}else if($('#date').val() == 'ad_dc_02'){
				period = 7;
			}else if($('#date').val() == 'ad_dc_03'){
				period = 30;
			}
        	enddate = new Date($(this).val());
        	enddate.setDate(enddate.getDate() + period);
        	var year = enddate.getFullYear();
        	var month = ((enddate.getMonth()+101)+"").substring(1,3);
			var day = enddate.getDate();
        	console.log('년 :' + year);
        	console.log('월 :' + month);
        	console.log('일 :' + day);
        	console.log(enddate);
        	console.log(year + '-' + month + '-' + day);
        	if(day < 10)
        	$('#datepicker2').val(year+'-'+month+'-0'+day);
        	else
        	$('#datepicker2').val(year+'-'+month+'-'+day);
        	calc();
        });
        $("#datepicker2").datepicker({
        	dateFormat: 'yy-mm-dd'
        });
    	/**********************************************/
    	/* 광고 계약 취소 시 환불테이블과 계약 상태를 바꿔줌 */

    			
  /* input에 담겨있는 값을 가지고 총 결제금액에 계산 해주는 메서드  */
	function calc(){
		if($('#date').val() == 'ad_dc_01'){
			period = 3;
		}else if($('#date').val() == 'ad_dc_02'){
			period = 7;
		}else if($('#date').val() == 'ad_dc_03'){
			period = 30;
		}
		calcprice = $('#pricePerDay').val()*period*(1-$('#dcForPrice').val()/100);
		console.log('총 계산된 금액 ' + calcprice);
	};
 	});
   
    	
</script> 
</head>
<body>
	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
	<!-- 바디 인클루드 -->
    <div class="row">
		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
	    <div class="col-xs-1"></div>
	    <div id="div1" class="col-xs-7">   
	    	<h1>광고 계약 입력</h1><br>
		 	<form id="contractForm" class="well well-sm" action="./adContractInsert" method="POST">
		    <div class="form-group">
			        <label for="adType">광고종류</label>
			        <select id="adType" name="adCostNo">
			        <option value=""></option>
			        <option value="ad_cost_01">옷</option>
			        <option value="ad_cost_03">아이템</option>
			        </select> 
		    </div>
		    <div class="form-group">
		            <label for="adPlace">광고위치</label>
		            <select id="adPlace" name="adContractPlace">
		            <option value=""></option>
		            <option value="1">첫번째</option>
		            <option value="2">두번째</option>
		            <option value="3">세번째</option>
		            </select> 
		        </div>
		    <div class="form-group">
		            <label for="date">계약일수</label>
		            <select id="date" name="adDcNo">
		            <option value=""></option>
		            <option value="ad_dc_01">3일</option>
		            <option value="ad_dc_02">7일</option>
		            <option value="ad_dc_03">30일</option>
		            </select> 
		        </div>
		        <div class="form-group">
		            <label for="boardPw">시작일자</label>
		            <input type="text" id="datepicker" name="adContractStart">  
		        </div>
		        <div class="form-group">
		            <label for="boardPw">종료일자</label>
		            <input type="text" id="datepicker2" name="adContractEnd" readonly>  
		        </div>
		        
		        <div class="form-group">
		            <label for="pricePerDay">하루당 광고금액 :</label>
		            <input type="text" id="pricePerDay" readonly>
		        </div>
		        <div class="form-group">
		            <label for="dcForPrice">할인율 :</label>
		            <input type="text" id="dcForPrice" readonly>
		        </div>
		        <div class="form-group">
		            <label for="priceTotal">총 금액 :</label>
		            <input type="text" id="priceTotal" name="adContractPrice" readonly>
		        </div>
		        <div>
		        <button class="btn btn-info btn-lg" type="button" id="priceOk">결제하기</button>
		            <input class="btn btn-default" type="reset" value="초기화"/>
		        </div>
		        </form>

			</div>	
		
		<div class="col-xs-1"></div> 
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import>
</body>
</html>