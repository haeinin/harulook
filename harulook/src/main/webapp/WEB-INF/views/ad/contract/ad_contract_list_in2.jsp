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
    	var dc;
    	/* 총 합계를 계산해 놓으면 텍스트박스에 NaN이라는 값이 출력되서 날짜를 선택해야 총 합계가 나오게 만듬 */
    	$('#date').change(function(){

			if($('#date').val() == 'ad_dc_01'){
				selectedday = 1;
			}else if($('#date').val() == 'ad_dc_02'){
				selectedday = 5;
			}else if($('#date').val() == 'ad_dc_03'){
				selectedday = 7;
			}
			$.ajax({
    			type : "POST",
    			url : "./getDc",
    			data : { adCostNo : $('#date').val()},
    			success : function(data){
    				console.log("수수료 : " + data);
    				dc = data;
    				$('#dcForPrice').val(data);
    				$('#priceTotal').val((selectedday*$('#pricePerDay').val())*(1-data/100));
    			}
    		})
    		
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
        $('#Datepicker').datepicker({
        	minDate: +0,
        	dateFormat: 'yy-mm-dd'
        });
    	/**********************************************/
    	/* 광고 계약 취소 시 환불테이블과 계약 상태를 바꿔줌 */

    			
    	});
   
    	
</script> 
</head>
<body>
<div class="container">
    <h1>현재 광고 목록</h1>
   <c:import url="../contract/ad_contract_list_current.jsp"></c:import>
   	<h1>광고예정 목록</h1>
   <c:import url="../contract/ad_contract_list_not_current.jsp"></c:import>
   <h1>광고 등록하기</h1>
   <c:import url="../contract/ad_contract_insert.jsp"></c:import>
   <c:import url="../contract/ad_contract_cancel.jsp"></c:import>
  </div>
</body>
</html>