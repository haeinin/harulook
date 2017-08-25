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
		var myPointMsg;
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
		
		$('#pointPolicyButton').click(function(){	//포인트 정책 사용 버튼 보기 
			
			var request = $.ajax({	//일반회원의 포인트를 받아오기 
				  url: "./myPagePoint", //호출 경로
				  method: "POST",	//전송방식
				  dataType: "text" //결과값 타입 (리턴)
			});  
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);	//아이디찾기
				$('#myPointMsg').html('나의 보유 포인트 = ' + msg);
				myPointMsg = msg * 1;	//보유포인트 변수로 지정
				console.log(myPointMsg + " ==인트변환");
			});	
			$('#pointPolicyModal').modal();
		});
		
		$('#couponUseButton').click(function(){	//	포인트 입력 
			$('#couponUse').submit();
		});
		
		$('.kuponButton').click(function(){	//	해당 포인트 사용하기
			var pointValue = $(this).val();
			pointValusIf = pointValue * -1;	//음수를 양수로 변환
			console.log(pointValusIf);
			
			if(myPointMsg < pointValusIf){	// 보유 포인트가 부족하면 경고문
				alert('포인트가 부족합니다');
			}else if(myPointMsg >= pointValusIf){	//보유 포인트가 충분하면 사용가능
				console.log('포인트충분');
				var request = $.ajax({
					  url: "./couponUse", //호출 경로
					  method: "POST",	//전송방식
					  data: { 'pointPolicyValue' : $(this).val() }, //전송해줄값
					  dataType: "text" //결과값 타입 (리턴)
				});
				location.reload(true);
			}else{
				alert('오류');
			}
		});
		
	});
</script>
</head>
<body>
	
    <form id="couponUse" action="${pageContext.request.contextPath}/couponUse" method="post">
		<div>
			<input class="btn btn-default" id="couponUseButton" type="button" value="포인트입력 테스트버튼"/>
		</div>
	</form>
	
	<input class="btn btn-default" id="pointPolicyButton" type="button" value="포인트사용하기"/>
	<input class="btn btn-default" id="pointUseButton" type="button" value="포인트 사용 내역"/>
	<input class="btn btn-default" id="pointGetButton" type="button" value="포인트 취득 내역"/>
	
	<!-- 포인트 정책 쓰기-->
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
					
					<!-- 포인트 사용 쿠폰-->
					<div class="container">
					    <h1>포인트 사용 쿠폰</h1>
					    <!-- 보유포인트-->
						<h5><span id="myPointMsg"></span><br></h5>
					    <table class="table">
					        <thead>
					            <tr>
					                <th>포인트</th>
					                <th>쿠폰</th>
					                <th>사용하기</th>
				                </tr>
					        </thead>
					        <tbody>
					            <c:forEach var="pu" items="${pointUsePolicy}">
					                <tr>
					                	<td><input class="pointPolicyValue" id="pointPolicyValue" value="${pu.pointPolicyValue}"/></td>
								      	<td>${pu.pointPolicyReason}</td>
								      	<td><button class="btn btn-default kuponButton" id="kuponButton" type="button" value="${pu.pointPolicyValue}" >사용하기</button></td>
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
	                <th>쿠폰번호</th>	<!-- ///////////////////////////////////////////////////////////////랜덤생성만들자///// -->
	                <th>포인트</th>
	                <th>날짜</th>
            	  </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="u" items="${pointUse}">
	                <tr>
		                <td>${u.pointPolicyReason}</td>
		                <th>${u.pointGoodsCode}</th>	<!-- ///////////////////////////////////////////////////////////////랜덤생성만들자///// -->
				      	<td>${u.pointPolicyValue}</td>
				      	<td>${u.pointDate}</td>
				    </tr>
	            </c:forEach>
	        </tbody>
	   </table>
	</div>
	
	<!-- 포인트 취득내역 정책-->
	<div class="container" id="pointGet">
	    <h1>포인트 취득 내역</h1>
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