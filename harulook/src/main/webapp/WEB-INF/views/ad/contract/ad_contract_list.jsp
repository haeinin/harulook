<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script type="text/javascript" src="resources/js/adBoardDetail.js"></script>
<script>
function showDetail(data) {
 	$('#place1detail').click(function(){
		var adContractNo = '${adContractPlace1.adContractNo}';
		console.log('adContractNo : ',adContractNo,'');
		var boardDetailRequest = $.ajax({
			url : './adBoardDetail',
			method : 'get',
			data :{'adContractNo' : adContractNo},
			datatype : 'json',
			success : function(contractData) {
				console.log(contractData);
				adBoardDetail(contractData);
				
			}
		});
		$('#adModal').modal();
	});
 	$('#place2detail').click(function(){
		var adContractNo = '${adContractPlace2.adContractNo}';
		console.log('adContractNo : ',adContractNo,'');
		var boardDetailRequest = $.ajax({
			url : './adBoardDetail',
			method : 'get',
			data :{'adContractNo' : adContractNo},
			datatype : 'json',
			success : function(contractData) {
				console.log(contractData);
				adBoardDetail(contractData);
				
			}
		});
		$('#adModal').modal();
	});
 	$('#place3detail').click(function(){
		var adContractNo = '${adContractPlace3.adContractNo}';
		console.log('adContractNo : ',adContractNo,'');
		var boardDetailRequest = $.ajax({
			url : './adBoardDetail',
			method : 'get',
			data :{'adContractNo' : adContractNo},
			datatype : 'json',
			success : function(contractData) {
				console.log(contractData);
				adBoardDetail(contractData);
				
			}
		});
		$('#adModal').modal();
	});
}
$(document).ready(function(){
	showDetail(null);
	
	$('#place1detail').click(function(){
		$('#adModal').modal();
	})
	$('#place2detail').click(function(){
		$('#adModal').modal();
	})
	$('#place3detail').click(function(){
		$('#adModal').modal();
	})
	$('#adcontractsoonlist').hide();
	$('#adcontractapprovewaitlist').hide();
	$('#adcontractadboardinsertwaitlist').hide();
	$('#adcontractcancelrequestlist').hide();
	$('#adcontractsoonBtn').click(function(){
		$('#adcontractsoonlist').show();
		$('#adcontractapprovewaitlist').hide();
		$('#adcontractadboardinsertwaitlist').hide();
		$('#adcontractcancelrequestlist').hide();
	});
	$('#adcontractapprovewaitBtn').click(function(){
		$('#adcontractsoonlist').hide();
		$('#adcontractapprovewaitlist').show();
		$('#adcontractadboardinsertwaitlist').hide();
		$('#adcontractcancelrequestlist').hide();
	});
	$('#adcontractadboardinsertwaitBtn').click(function(){
		$('#adcontractsoonlist').hide();
		$('#adcontractapprovewaitlist').hide();
		$('#adcontractadboardinsertwaitlist').show();
		$('#adcontractcancelrequestlist').hide();
	});
	$('#adcontractcancelrequestBtn').click(function(){
		$('#adcontractsoonlist').hide();
		$('#adcontractapprovewaitlist').hide();
		$('#adcontractadboardinsertwaitlist').hide();
		$('#adcontractcancelrequestlist').show();
	});
})
</script>
<c:import url="../../module/header.jsp"></c:import>	
			<div class="container">
			
			   <h1>현재 광고 목록</h1>
			   <c:import url="../contract/ad_contract_list_current.jsp"></c:import>
			   <button id="adcontractsoonBtn" class="btn btn-primary btn-md">광고 예정목록</button>&nbsp;&nbsp;<button id="adcontractapprovewaitBtn" class="btn btn-primary btn-md">광고계약승인대기목록</button>&nbsp;&nbsp;<button id="adcontractadboardinsertwaitBtn" class="btn btn-primary btn-md">광고등록대기목록</button>&nbsp;&nbsp;<button id="adcontractcancelrequestBtn" class="btn btn-primary btn-md">광고취소요청목록</button>
			   <div id="adcontractsoonlist">
			   <h1>광고예정 목록</h1>
			   <c:import url="../contract/ad_contract_list_soon.jsp"></c:import>
			   </div>
			   <div id="adcontractapprovewaitlist">
			   <h1>광고계약승인대기 목록</h1>
			   <c:import url="../contract/ad_contract_list_approve_wait.jsp"></c:import>
			   </div>
			   <div id="adcontractadboardinsertwaitlist">
			   <h1>광고등록대기 목록</h1>
			   <c:import url="../contract/ad_contract_list_adboard_insert_wait.jsp"></c:import>
			   </div>
			   <div id="adcontractcancelrequestlist">
			   <h1>광고취소요청 목록</h1>
			   <c:import url="../contract/ad_contract_list_cancel_request.jsp"></c:import>
			   </div>
			   <h1>광고 계약하기</h1>
			   <form action="./adContractInsert" method="GET">
			   <button class="btn btn-info">광고 계약</button>
			   </form>
			</div>
				<!-- sns 게시물 상세보기 모달 -->
	<div class="modal fade" id="adModal" role="dialog">
	    <div id="modalFrame" class="modal-dialog modal-lg" >
			<div id="snsDetail" class="modal-content">
		        <div class="row">
		        
		        	<!-- 게시물 이미지 영역 -->
			        <div id="snsDetailImgArea" class="modal-body col-xs-12 col-sm-6" style="padding-bottom: 0; padding-top: 0;">
						<div id="snsDetailImg"></div>
		        	</div>
		        	<!-- 게시물 이미지 영역 -->
		        	
		        	<!-- 게시물 내용 영역 -->
			        <div id="snsDetailContent" class="modal-body col-xs-12 col-sm-6">
					</div>
					<!-- 게시물 내용 영역 -->
					
			     </div>
			</div>
		</div>
	</div>
	<!-- sns 게시물 상세보기 모달 -->
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import>