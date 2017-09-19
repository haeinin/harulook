<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 유효성검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
			var re_id = /^[a-z0-9]{5,16}$/; // 아이디 검사식
			var re_pw = /^[a-z0-9~!@#$%^&*()]{6,18}$/; // 비밀번호 검사식
			var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
			var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
			var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
			var re_bs_no = /^[0-9]{10}$/; // 사업자번호 검사식
			
			var 
			form = $('.form'), 
			uid = $('#user_id'),
			upw = $('#user_pw'), 
			mail = $('#user_email'), 
			url = $('#user_url'), 
			tel = $('#user_tel'),
			bsno = $('#user_bs_no');
			
			//아이디 중복체크 메시지 숨김
			$('#idsfirst').show();
			$('#idsuccess').hide();
			$('#idfail').hide();
			$('#idre').hide();
			
			//닉네임 중복체크 메시지 숨김
			$('#nicksuccess').hide();
			$('#nickfail').hide();
			$('#nickre').hide();
			
			//비밀번호 메시지 숨김
			$('#pwfirst').show();
			$('#pwsuccess').hide();
			$('#pwfail').hide();
			$('#pwre').hide();
			
			//이메일 확인 메시지 숨김
			$('#emailsuccess').hide();
			$('#emailfail').hide();
			
			//전화번호 확인 메시지 숨김
			$('#telfirst').show();
			$('#telsuccess').hide();
			$('#telfail').hide();
			
			//질문의 답 메시지 숨김
			$('#userAfail').hide();
			
			//사업자번호 확인 메시지 숨김
			$('#Bsfirst').show();
			$('#BsNosuccess').hide();
			$('#BsNofail').hide();
			
			//url 확인 메시지 숨김
			$('#Urlsuccess').hide();
			$('#Urlfail').hide();
			
		//아이디중복체크버튼
		$('#user_id').blur(function(){	
			var request = $.ajax({
				  url: "./idcheck", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'idcheck' : $('#user_id').val() }, //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			
			});
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);	//아이디 중복체크한후 아이디
				console.log($('#user_id').val());	//중복체크 입력한 아이디
				
				if (re_id.test(uid.val()) != true) { // 아이디 입력 양식이 틀렸을때
					$('#idsfirst').hide();
					$('#idre').show();
					$('#idsuccess').hide();
					$('#idfail').hide();
					$('#user_id').val("");
					return false;
				}else{	//아이디 입력양식이 맞을때
					if($('#user_id').val() == msg){	//아이디가 중복될때 메시지
						$('#idsfirst').hide();
						$('#idfail').show();
						$('#idsuccess').hide();
						$('#idre').hide();
						$('#user_id').val("");
						uid.focus();
					}else if(msg == ""){	//아이디가 중복안될때 메시지
						$('#idsfirst').hide();
						$('#idsuccess').show();
						$('#idfail').hide();
						$('#idre').hide();
					}else{					//오류일때
						$('#idsfirst').hide();
						$('#idre').show();
						$('#idsuccess').hide();
						$('#idfail').hide();
						$('#user_id').val("");
						uid.focus();
					}
				}
			});
	  	});
		
		//닉네임 중복체크버튼
		$('#userNickCheckButton').click(function(){	
			var request = $.ajax({
				  url: "./nickcheck", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'usernick' : $('#user_nick').val() }, //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			
			});
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);	//아이디 중복체크한후 아이디
				console.log($('#user_nick').val());	//중복체크 입력한 아이디
				if($('#user_nick').val() == msg){	//아이디가 중복될때 메시지
					$('#nickfail').show();
					$('#nicksuccess').hide();
					$('#nickre').hide();
					$('#user_nick').val("");
					$('#user_nick').focus();
				}else if(msg == ""){	//아이디가 중복안될때 메시지
					$('#nicksuccess').show();
					$('#nickfail').hide();
					$('#nickre').hide();
				}else{					//오류일때
					$('#nickre').show();
					$('#nicksuccess').hide();
					$('#nickfail').hide();
					$('#user_nick').val("");
					$('#user_nick').focus();
				}
			});
	  	});
		
		//비밀번호 확인
		$('#user_pw_check').blur(function(){	
			
			if(re_pw.test(upw.val()) != true) { // 비밀번호 양식 오류
				$('#pwre').show();
				$('#pwfirst').hide();
				$('#pwsuccess').hide();
				$('#pwfail').hide();
				$('#user_pw').val("");
				$('#user_pw_check').val("");
				return false;
			}else{
				if($('#user_pw').val() == $('#user_pw_check').val()){	//비밀번호 일치
					$('#pwfirst').hide();
					$('#pwsuccess').show();
					$('#pwfail').hide();
					$('#pwre').hide();
				}else if($('#user_pw').val() != $('#user_pw_check').val()){	//비밀번호 불일치
					$('#pwfirst').hide();
					$('#pwfail').show();
					$('#pwsuccess').hide();
					$('#pwre').hide();
					$('#user_pw').val("");
					$('#user_pw_check').val("");
					upw.focus();
				}else{					//오류일때
					$('#pwfirst').hide();
					$('#pwre').show();
					$('#pwsuccess').hide();
					$('#pwfail').hide();
					$('#user_pw').val("");
					$('#user_pw_check').val("");
					upw.focus();
				}
				}
	  	});
		
		//이메일입력 유효성
		$('#user_email').blur(function(){
			if(re_mail.test(mail.val()) != true) { // 이메일 검사
				$('#emailsuccess').hide();
				$('#emailfail').show();
				mail.focus();
			return false;
			}else{
				$('#emailsuccess').show();
				$('#emailfail').hide();
			}
		});
		
		//전화번호 유효성
		$('#user_tel').blur(function(){
			if(re_tel.test(tel.val()) != true) { // 전화번호 검사
				$('#telfirst').hide();
				$('#telsuccess').hide();
				$('#telfail').show();
			tel.focus();
			return false;
			}else{
				$('#telfirst').hide();
				$('#telsuccess').show();
				$('#telfail').hide();
			}
			
		});
		
		$('#user_a').blur(function(){	//질문의 답
			
			
			console.log($('#user_a').val());
			if(!$('#user_a').val()) { // 답이없을때
				$('#userAfail').show();
				$('#userAfail').focus();
			}else{
				$('#userAfail').hide();
			}
        });
		
		//사업자번호 검사
		$('#user_bs_no').blur(function(){
			if(re_bs_no.test(bsno.val()) != true) { // 사업자번호 검사
				$('#Bsfirst').hide();
				$('#BsNosuccess').hide();
				$('#BsNofail').show();
			bsno.focus();
			return false;
			}else{
				$('#Bsfirst').hide();
				$('#BsNosuccess').show();
				$('#BsNofail').hide();
			}
		});
		
		//url 검사
		$('#user_url').blur(function(){
			if(re_url.test(url.val()) != true) { // url 검사
				$('#Urlsuccess').hide();
				$('#Urlfail').show();
			url.focus();
			return false;
			}else{
				$('#Urlsuccess').show();
				$('#Urlfail').hide();
			}
		});
		
		
		$('#addButton').click(function(){	//회원가입버튼
			
			if(!$('#user_id').val()){	//아이디입력 안했을때
				alert('아이디를입력하세요');
				$('#user_id').focus();
				return false;
			}else if(!$('#user_pw').val()){	//비밀번호 입력 안했을때
				alert('비밀번호를입력하세요');
				$('#user_pw').focus();
				return false;
			}else if(!$('#user_nick').val()){	//닉네임
				alert('닉네임입력하세요');
				$('#user_nick').focus();
				return false;
			}else if(!$('#user_name').val()){	//이름
				alert('이름을입력하세요');
				$('#user_name').focus();
				return false;
			}else if(!$('#user_tel').val()){	//전화번호
				alert('전화번호를입력하세요');
				$('#user_tel').focus();
				return false;
			}else if(!$('#user_email').val()){	//이메일
				alert('이메일을입력하세요');
				$('#user_email').focus();
				return false;
			}else if(!$('#sample4_postcode').val()){	//주소
				alert('주소를입력하세요');
				$('#sample4_postcode').focus();
				return false;
			
			}else if(!$('#user_bs_no').val()){	//사업자번호
				alert('사업자번호를입력하세요');
				$('#user_bs_no').focus();
				return false;
			}else if(!$('#user_bs_type').val()){	//업종
				alert('업종을입력하세요');
				$('#user_bs_type').focus();
				return false;
			}else if(!$('#user_bs_status').val()){	//업태
				alert('업태를입력하세요');
				$('#user_bs_status').focus();
				return false;
			}else if(!$('#user_bs_name').val()){	//업체명
				alert('업체명을입력하세요');
				$('#user_bs_name').focus();
				return false;
			}else if(!$('#user_url').val()){	//업체홈페이지
				alert('업체홈페이지를입력하세요');
				$('#user_url').focus();
				return false;
			}else if(!($('#user_q').val())){	//질문 선택안했을때
				alert('질문 입력하세요');
				$('#user_q').focus();
				return false;
			}else if(!$('#user_a').val()){	//질문의 답을 입력안했을때
				alert('답을입력하세요');
				$('#user_a').focus();
				return false;
			
			}else{
				$('#addFormBusiness').submit();
			}
			
			
        });
		
    });
	
	
	
    //다음 주소 api
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
	
	
</script>

<title>사업자등록 폼</title>
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
	    <div id="div1" class="col-xs-9">
			
			<div class="container">
			<div class="row">
				<div class="page-header">
		  	    
				</div>
					<div id="" class="col-md-2"></div>
					<div id="" class="col-md-7">
					<h2 id="loginTitle">사업자회원가입</h2>
						<div class="login-box well">
							 <form id="addFormBusiness" action="${pageContext.request.contextPath}/businessAdd" method="post">
								<!-- 아이디 -->
					           	<label style="letter-spacing:11.8px" for="user_id">아이디</label>
					            <input name="userId" id="user_id" type="text"/>  
						            <span id="idsfirst" >5자~16자 이내 영문과 숫자만가능</span>
					            	<span id="idsuccess" >사용가능한 아이디입니다</span>
					            	<span id="idfail" >사용불가능한 아이디입니다</span>
					            	<span id="idre" >아이디 다시 입력해주세요</span><br>
					            	
					            <!-- 비밀번호 -->
					        	<label style="letter-spacing:5px" for="user_pw">비밀번호</label>
					            <input name="userPw" id="user_pw" type="password"/><br>
					            
					            <!-- 비밀번호 확인-->
					        	<label style="letter-spacing:5px" for="user_pw_check">비밀번호</label>
					            <input name="userPwCheck" id="user_pw_check" type="password"/> 
					            	<span id="pwfirst" >6자~16자 이내 특수문자가능</span>
					            	<span id="pwsuccess" >비밀번호일치</span>
					            	<span id="pwfail" >비밀번호 불일치</span>
					            	<span id="pwre" >비밀번호 다시입력해주세요</span><br>
					            	
					            <!-- 닉네임 -->	        
					       		<label style="letter-spacing:11.8px" for="user_nick">닉네임</label>
					            <input name="userNick" id="user_nick" type="text"/>
					            <input class="btn btn-default" id="userNickCheckButton" type="button" value="Check"/>
					           		<span id="nicksuccess" >사용가능한 닉네임입니다</span>
					            	<span id="nickfail" >사용불가능한 닉네임입니다</span>
					            	<span id="nickre" >닉네임 다시 입력해주세요</span><br>
				            	
				            	<!-- 이름 -->
					        	<label style="letter-spacing:11.3px" for="user_name">이&nbsp;&nbsp;름</label>
					            <input name="userName" id="user_name" type="text"/><br>
								           
				           		<!-- 전화번호 -->
					        	<label style="letter-spacing:5px" for="user_tel">전화번호</label>
					            <input name="userTel" id="user_tel" type="text"/>
									<span id="telfirst" >&nbsp;- 빼고 숫자만 입력하세요</span>
					            	<span id="telsuccess" >사용가능한 전화번호입니다</span>
					            	<span id="telfail" >사용불가능한 전화번호입니다</span><br>	
					                      
				           		<!--  이메일 -->
					        	<label style="letter-spacing:11.8px" for="user_email">이메일</label>
					            <input name="userEmail" id="user_email" type="text"/>
					           		<span id="emailsuccess" >사용가능한 이메일입니다</span>
					            	<span id="emailfail" >사용불가능한 이메일입니다</span><br>
					            
				            	<!-- 주소 -->
					        	<label style="letter-spacing:11.3px" for="user_addr">주&nbsp;&nbsp;소</label>
					            <!-- <input name="userAddr" id="user_addr" type="text"/><br> -->
					        	
					        	<input type="text" id="sample4_postcode" placeholder="우편번호" readonly>
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly>
								<input name="userAddr" type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly><br><br>
								<span id="guide" style="color:#999"></span>
					        	
					        	
							    <!-- 질문 -->
					        	<div>
						        	<label style="letter-spacing:11.3px" for="user_q">질&nbsp;&nbsp;문</label>
						            <select class="" style="WIDTH: 131pt; HEIGHT: 20pt" name="userQ" id="user_q">
										<option>${userDetail.userQ}</option>
						            	<option>나의 보물은</option>
						            	<option>나의 고향은</option>
						            	<option>나의 초등학교</option>
						            	<option>나의 고등학교</option>
						            	<option>나의 비밀은</option>
						            	<option>나의 꿈은</option>
					            	</select>
					        	</div>
					       		
					       		<!-- 답 -->
					        	<label style="letter-spacing:5px" for="user_a">질문의답</label>
					            <input name="userA" id="user_a" type="text"/>
				        			<span id="userAfail" >답을 입력하세요</span><br>
					        	
					        	<!-- 업종 -->
					        	<label style="letter-spacing:11.3px" for="user_bs_type">업&nbsp;&nbsp;종</label>
					            <input name="userBsType" id="user_bs_type" type="text"/><br>
					            
					            <!-- 업태 -->
					        	<label style="letter-spacing:11.3px" for="user_bs_status">업&nbsp;&nbsp;태</label>
					            <input name="userBsStatus" id="user_bs_status" type="text"/><br>
					            
					            <!-- 업체명 -->
					        	<label style="letter-spacing:11.8px" for="user_bs_name">업체명</label>
					            <input name="userBsName" id="user_bs_name" type="text"/><br>
					            
					            <!-- 업체홈페이지 -->
					        	<label style="letter-spacing:5px" for="user_url">홈페이지</label>
					            <input name="userUrl" id="user_url" type="text"/>
					     			<span id="Urlsuccess" >사용가능한 주소입니다</span>
					            	<span id="Urlfail" >사용불가능한 주소입니다</span><br>
					            	
					            <!-- 사업자번호 -->
					        	<label style="letter-spacing:1px" for="user_bs_no">사업자번호</label>
					            <input name="userBsNo" id="user_bs_no" type="text"/>
					        		<span id="Bsfirst" > 000-00-00000 -은빼고 입력하세요</span>
					            	<span id="BsNosuccess" >사용가능한 사업자번호입니다</span>
					            	<span id="BsNofail" >사용불가능한 사업자번호입니다</span><br>
					            		
					            <br>
		            			<!-- 사업자등록버튼 -->
						     	<div>
						       		<input class="btn btn-default" id="addButton" type="button" value="사업자등록"/>
						        </div>
		   					</form>	
						</div>
					</div>
				</div>
			</div>
		
		</div>
	    <!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
    <div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
</body>
</html>