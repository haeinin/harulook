<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Beautiful Closet</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    $(document).ready(function(){
    	 $('#account').hide();
         $('#card').hide();
         $('#payCard').click(function(){
 				$('#card').show();
 				$('#account').hide();
         })
          $('#payAccount').click(function(){
 				$('#account').show();
 				$('#card').hide();
 			})
 		});
    	
</script>
<script>
	$(document).ready(function(){
		$('#adPay').click(function(){
			alert('클릭되었습니다');
			})	
		})
</script>

<style>
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
      margin-top: 100px;

  }

</style>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Beautiful Closet</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">HOME</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">CATEGORY
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">TOP</a></li>
            <li><a href="#">BOTTOM</a></li>
            <li><a href="#">ONE-PIECE</a></li> 
          </ul>
        </li>
        <li><a href="#">BUY</a></li>
        <li><a href="#contact">CONTACT</a></li>
        
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
	<div class="container">
		<div class="row">
		<div class="col-sm-6">
		<img src="resources/${dto.mallProImg}" alt="Lights" style="width:100%">
		</div>
			<div class="col-sm-6">
				<table class="table">
					<tbody>
						<tr>
							<td>상품이름 :</td>
							<td>${dto.mallProName}</td>
						</tr>
						<tr>
							<td>상품 카테고리 :</td>
							<td>${dto.mallProCate}</td>
						</tr>
						<tr>
							<td>상품가격 :</td>
							<td>${dto.mallProPrice}</td>
						</tr>


					</tbody>

				</table>
				<%-- <a class="btn btn-default"
						href="${pageContext.request.contextPath}/mallProOrder?mallProNo=${dto.mallProNo}">구입</a> --%>

				<button class="btn" data-toggle="modal" data-target="#payModal">구입</button>

				<div class="modal fade" id="payModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">결제</h4>
							</div>
							<div class="modal-body">
								<form id="payForm"
									action="${pageContext.request.contextPath}/mallProOrder?mallProNo=${dto.mallProNo}"
									method="post">
									<table border="1" width="70%" align="center">
										<tr>
											<td width="30%" height="10%">상품명 :</td>
											<td></td>
										</tr>
										<tr>
											<td width="30%" height="10%">결제금액 :</td>
											<td><input type="text" id="pricePayTotal" width="100%"
												readonly></td>
										</tr>
									</table>
									<c:import url="./ad_pay_account.jsp"></c:import>
									<h4>결제 방법</h4>
									<input type="button" id="payCard" name="payWay" value="카드결제">
									&nbsp;&nbsp;&nbsp; <input type="button" id="payAccount" name="payWay" value="무통장입금"><br>
									<div id="card">
          	<h4>카드사</h4>
          	<select>
          	<option>삼성</option>
          	<option>신한</option>
          	<option>롯데</option>
          	<option>농협</option>
          	</select><br>
          	<h4>카드번호</h4>
          	<input type="text" size="4">-<input type="text" size="4">-<input type="text" size="4">-<input type="text" size="4">
          	<h4>카드비밀번호 앞 두자리</h4>
          	<input type="text" size="2">**<br>
          	<h4>cvc 번호</h4>
          	<input type="text" size="3">
          	</div>
								</form>
							</div>
							<div>
								<input class="btn btn-default" id="payComplete" type="button"
									value="완료" /> <input class="btn btn-default" type="reset"
									value="초기화" />
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="payModal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>