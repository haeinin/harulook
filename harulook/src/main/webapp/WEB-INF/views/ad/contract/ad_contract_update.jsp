<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title> LIST(spring mvc + mybatis 방식)</title>
<!-- 해더인클루드 -->
	<c:import url="../../module/header.jsp"></c:import>	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
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
    	$('#totalComplete').click(function(){
    		$('#contractForm').submit();
    	});
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
    				$('#priceTotal').val((period*$('#pricePerDay').val())*(1-data/100));
    			}
    		})
    	/****************************************/	
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
        });
        $("#datepicker2").datepicker({
        	dateFormat: 'yy-mm-dd'
        });
    	/**********************************************/
    	/* 광고 계약 취소 시 환불테이블과 계약 상태를 바꿔줌 */

    			
   	});

   
    	
</script> 
</head>

	<!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
	    <div id="div1" class="col-xs-9">    
 <form id="contractForm" action="./adContractUpdate" method="POST">
    <div class="form-group">
	        <label for="adType">광고종류</label>
	        <select id="adType" name="adCostNo">
	        <option value=""></option>
	        <option value="ad_cost_01" selected="selected">옷</option>
	        <option value="ad_cost_03">아이템</option>
	        </select> 
    </div>
    <div class="form-group">
            <label for="adPlace">광고위치</label>
            <select id="adPlace" name="adContractPlace">
            <option value=""></option>
            <c:if test="${adcontract.adContractPlace==1}">
            <option value="1" selected="selected">첫번째</option>
            <option value="2">두번째</option>
            <option value="3">세번째</option>
            </c:if>
            <c:if test="${adcontract.adContractPlace==2}">
            <option value="1">첫번째</option>
            <option value="2" selected="selected">두번째</option>
            <option value="3">세번째</option>
            </c:if>
            <c:if test="${adcontract.adContractPlace==3}">
            <option value="1">첫번째</option>
            <option value="2">두번째</option>
            <option value="3" selected="selected">세번째</option>
            </c:if>
            </select> 
        </div>
    <div class="form-group">
            <label for="date">계약일수</label>	
            <select id="date" name="adDcNo">
            <option value=""></option>
            <c:if test="${adcontract.adDcNo=='ad_dc_01'}">
            <option value="ad_dc_01" selected="selected">3일</option>
            <option value="ad_dc_02">7일</option>
            <option value="ad_dc_03">30일</option>
            </c:if>
            <c:if test="${adcontract.adDcNo=='ad_dc_02'}">
            <option value="ad_dc_01" >3일</option>
            <option value="ad_dc_02" selected="selected">7일</option>
            <option value="ad_dc_03">30일</option>
            </c:if>
            <c:if test="${adcontract.adDcNo=='ad_dc_03'}">
            <option value="ad_dc_01">3일</option>
            <option value="ad_dc_02">7일</option>
            <option value="ad_dc_03" selected="selected">30일</option>
            </c:if>
            
            </select> 
        </div>
        <div class="form-group">
            <label for="boardPw">시작일자</label>
            <input type="text" id="datepicker" name="adContractStart" value="${adcontract.adContractStart}">  
        </div>
        <div class="form-group">
            <label for="boardPw">종료일자</label>
            <input type="text" id="datepicker2" name="adContractEnd" value="${adcontract.adContractEnd}">  
        </div>
        
        <div class="form-group">
            <label for="pricePerDay">하루당 광고금액 :</label>
            <input type="text" id="pricePerDay" value="100000" readonly>
        </div>
        <div class="form-group">
            <label for="dcForPrice">할인율 :</label>
            <c:if test="${adcontract.adDcNo=='ad_dc_01'}">
            <input type="text" id="dcForPrice" value="1" readonly>
            </c:if>
            <c:if test="${adcontract.adDcNo=='ad_dc_02'}">
            <input type="text" id="dcForPrice" value="5" readonly>
            </c:if>
            <c:if test="${adcontract.adDcNo=='ad_dc_03'}">
            <input type="text" id="dcForPrice" value="10" readonly>
            </c:if>
            
        </div>
        <div class="form-group">
            <label for="priceTotal">총 금액 :</label>
            <input type="text" id="priceTotal" name="adContractPrice" value="${adcontract.adContractPrice}" readonly>
            <input type="hidden" name="adContractNo" value="${adcontract.adContractNo}">
        </div>
        <div>
            <button class="btn btn-default" id="totalComplete">완료</button>
            <a class="btn btn-danger" href="./deleteContract?adContractNo=${adcontract.adContractNo}">계약취소</a>
            
        </div>
        </form>
			</div>	
		 
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import>