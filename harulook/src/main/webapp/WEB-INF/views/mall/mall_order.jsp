<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Beautiful Closet</title>
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
	$(document).ready(function() {
		$('#account').hide();
		$('#card').hide();

		$('#payCard').click(function() {
			$('#card').show();
			$('#account').hide();
		})
		$('#payAccount').click(function() {
			$('#account').show();
			$('#card').hide();
		})

		$('#validCheck').click(function() {
			var request = $.ajax({
				url : "./validCooContractCode", //호출 경로
				method : "POST", //전송방식
				data : {
					'cooContractCode' : $('#Code').val()
				}, //전송해줄값
				dataType : "text" //결과값 타입 (리턴)

			});

			request.done(function(msg) {
				msg = msg.trim();
				console.log(msg);

				if (msg == "") {//일치하는값 없을때
					$('#cooContractDc').val("");
					$('#vaild').hide();
					$('#invaild').show();
				} else { //일치하는 값 있을때
					$('#cooContractDc').val(msg);
					$('#cooContractCode').val($('#Code').val());
					$('#vaild').show();
					$('#invaild').hide();
				}
			});
		});
		$('#payComplete').click(function() {
			alert('결제가 완료되었습니다.');
			$('#mallProOrderForm').submit();
		});
		$('#modalBtn').click(function() {
			var p = parseInt($('#mallSalePrice').val());
			var n = parseInt($('#mallSaleAmount').val());
			var dc = $('#cooContractDc').val();
			if (dc == null || dc == "") {
				dc = 0;
			}
			dc = parseInt(dc);
			var total = p * n * (1 - (dc / 100));
			$('#payTotal').val(total);
			$('#mallSaleTotal').val(total);
		});

	});
</script>

<style>
body {
	font-family: 'Jeju Gothic', sans-serif;
}

.nav-tabs li a {
	color: #777;
}

.navbar {
	font-family: Montserrat, sans-serif;
	margin-bottom: 0;
	background-color: #2d2d30;
	border: 0;
	font-size: 11px !important;
	letter-spacing: 4px;
	opacity: 0.9;
}

.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

.navbar-nav li a:hover {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
}

.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

.dropdown-menu li a {
	color: #000 !important;
}

.dropdown-menu li a:hover {
	background-color: red !important;
}

.container {
	padding: 80px 100px;
}

.reset {
	margin-top: 20px;
}

.alert {
	margin: 20px;
}

.orderform {
	margin: 10px;
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
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/mallMain">Beautiful
				Closet</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#myPage">HOME</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">CATEGORY <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">TOP</a></li>
						<li><a href="#">BOTTOM</a></li>
						<li><a href="#">ONE-PIECE</a></li>
					</ul></li>
				<li><a href="#">BUY</a></li>
				<li><a href="#contact">CONTACT</a></li>

				<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container">


		<div class="form-group">
			<label for="mallProName">상품이름 </label> <input name="mallProName"
				value="${dto.mallProName}" type="text" />
		</div>
		<form id="mallProOrderForm"
			action="${pageContext.request.contextPath}/mallProOrder"
			method="post">
			<!-- hidden값 -->
			<input name="mallSaleTotal" id="mallSaleTotal" type="hidden">
			<input name="mallProNo" id="mallProNo" value="${dto.mallProNo}"
				type="hidden" /> <input name="userId" id="userId"
				value="${sessionScope.id}" type="hidden" />
			<div class="form-group">
				<label for="mallSalePrice">상품가격 </label> <input class="form-control"
					name="mallSalePrice" id="mallSalePrice" value="${dto.mallProPrice}"
					type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="mallSaleAmount">상품 갯수</label> <input
					class="form-control" name="mallSaleAmount" id="mallSaleAmount"
					value="1" type="text" />
			</div>
			<div class="form-group">
				<label for="cooContractCode">할인쿠폰코드</label> <input
					class="form-control " name="cooContractCode" id="cooContractCode"
					type="text" readonly="readonly" />
			</div>

		</form>
		<div>
			<button class="btn btn-info btn-sm" data-toggle="modal"
				data-target="#vaildCode">할인코드입력</button>
		</div>

		<div class="form-group">
			<label for="cooContractDc"><br>쿠폰 할인율</label> <input
				class="form-control" name="cooContractDc" id="cooContractDc"
				type="text" readonly="readonly" />
		</div>


		<div class="btnPay">
			<button class="btn btn-danger btn-md" data-toggle="modal"
				id="modalBtn" data-target="#payModal">결제하기</button>
		</div>
		<div class="modal fade" id="vaildCode">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">할인쿠폰 입력하기</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="Code">할인쿠폰코드</label> <input class="form-control"
								id="Code" type="text" />

						</div>
						<button type="button" id="validCheck"
							class="btn btn-warning btn-sm">할인코드 입력</button>

						<div class="alert alert-success" style="display: none;" id="vaild">
							할인이 적용되었습니다.</div>
						<div class="alert alert-danger" style="display: none;"
							id="invaild">유효하지 않은 할인코드입니다.</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="closeBtn"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
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
						<c:import url="../ad/pay/ad_pay_account.jsp"></c:import>
						<c:import url="../ad/pay/ad_pay_card.jsp"></c:import>

						<div class="btnPayEnd">
							<input class="btn btn-danger btn-md" id="payComplete"
								type="button" value="결제완료" />
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="#payModal">취소</button>
				</div>
			</div>
		</div>

	</div>
</body>

</html>