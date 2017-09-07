<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#pointPolicyButton').click(function(){	//포인트 정책 사용 버튼 보기 
			
			var request = $.ajax({	//일반회원의 포인트를 받아오기 
				  url: "./myPagePoint", //호출 경로
				  method: "POST",	//전송방식
				  dataType: "text" //결과값 타입 (리턴)
			});  
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);	//아이디찾기
				$('#myPointMsgB').html('나의 보유 포인트 : ' + msg);
				myPointMsgB = msg * 1;	//보유포인트 변수로 지정
				console.log(myPointMsgB + " ==인트변환");
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
			
			if(myPointMsgB < pointValusIf){	// 보유 포인트가 부족하면 경고문
				alert('포인트가 부족합니다');
			}else if(myPointMsgB >= pointValusIf){	//보유 포인트가 충분하면 사용가능
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
			<input class="btn btn-default" id="pointPolicyButton" type="button" value="포인트사용하기"/>
			
			<!-- 포인트 정책 쓰기-->
			<div class="modal fade" id="pointPolicyModal" role="dialog">
			  	<div class="modal-dialog">
		 			<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding:35px 50px;">
						   <!-- 포인트 정책-->
							
							<div class="container">
							    <h1>포인트 정책</h1>
							    <div class="col-xs-5">
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
							</div>
							
							<!-- 포인트 사용 쿠폰-->
							<div class="container">
							    <h1>포인트 사용 쿠폰</h1>
							    <!-- 보유포인트-->
							    
								<span id="myPointMsgB"></span><br>
								<div class="col-xs-5">
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
								                	<td><span class="pointPolicyValue" id="pointPolicyValue" value="${pu.pointPolicyValue}">${pu.pointPolicyValue}</span></td>
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
			</div>
</body>
</html>