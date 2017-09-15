<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>광고계약리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<!-- 드롭다운과충돌 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/adContractDetail.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

<script>
function showDetail(data) {
	/* 광고위치1에 있는 상세복 버튼을 눌렀을 때 상세내용을 AJAX로 불러온다음 모달화면에 출력  */
 	$('#place1detail').click(function(){
		var adContractNo = '${adContractPlace1.adContractNo}';
		console.log('adContractNo : ',adContractNo,'');
		var boardDetailRequest = $.ajax({
			url : './adContractDetail',
			method : 'get',
			data :{'adContractNo' : adContractNo},
			datatype : 'json',
			success : function(contractData) {
				console.log(contractData);
				adContractDetail(contractData);

				
			}
		});
		$('#adContractModal').modal();
	});
 	/* 광고위치2에 있는 상세복 버튼을 눌렀을 때 상세내용을 AJAX로 불러온다음 모달화면에 출력  */
 	$('#place2detail').click(function(){
		var adContractNo = '${adContractPlace2.adContractNo}';
		console.log('adContractNo : ',adContractNo,'');
		var boardDetailRequest = $.ajax({
			url : './adContractDetail',
			method : 'get',
			data :{'adContractNo' : adContractNo},
			datatype : 'json',
			success : function(contractData) {
				console.log(contractData);
				adContractDetail(contractData);
				
			}
		});
		$('#adModal').modal();
	});
 	/* 광고위치3에 있는 상세복 버튼을 눌렀을 때 상세내용을 AJAX로 불러온다음 모달화면에 출력  */
 	$('#place3detail').click(function(){
		var adContractNo = '${adContractPlace3.adContractNo}';
		console.log('adContractNo : ',adContractNo,'');
		var boardDetailRequest = $.ajax({
			url : './adContractDetail',
			method : 'get',
			data :{'adContractNo' : adContractNo},
			datatype : 'json',
			success : function(contractData) {
				console.log(contractData);
				adContractDetail(contractData);
				
			}
		});
		$('#adModal').modal();
	});
}

$(document).ready(function(){
	$('#table').DataTable();
	showDetail(null);
	/* 광고 상태에 맞는 리스트들을 버튼을 클릭했을때 보여줌  */
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
</head>
<body>
	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>	
	<div class="row">	
		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
		<div class="col-xs-1"></div>
		<div class="col-xs-7">
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
		<div class="col-xs-1"></div>
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
			<!-- 광고 계약 게시물 상세보기 모달 -->
		<div class="modal fade" id="adContractModal" role="dialog">
		    <div id="modalFrame" class="modal-dialog modal-lg" >
				<div id="adDetail" class="modal-content">
			        <div class="row">
			        	<div class="col-sm-8">
			        	<!-- 광고 메인 이미지 영역 -->
				        <div class="modal-body" style="padding-bottom: 0; padding-top: 0;">
							<div id="adMainImg"></div>
			        	</div>
			        	</div>
			        	<!-- 광고 메인 이미지 영역 -->
			        	<div class="col-xs-4">
			        	<!-- 광고 상세 상품 내용 영역 -->
				        <div id="adDetailContent">
						</div>
						</div>
						<!-- 강고 상세 상품 내용 영역 -->
				     </div>
				</div>
			</div>
		</div>
	<!-- 광고 게시물 상세보기 모달 -->
</body>
</html>