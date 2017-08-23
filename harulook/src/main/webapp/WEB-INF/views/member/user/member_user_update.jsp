<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
			var re_id = /^[a-z0-9]{5,16}$/; // 아이디 검사식
			var re_pw = /^[a-z0-9~!@#$%^&*()]{6,18}$/; // 비밀번호 검사식
			var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
			var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
			var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
			
			var 
			form = $('.form'), 
			uid = $('#user_id'),
			upw = $('#user_pw'), 
			mail = $('#user_email'), 
			url = $('#url').val(), //다른회원가입에써야함
			tel = $('#user_tel');
			
			//아이디 중복체크 메시지 숨김
			$('#idsuccess').hide();
			$('#idfail').hide();
			$('#idre').hide();
			
			//닉네임 중복체크 메시지 숨김
			$('#nicksuccess').hide();
			$('#nickfail').hide();
			$('#nickre').hide();
			
			//비밀번호 메시지 숨김
			$('#pwsuccess').hide();
			$('#pwfail').hide();
			$('#pwre').hide();
			
			//이메일 확인 메시지 숨김
			$('#emailsuccess').hide();
			$('#emailfail').hide();
			
			//전화번호 확인 메시지 숨김
			$('#telsuccess').hide();
			$('#telfail').hide();
			
			//질문의 답 메시지 숨김
			$('#userAfail').hide();
			
			//회원탈퇴비밀번호오류메시지
			$('#modalpwfail').hide();
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
					$('#idre').show();
					$('#idsuccess').hide();
					$('#idfail').hide();
					$('#user_id').val("");
					return false;
				}else{	//아이디 입력양식이 맞을때
					if($('#user_id').val() == msg){	//아이디가 중복될때 메시지
						$('#idfail').show();
						$('#idsuccess').hide();
						$('#idre').hide();
						$('#user_id').val("");
						uid.focus();
					}else if(msg == ""){	//아이디가 중복안될때 메시지
						$('#idsuccess').show();
						$('#idfail').hide();
						$('#idre').hide();
					}else{					//오류일때
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
		$('#user_nick').blur(function(){	
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
					$('#pwsuccess').hide();
					$('#pwfail').hide();
					$('#user_pw').val("");
					$('#user_pw_check').val("");
					return false;
				}else{
					if($('#user_pw').val() == $('#user_pw_check').val()){	//비밀번호 일치
						$('#pwsuccess').show();
						$('#pwfail').hide();
						$('#pwre').hide();
					}else if($('#user_pw').val() != $('#user_pw_check').val()){	//비밀번호 불일치
						$('#pwfail').show();
						$('#pwsuccess').hide();
						$('#pwre').hide();
						$('#user_pw').val("");
						$('#user_pw_check').val("");
						upw.focus();
					}else{					//오류일때
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
				$('#telsuccess').hide();
				$('#telfail').show();
			tel.focus();
			return false;
			}else{
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
		
		//회원수정하기버튼
		$('#userUpdate').click(function(){	
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
			}else if(!$('#sample4_jibunAddress').val()){	//주소
				alert('주소를입력하세요');
				$('#sample4_jibunAddress').focus();
				return false;
			}else if(!($(':input[name=userGender]:radio:checked').val())){	//성별 선택안했을때
				alert('성별입력하세요');
				$('#user_gender').focus();
				return false;
			}else if(!($(':input[name=userAge]:radio:checked').val())){	//나이 선택안했을때
				alert('나이를 입력하세요');
				$('#user_age').focus();
				return false;
			}else if(!($(':input[name=userTall]:radio:checked').val())){	//키 선택안했을때
				alert('키를 입력하세요');
				$('#user_tall').focus();
				return false;	
			}else if(!($(':input[name=userSize]:radio:checked').val())){	//사이즈 선택안했을때
				alert('사이즈를 입력하세요');
				$('#user_size').focus();
				return false;
			}else if(!($(':input[name=userQ]:radio:checked').val())){	//질문 선택안했을때
				alert('질문 입력하세요');
				$('#user_q').focus();
				return false;
			}else if(!$('#user_a').val()){	//질문의 답을 입력안했을때
				alert('답을입력하세요');
				$('#user_a').focus();
				return false;
			
			}else{
				$('#addUserUpdate').submit();
			}
		});
		
		//회원탈퇴버튼모달
		$('#userDelete').click(function(){
			$('#userDeleteModal').modal();
	    });
		
		//회원탈퇴비밀번호입력
		$('#userDeleteAdd').click(function(){	
			var request = $.ajax({
				  url: "./userDeletePw", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'pwcheck' : $('#user_id').val() }, //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			});		
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg + "받아온비번"); 
				console.log($('#user_pw_modal').val() + "입력한비번");
				if($('#user_pw_modal').val() == msg){	//비밀번호일치하면 회원삭제
					var request = $.ajax({
						  url: "./userDeleteAdd", //호출 경로
						  method: "POST",	//전송방식
						  data: { 'deleteid' : $('#user_id').val() }, //전송해줄값
						  dataType: "text" //결과값 타입 (리턴)
					});
					$('#home').submit();	//비밀번호 일치시 로그아웃처리후 홈으로
				}else if($('#user_pw_modal').val() != msg){	//비밀번호틀리면 오류메시지
					$('#modalpwfail').show();
				}else{					//오류일때
					console.log('예외');
				}
			});
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
<title>회원정보수정</title>
</head>
<body>
	
	
	    <h1>회원정보수정</h1>
	    <form id="addUserUpdate" action="${pageContext.request.contextPath}/addUserUpdate" method="post">
	    
	       		<!-- 아이디 -->
	           	<label for="user_id">아이디 :</label>
	            <input name="userId" id="user_id" type="text" readonly value="${userDetail.userId}"/>  5자~16자 이내 영문과 숫자만가능<br>
	           
	            <div>아이디중복체크결과 :
	            	<span id="idsuccess" >사용가능한 아이디입니다</span>
	            	<span id="idfail" >사용불가능한 아이디입니다</span>
	            	<span id="idre" >아이디 다시 입력해주세요</span>
	            </div>
	       		
	       		<!-- 비밀번호 -->
	        	<label for="user_pw">비번 :</label>
	            <input name="userPw" id="user_pw" type="password"/><br>
	            
	            <!-- 비밀번호 확인-->
	        	<label for="user_pw_check">비번 :</label>
	            <input name="userPwCheck" id="user_pw_check" type="password"/>6자~16자 이내 특수문자가능<br>
	            <div>비밀번호 확인결과 :
	            	<span id="pwsuccess" >비밀번호일치</span>
	            	<span id="pwfail" >비밀번호 불일치</span>
	            	<span id="pwre" >비밀번호 다시입력해주세요</span>
	            </div>
				
				<!-- 닉네임 -->	        
	       		<label for="user_nick">닉네임 :</label>
	            <input name="userNick" id="user_nick" type="text" value="${userDetail.userNick}"/>
	            <div>닉네임중복체크결과 :
	            	<span id="nicksuccess" >사용가능한 닉네임입니다</span>
	            	<span id="nickfail" >사용불가능한 닉네임입니다</span>
	            	<span id="nickre" >닉네임 다시 입력해주세요</span>
            	</div>
            	
            	<!-- 이름 -->
	        	<label for="user_name">이름 :</label>
	            <input name="userName" id="user_name" type="text" value="${userDetail.userName}"/><br>
	        	
	        	<!-- 전화번호 -->
	        	<label for="user_tel">전화번호 :</label>
	            <input name="userTel" id="user_tel" type="text" value="${userDetail.userTel}"/>- 빼고 숫자만 입력하세요 ** 수정필요<br>
	       		<!-- <select id="txtMobile1">
				    <option value="">::선택::</option>
				    <option value="011">011</option>
				    <option value="016">016</option>
				    <option value="017">017</option>
				    <option value="019">019</option>
				    <option value="010">010</option>
				</select>
				<input name="userTel" type="text" id="txtMobile2" size="4" onkeypress="onlyNumber();" />
				<input name="userTel" type="text" id="txtMobile3" size="4" /> -->
				
	       		<div>전화번호 양식검사 :
	            	<span id="telsuccess" >사용가능한 전화번호입니다</span>
	            	<span id="telfail" >사용불가능한 전화번호입니다</span>
	            </div>
	            
	          	<!--  이메일 -->
	        	<label for="user_email">이메일 :</label>
	            <input name="userEmail" id="user_email" type="text" value="${userDetail.userEmail}"/><br>
	            <div>이메일양식검사 :
	            	<span id="emailsuccess" >사용가능한 이메일입니다</span>
	            	<span id="emailfail" >사용불가능한 이메일입니다</span>
	            </div>
	        	
	        	<!-- 주소 -->
	        	<label for="user_addr">주소 :</label>
	            <!-- <input name="userAddr" id="user_addr" type="text"/><br> -->
	        	
	        	<input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				<input name="userAddr" type="text" id="sample4_jibunAddress" placeholder="지번주소" value="${userDetail.userAddr}"><br><br>
				<span id="guide" style="color:#999"></span>
	        	
	        	
	        	<!-- 성별 -->
	        	<label for="user_gender" >성별 :</label>
	            <div class="radio">
			      <label><input name="userGender" id="user_gender" type="radio" value="남" >남</label>
			      <label><input name="userGender" id="user_gender" type="radio" value="여" >여</label>
			    </div>
			   
				
				<!-- 나이 -->	        	
	        	<label for="user_age">나이 :</label>
	            <div class="radio">
			      <label><input name="userAge" id="user_age" type="radio" value="10" >10대</label>
			      <label><input name="userAge" id="user_age" type="radio" value="20" >20대</label>
			      <label><input name="userAge" id="user_age" type="radio" value="30" >30대</label>
			      <label><input name="userAge" id="user_age" type="radio" value="40" >40대</label>
			      <label><input name="userAge" id="user_age" type="radio" value="50" >50대</label>
			      <label><input name="userAge" id="user_age" type="radio" value="60" >60대이상</label>
			    </div>
	        	
	        	<!-- 키 -->
	        	<label for="user_tall">키 :</label>
	            <div class="radio">
			      <label><input name="userTall" id="user_tall" type="radio" value="큰키" >큰키</label>
			      <label><input name="userTall" id="user_tall" type="radio" value="보통" >보통</label>
			      <label><input name="userTall" id="user_tall" type="radio" value="작은키" >작은키</label>
			    </div>
	      		
	      		<!-- 사이즈 -->
	        	<label for="user_size">사이즈 :</label>
	            <div class="radio">
			      <label><input name="userSize" id="user_size" type="radio" value="마른" >마른</label>
			      <label><input name="userSize" id="user_size" type="radio" value="보통" >보통</label>
			      <label><input name="userSize" id="user_size" type="radio" value="뚱뚱" >뚱뚱</label>
			    </div>
			    
			    <!-- 질문 -->
	        	<label for="user_q">질문 :</label>
	            <div class="radio">
			      <label><input name="userQ" id="user_q" type="radio" value="나의 보물은" >나의 보물은</label>
			      <label><input name="userQ" id="user_q" type="radio" value="나의 고향은" >나의 고향은</label>
			      <label><input name="userQ" id="user_q" type="radio" value="나의 초등학교" >나의 초등학교</label>
			      <label><input name="userQ" id="user_q" type="radio" value="나의 고등학교" >나의 고등학교</label>
			      <label><input name="userQ" id="user_q" type="radio" value="나의 비밀은" >나의 비밀은</label>
			      <label><input name="userQ" id="user_q" type="radio" value="나의 꿈은" >나의 꿈은</label>
			    </div>
	       		
	       		<!-- 답 -->
	        	<label for="user_a">질문의 답 :</label>
	            <input name="userA" id="user_a" type="text" value="${userDetail.userA}"/><br>
        		<div>질문의 답 오류구문 :
	            	<span id="userAfail" >답을 입력하세요</span>
	            </div>
	        	
	        	<!-- 유저선호스타일 -->
        		<div class="form-group">
					<label for="userStyle">회원선호스타일 :</label>
				  	<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_10">액티브
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_09">심플
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_08">로맨틱
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_07">러블리
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_06">럭셔리
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_05">댄디
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_04">스트리트
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_03">빈티지
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_02">캐쥬얼
					<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_01">클래식
				</div>
				
				<!-- 유저선호색상 -->
				<div class="form-group">
			       	<label for="userColor">회원선호컬러 :</label>
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_01" class="checkSelectColor">빨강
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_02" class="checkSelectColor">주황
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_03" class="checkSelectColor">노랑
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_04" class="checkSelectColor">초록
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_05" class="checkSelectColor">파랑
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_06" class="checkSelectColor">남색
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_07" class="checkSelectColor">보라
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_13" class="checkSelectColor">핑크
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_11" class="checkSelectColor">갈색
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_12" class="checkSelectColor">베이지
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_08" class="checkSelectColor">검정
			       	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_09" class="checkSelectColor">회색
			     	<input type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_10" class="checkSelectColor">흰색
			     </div>
	     	
	     	<!-- 회원가입버튼 -->
	     	<div>
	       		<input class="btn btn-default" id="userUpdate" type="button" value="수정확인"/>
	        </div>
	    </form>
	   
	    <!-- 회원탈퇴버튼 -->
    	<div>
      		<input class="btn btn-default" id="userDelete" type="button" value="탈퇴하기"/>
        </div>	
		
		<!-- 탈퇴하기버튼 modal -->
		<div class="modal fade" id="userDeleteModal" role="dialog">
		    <div class="modal-dialog">
		    	<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding:35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						
						<h4>비밀번호입력</h4>
						<label for="user_pw">비번 :</label>
		           		<input name="userPw" id="user_pw_modal" type="password"/><br>
		           		<span id="modalpwfail" >비밀번호 불일치</span>
						<div>
		   					<input class="btn btn-default" id="userDeleteAdd" type="button" value="탈퇴하기"/>
						</div>	
						<form id="home" action="${pageContext.request.contextPath}/logout" method="post"></form>
					</div>
			    </div>
		    </div>
		</div>
		
</body>
</html>