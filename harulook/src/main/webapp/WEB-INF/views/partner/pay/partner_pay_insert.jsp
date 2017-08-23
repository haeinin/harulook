<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>하루룩</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
                $(document).ready(function () {
                    $('#account').hide();
                    $('#card').hide();

                    $('#payCard').click(function () {
                        $('#card').show();
                        $('#account').hide();
                    })
                    $('#payAccount').click(function () {
                        $('#account').show();
                        $('#card').hide();
                    })

                    $('#payComplete').click(function () {
                        alert('결제가 완료되었습니다.');
                        $('#cooPayForm').submit();
                    });
                    $('#modalBtn').click(function () {
                        $('#payTotal').val($('cooBillValue').val());
                    });

                });

            </script>

<style>
.container {
	padding: 80px 100px;
}

.reset {
	margin-top: 20px;
}

.alert {
	margin: 20px;
}

.btnPay {
	margin-top: 100px;
}

.modal-body {
	padding: 20px;
}

.btnPayEnd {
	padding: 20px;
	margin-left: 400px;
}
</style>
</head>

<body>

	<div class="container">
		<form id="cooPayForm"
			action="${pageContext.request.contextPath}/partnerContractPay"
			method="post">
			
			<!-- hidden값 -->
			<input name="cooBillNo" id="cooBillNo" value="${dto.cooBillNo}" type="hidden" />
			<div class="form-group">
				<label for="cooContractNo">제휴계약번호 </label> 
				<input class="form-control" name="cooContractNo" value="${dto.cooContractNo}" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="cooBillValue">결제 예정 수수료 </label> 
				<input class="form-control" name="cooBillValue" id="cooPayTotal" 
				value="${dto.cooBillValue}" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="cooBillMonth">단위기간</label> 
				<input class="form-control"name="cooBillMonth" id="mallSaleAmount" 
				value="${dto.cooBillMonth}" type="text" readonly="readonly" />
			</div>
		</form>

		<div class="btnPay">
			<button class="btn btn-danger btn-md" data-toggle="modal"
				id="modalBtn" data-target="#payModal">결제하기</button>
		</div>


		<!-- PayModal -->
		<div class="modal fade" id="payModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">결제</h4>
					</div>
					<div class="modal-body">
						<table border="1" width="70%" align="center">
							<tr>
								<td width="30%" height="10%">총 결제금액 :</td>
								<td><input type="text" id="payTotal" width="100%"
									readonly="readonly"></td>
							</tr>
						</table>
						<h4>결제 방법</h4>
						<input type="button" id="payCard" name="payWay" value="카드결제">&nbsp;&nbsp;&nbsp;
						<input type="button" id="payAccount" name="payWay" value="무통장입금"><br>
						<c:import url="../../module/pay_account.jsp"></c:import>
						<c:import url="../../module/pay_card.jsp"></c:import>

						<div class="btnPayEnd">
							<input class="btn btn-danger btn-md" id="payComplete"
								type="button" value="결제완료" />
						</div>
					</div>

				</div>

			</div>
		</div>

	</div>
</body>

</html>