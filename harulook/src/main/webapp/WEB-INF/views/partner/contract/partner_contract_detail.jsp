<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<div class="row">
	<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
	
	<div class="row">
		<div class="col-xs-1">
			<!-- 제휴전용 메뉴 -->
			<c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
		</div>
		<div class="col-xs-9">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-6">

					<div class="container">
						<table class="table">
							<tr>
								<td>제휴계약번호</td>
								<td>${dto.cooContractNo}</td>
							</tr>
							<tr>
								<td>제휴업체 담당자 아이디</td>
								<td>${dto.userId}</td>
							</tr>
							<tr>
								<td>제휴업체명</td>
								<td><a data-toggle="modal" href="#myModal">${Mdto.userBsName}</a></td>
							</tr>
							<tr>
								<td>하루룩 담당자 아이디</td>
								<td>${dto.managerId}</td>
							</tr>
							<tr>
								<td>제휴 시작 날짜</td>
								<td>${dto.cooContractStart}</td>
							</tr>
							<tr>
								<td>제휴 종료 날짜</td>
								<td>${dto.cooContractEnd}</td>
							</tr>
							<tr>
								<td>제휴 계약 날짜</td>
								<td>${dto.cooContractDate}</td>
							</tr>
							<tr>
								<td>제공할 쿠폰 할인율</td>
								<td>${dto.cooContractDc}</td>
							</tr>
							<tr>
								<td>수수료 정책</td>
								<td>${dto.cooContractFee}</td>
							</tr>
							<tr>
								<td>수수료 지급 날짜</td>
								<td>${dto.cooContractPayDay}</td>
							</tr>
							<tr>
								<td>쿠폰 코드</td>
								<td>${dto.cooContractCode}</td>
							</tr>
							<tr>
								<td>쇼핑몰 배너 이미지</td>
								<td><img alt="no image" src="${dto.cooContractImg}" width="200px" height="200px"></td>
							</tr>
							<tr>
								<td>배너URL</td>
								<td>${dto.cooContractLink}</td>
							</tr>
							<tr>
								<td>제휴상태</td>
								<td>${dto.cooContractStat}</td>
							</tr>
							<tr>
								<td>결제상태</td>
								<td>${dto.cooContractPayStat}</td>
							</tr>

						</table>
						<a class="btn btn-default" href="${pageContext.request.contextPath}/partnerContractUpdate?cooContractNo=${dto.cooContractNo}">수정</a>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">업체 상세보기</h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<td>사업자번호</td>
							<td>${Mdto.userBsNo}</td>
						</tr>
						<tr>
							<td>업체명</td>
							<td>${Mdto.userBsName}</td>
						</tr>
						<tr>
							<td>업종</td>
							<td>${Mdto.userBsType}</td>
						</tr>
						<tr>
							<td>업태</td>
							<td>${Mdto.userBsStatus}</td>
						</tr>
						<tr>
							<td>업체 홈페이지</td>
							<td>${Mdto.userUrl}</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>




</body>

</html>