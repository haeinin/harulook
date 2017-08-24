<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 주소 api --> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script> 
<!-- 유효성검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript">
	$(document).ready(function(){
		$('#pointUse').show();//포인트 사용 내역 리스트
		$('#pointGet').hide();//포인트 취득 내역 리스트
		
		$('#pointUseButton').click(function(){	//포인트 사용 내역
			$('#loginAdd').submit();
			$('#pointUse').show();
			$('#pointGet').hide();
		});
		
		$('#pointGetButton').click(function(){	//포인트 취득 내역
			$('#loginAdd').submit();
			$('#pointUse').hide();
			$('#pointGet').show();
		});
		
		$('#pointPolicyButton').click(function(){	//포인트정책모달
			$('#pointPolicyModal').modal();
		});
		
	});
</script>
</head>
<body>
	<input class="btn btn-default" id="pointPolicyButton" type="button" value="포인트정책"/>
	<input class="btn btn-default" id="pointUseButton" type="button" value="포인트 사용 내역"/>
	<input class="btn btn-default" id="pointGetButton" type="button" value="포인트 취득 내역"/>
	
	<!-- 포인트정책-->
	<div class="modal fade" id="pointPolicyModal" role="dialog">
	  	<div class="modal-dialog">
	 			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding:35px 50px;">
				   <!-- 포인트 정책-->
					<div class="container">
					    <h1>포인트 정책</h1>
					    <table class="table">
					        <thead>
					            <tr>
					                <th>포인트</th>
					                <th>제도</th>
					            </tr>
					        </thead>
					        <tbody>
					            <c:forEach var="p" items="${pointPolicy}">
					                <tr>
						                <td>${p.pointPolicyValue}</td>
								      	<td>${p.pointPolicyReason}</td>
								    </tr>
					            </c:forEach>
					        </tbody>
					   </table>
					</div>
					
					<!-- 포인트 사용 정책-->
					<div class="container">
					    <h1>포인트 사용 쿠폰</h1>
					    <table class="table">
					        <thead>
					            <tr>
					                <th>포인트</th>
					                <th>쿠폰</th>
					                
				            	  </tr>
					        </thead>
					        <tbody>
					            <c:forEach var="pu" items="${pointUsePolicy}">
					                <tr>
						                <td>${pu.pointPolicyValue}</td>
								      	<td>${pu.pointPolicyReason}</td>
								    </tr>
					            </c:forEach>
					        </tbody>
					   </table>
					</div>
				</div>
	       	</div>
	 	 </div>
	</div>
	
	
	
	<!-- 포인트 사용 내역-->
	<div class="container" id="pointUse">
	    <h1>포인트 사용 내역</h1>
	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>쿠폰</th>
	                <th>포인트</th>
	                <th>날짜</th>
            	  </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="u" items="${pointUse}">
	                <tr>
		                <td>${u.pointPolicyReason}</td>
				      	<td>${u.pointPolicyValue}</td>
				      	<td>${u.pointDate}</td>
				    </tr>
	            </c:forEach>
	        </tbody>
	   </table>
	</div>
	
	<!-- 포인트 취득내역 정책-->
	<div class="container" id="pointGet">
	    <h1>포인트 취득내역 정책</h1>
	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>쿠폰</th>
	                <th>포인트</th>
	                <th>날짜</th>
            	  </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="g" items="${pointGet}">
	                <tr>
		                <td>${g.pointPolicyReason}</td>
				      	<td>${g.pointPolicyValue}</td>
				      	<td>${g.pointDate}</td>
				    </tr>
	            </c:forEach>
	        </tbody>
	   </table>
	</div>
	
	
	
</body>
</html>