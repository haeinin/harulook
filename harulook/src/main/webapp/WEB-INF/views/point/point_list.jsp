<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>~하루룩~</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Expires" content="-1">
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- div 바디 높이 크기 지정 -->
<link rel="stylesheet" type="text/css" href="resources/css/member-list-size.css">

<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 -->

<script type="text/javascript">
	$(document).ready(function(){
		var myPointMsgB;
		
		console.log(sessionStorage.getItem('get'));	//포인트 취득 내역리스트를 보기 위한 세션 값
		if(sessionStorage.getItem('get') != "get"){	//취득내역 다음이전버튼 클릭 안했을때
			$('#pointUse').show();//포인트 사용 내역 리스트
			$('#pointGet').hide();//포인트 취득 내역 리스트
		}else if(sessionStorage.getItem('get') == "get"){	//취득내역 다음이전버튼 클릭 했을때
			$('#pointUse').hide();//포인트 사용 내역 리스트
			$('#pointGet').show();//포인트 취득 내역 리스트	
		}
		
		$('#pointUseButton').click(function(){	//포인트 사용 내역
			sessionStorage.removeItem('get');
			$('#pointUse').show();
			$('#pointGet').hide();
		});
		
		$('#pointGetButton').click(function(){	//포인트 취득 내역
			sessionStorage.setItem('get', 'get');	//포인트취득내열 다음 이전 버튼 눌렀을때 세션 입력(취득내역리스트 유지하기 위함)
			$('#pointUse').hide();
			$('#pointGet').show();
		});
		
		$('.get').click(function(){	//포인트취득내열 다음 이전 버튼 눌렀을때 세션 입력(취득내역리스트 유지하기 위함)	오류있을수 있으니 다음이전버튼 누를때도 세션 저장
			sessionStorage.setItem('get', 'get');
        });
		
		
		/* $('#pointPolicyButton').click(function(){	//포인트 정책 사용 버튼 보기 
			
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
		 */
		
	});
</script>
</head>
<body>

	<!-- 해더인클루드 -->
	<c:import url="../module/header.jsp"></c:import>	
	<!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
	    
	    <div id="div1" class="col-xs-9">
		    <c:import url="/WEB-INF/views/point/point_modal.jsp"></c:import>
			<!-- <input class="btn btn-default" id="pointPolicyButton" type="button" value="포인트사용하기"/> -->
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
			
			
			
			<!-- 포인트 사용 내역-->
			<div class="container" id="pointUse">
			    <h1>포인트 사용 내역</h1>
			    <%-- <div>전체행의 수 : ${pointUseCount}</div> --%>
			    <table class="table table-striped">
			        <thead>
			            <tr>
			                <th>쿠폰</th>
			                <th>쿠폰번호</th>	<!-- ///////////////////////////////////////////////////////////////랜덤생성만들자///// -->
			                <th>사용포인트</th>
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
			    <ul class="pager">
			        <c:if test="${currentPageUse > 1}">
			            <li class="previous"><a href="${pageContext.request.contextPath}/myPoint?currentPageUse=${currentPageUse-1}">이전</a></li>
			        </c:if>
			        <c:if test="${currentPageUse < lastPageUse}">
			            <li class="next"><a href="${pageContext.request.contextPath}/myPoint?currentPageUse=${currentPageUse+1}">다음</a></li>
			        </c:if>
				</ul>
			</div>
			
			<!-- 포인트 취득내역 정책-->
			<div class="container" id="pointGet">
			    <h1>포인트 취득 내역</h1>
			    <%-- <div>전체행의 수 : ${pointGetCount}</div> --%>
			    <table class="table table-striped">
			        <thead>
			            <tr>
			                <th>쿠폰</th>
			                <th>취득포인트</th>
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
			    <ul class="pager">
			        <c:if test="${currentPageGet > 1}">
			            <li class="previous get"><a  href="${pageContext.request.contextPath}/myPoint?currentPageGet=${currentPageGet-1}">이전</a></li>
			        </c:if>
			        <c:if test="${currentPageGet < lastPageGet}">
			            <li class="next get"><a  href="${pageContext.request.contextPath}/myPoint?currentPageGet=${currentPageGet+1}">다음</a></li>
			        </c:if>
				</ul>
			</div>	
	    </div>
	    
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../module/footer.jsp"></c:import>   
	
	
</body>
</html>