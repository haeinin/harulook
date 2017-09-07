<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- div 바디 높이 크기 지정 -->
<style type="text/css">
       #div1 {
       	  position: relative;
          height: 600px;
          top: 120px;
          /* left: 100px; */
       }
       
       #div2 {
       	  position: relative;
          height: 600px;
          top: 10px;
          /* left: 300px; */
       }
       
       #loginTitle{	
       	  position: relative;
          left: 600px;
       }
</style>

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
<script type="text/javascript">

	$(document).ready(function(){
		//비밀번호찾기 버튼 숨김
		$('#businessUpdateButton').hide();
		$('#userUpdateButton').hide();
		
		$('#loginButton').click(function(){	//로그인 버튼
			$('#loginAddR').submit();	
		});
		
		$('#loginUser').click(function(){	//일반회원 로그인
			$('#loginAddUser').submit();	
		});
		
		$('#loginManager').click(function(){	//사업자 로그인
			$('#loginAddManager').submit();	
		});
		
		$('#loginBusiness').click(function(){	//관리자 로그인
			$('#loginAddBusiness').submit();	
		});
		
		$('#userinserformbutton').click(function(){	//회원가입버튼
			$('#userinserform').submit();
        });
		
		$('#businessinserformbutton').click(function(){	//사업자등록버튼
			$('#businessinserform').submit();
        });
		
		$('#idFindAdd').click(function(){	//아이디찾기버튼
			
			var idFindForm = $("form[name=idFindFormAdd]").serialize();
				console.log(idFindForm + "====아이디찾기 폼");
			var request = $.ajax({
				  url: "./idFindFormAdd", //호출 경로
				  method: "POST",	//전송방식
				  data: idFindForm , //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			});
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);	//아이디찾기
				if(!msg){	//아이디찾기 실패
					$('#findId').html('다시입력하세요');
				}else{	//아이디찾기 성공
					$('#findId').html('찾은아이디 = ' + msg);	
				}
			});	
        });
		
		$('#pwFindAdd').click(function(){	//비밀번호찾기버튼
			var pwFindForm = $("form[name=pwFindFormAdd]").serialize();
				console.log(pwFindForm + "====비밀번호 폼");
			var request = $.ajax({
				  url: "./pwFindFormAdd", //호출 경로
				  method: "POST",	//전송방식
				  data: pwFindForm , //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			});
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);	//비밀번호찾기
				if(!msg){	//비밀번호찾기 실패
					$('#findPw').html('정보가 맞지 않습니다 다시입력하세요');
					$('#businessUpdateButton').hide();
					$('#userUpdateButton').hide();
				}else if(msg == "관리자"){	//비밀번호찾기 성공
					$('#findPw').html('');
					$('#businessUpdateButton').show();
					$('#userUpdateButton').hide();
				}else if(msg == "사업자"){	//비밀번호찾기 성공
					$('#findPw').html('');
					$('#businessUpdateButton').show();
					$('#userUpdateButton').hide();
				}else if(msg == "일반회원"){	//비밀번호찾기 성공
					$('#findPw').html('');
					$('#userUpdateButton').show();
					$('#businessUpdateButton').hide();
				}else{	//에러
					$('#findPw').html('다시입력하세요');
					$('#businessUpdateButton').hide();
					$('#userUpdateButton').hide();
				}
			});
			console.log(sessionStorage.getItem('id') + ' == 세션아이디');
        });
		
		$('#idfindbutton').click(function(){	//아이디찾기모달띄우기
			$('#idFindModal').modal();
        });
		
		$('#pwfindbutton').click(function(){	//비밀번호찾기모달띄우기
			$('#pwFindModal').modal();
        });
		
		$('#userUpdateButton').click(function(){	//일반회원수정하기
			/* var request = $.ajax({
				  url: "./userUpdate", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'userId' : sessionStorage.getItem('id') } , //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
				  
			});*/
			 $('#userUpdate').submit();
		});
		
		$('#businessUpdateButton').click(function(){	//사업자 관리자 회원 수정하기
			$('#businessUpdate').submit();
		});
		
	});
	
</script>

<title>일반회원가입폼</title>
</head>
<body>
	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>	
	<!-- 바디 인클루드 -->
	
    <div class="row">
		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
		<div class="col-xs-1"></div>
		  
		    
			
				
					
						<div id="div2" class="col-md-3">
							  <div class="login-box well">
									<form id=loginAddR accept-charset="UTF-8" role="form" method="post" action="${pageContext.request.contextPath}/loginAdd">
									<legend>로그인</legend>
									   <div class="form-group">
									       <!-- 아이디 -->
									    <label for="username-email">아이디</label>
									    <input name="userId" id="user_id" placeholder="Username" type="text" class="form-control" />
									</div>
									<div class="form-group">
										<!-- 비밀번호 -->
									<label for="password">비밀번호</label>
									<input name="userPw" id="user_pw" placeholder="Password" type="password" class="form-control" /><br>
									<span>${loginCheck}</span><br>
									</div>
									</form>
									<div class="form-group">
										<!-- 로그인버튼 -->
									        <input id="loginButton" type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="로그인" />
									
									   
									
									 <!-- 회원가입하기 -->
									<form id=userinserform action="${pageContext.request.contextPath}/member_user_insert" method="get">
										<input class="btn btn-default btn-login-submit btn-block m-t-md" type="submit" value="회원가입"/>
									</form>
									
									<!-- 사업자등록하기 -->
									<form id=businessinserform action="${pageContext.request.contextPath}/member_business_insert" method="get">
										<input class="btn btn-default btn-login-submit btn-block m-t-md" type="submit" value="사업자등록하기"/>
									</form>
									
									<!-- 아이디찾기 -->
									<input id="idfindbutton" class="btn btn-default btn-login-submit btn-block m-t-md" type="button" value="아이디찾기"/>
									
									<!-- 비밀번호찾기 -->
									<input id="pwfindbutton" class="btn btn-default btn-login-submit btn-block m-t-md" type="button" value="비밀번호찾기"/>
								</div>
							</div>
					    </div>
				     
				 
			
		    
				
		
			
		
		<div class="col-xs-2"></div>
	    <div id="div1" class="col-xs-3">
	           	<div class="btn-group-vertical">
	           		<div class="well">
	           		<h2>&nbsp;간편 로그인</h2>
					<!-- 일반회원자동로그인 -->
				    <form id=loginAddUser action="${pageContext.request.contextPath}/loginAdd" method="post">
				    	<input name="userId" id="user_id" type="hidden" value="id003" />
			            <input name="userPw" id="user_pw" type="hidden" value="pw003"/>
			            <input class="btn btn-warning" style="WIDTH: 130pt; HEIGHT: 27pt" id="loginUser" type="button" value="일반회원자동로그인"/>
				    </form>
				    
				    <!-- 관리자자동로그인 -->
				    <form id=loginAddManager action="${pageContext.request.contextPath}/loginAdd" method="post">
				    	<input name="userId" id="user_id" type="hidden" value="id001"/>
			            <input name="userPw" id="user_pw" type="hidden" value="321321"/>
			            <input class="btn btn-warning" style="WIDTH: 130pt; HEIGHT: 27pt" id="loginManager" type="button" value="관리자자동로그인"/>
				    </form>
				    
				    <!-- 사업자자동로그인 -->
				    <form id=loginAddBusiness action="${pageContext.request.contextPath}/loginAdd" method="post">
				    	<input name="userId" id="user_id" type="hidden" value="id004"/>
			            <input name="userPw" id="user_pw" type="hidden" value="pw004"/>
			            <input class="btn btn-warning" style="WIDTH: 130pt; HEIGHT: 27pt" id="loginBusiness" type="button" value="사업자자동로그인"/>
				    </form>
				    </div>
				</div>
		</div>
		 
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
       	
       	<!-- 아이디찾기 modal-->
		<div class="modal fade" id="idFindModal" role="dialog">
		  	<div class="modal-dialog">
		 			<!-- Modal content-->
				<div class="modal-content">
					
					<div class="modal-header" style="padding:35px 50px;">
					   	<h2>아이디찾기</h2><br>
					    <form name="idFindFormAdd" id=idFindFormAdd action="${pageContext.request.contextPath}/idFindForm" method="post"> 
					    <!-- 닉네임 -->	        
			       		<label for="user_nick">닉&nbsp;&nbsp;네&nbsp;&nbsp;임 &nbsp;:</label>
			            <input name="userNick" id="user_nick" type="text"/><br>
					     
					    <!-- 비밀번호 -->
			        	<label for="user_pw">비밀번호 :</label>
			            <input name="userPw" id="user_pw" type="password"/><br>  
			            
					    <!-- 질문 -->
			        	<!-- <label for="user_q">질문 :</label> -->
			            <select class="form-control" name="userQ" id="user_q" style="WIDTH: 190pt; HEIGHT: 25pt" >
							<option>질문을 입력하세요</option>
							<option>나의 보물은</option>
			            	<option>나의 고향은</option>
			            	<option>나의 초등학교</option>
			            	<option>나의 고등학교</option>
			            	<option>나의 비밀은</option>
			            	<option>나의 꿈은</option>
		            	</select>
			       		
			       		<!-- 답 -->
			        	<label for="user_a">질문의 답 :</label>
			            <input name="userA" id="user_a" type="text"/><br>
		        		<!-- 아이디찾기경고문 -->
		        		<h2><span id="findId"></span><br></h2>
		        		<!-- 아이디찾기버튼 -->
		        		<input class="btn btn-default" id="idFindAdd" type="button" value="아이디찾기"/>
			            </form>
			            
					</div>
		       	</div>
		 	 </div>
		</div>
		
		<!-- 비밀번호찾기 modal-->
		<div class="modal fade" id="pwFindModal" role="dialog">
				  	<div class="modal-dialog">
				 			<!-- Modal content-->
						<div class="modal-content">
							
							<div class="modal-header" style="padding:35px 50px;">
								<h2>비밀번호찾기</h2><br>
								<form name="pwFindFormAdd" id=pwFindFormAdd action="${pageContext.request.contextPath}/pwFindForm" method="post"> 
							    
							     <!-- 아이디 -->
					           	<label for="user_id">아&nbsp;&nbsp;이&nbsp;&nbsp;디 &nbsp;:</label>
					            <input name="userId" id="user_id_modal" type="text"/><br>
							    
							     <!-- 닉네임 -->	        
					       		<label for="user_nick">닉&nbsp;&nbsp;네&nbsp;&nbsp;임 &nbsp;:</label>
					            <input name="userNick" id="user_nick" type="text"/> 
							     
							    <!-- 질문 -->
					        	<!-- <label for="user_q">질문 :</label> -->
					            <select class="form-control" name="userQ" id="user_q" style="WIDTH: 190pt; HEIGHT: 25pt" >
									<option>질문을 입력하세요</option>
									<option>나의 보물은</option>
					            	<option>나의 고향은</option>
					            	<option>나의 초등학교</option>
					            	<option>나의 고등학교</option>
					            	<option>나의 비밀은</option>
					            	<option>나의 꿈은</option>
				            	</select>
					       		
					       		<!-- 답 -->
					        	<label for="user_a">질문의 답 :</label>
					            <input name="userA" id="user_a" type="text"/><br>
				        		
				        		<!-- 비밀번호찾기경고문 -->
				        		<h2><span id="findPw"></span><br></h2>
				        				
		        				<!-- 비밀번호찾기버튼 -->
				        		<input class="btn btn-default" id="pwFindAdd" type="button" value="비밀번호찾기"/>
				        		</form> 
				        		
					            <!-- 관리자와 사업자 수정하기버튼 -->
							    <form id="businessUpdate" action="${pageContext.request.contextPath}/businessUpdate?userId=${sessionScope.id}" method="post">
						  			<div>
						  				<input class="btn btn-default" id="businessUpdateButton" type="button" value="내 정보 수정 하기"/><!-- 관리자사업자 -->
						  	 		</div>	
							    </form>
		        			
		        				<!-- 일반회원수정하기버튼 -->
		        			    <form id="userUpdate" action="${pageContext.request.contextPath}/userUpdate?userId=${sessionScope.id}" method="post">
						  			<div>
						  				<input class="btn btn-default" id="userUpdateButton" type="button" value="내 정보 수정 하기"/><!-- 일반회원 -->
						  	 		</div>	
							    </form> 
							    
							       
							</div>
				       	</div>
				 	 </div>
				</div>
	</div>
    <div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
    
</body>
</html>