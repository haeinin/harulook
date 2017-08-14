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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script> 
<!-- 유효성검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
			
		//아이디중복체크버튼
		$('#idcheckbutton').click(function(){	
			alert("아이디중복체크하기");
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
					alert('[ID 입력 오류] 유효한 ID를 입력해 주세요.');
					uid.focus();
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
					}else if(msg == ""){	//아이디가 중복안될때 메시지
						$('#idsuccess').show();
						$('#idfail').hide();
						$('#idre').hide();
					}else{					//오류일때
						$('#idre').show();
						$('#idsuccess').hide();
						$('#idfail').hide();
						$('#user_id').val("");
					}
				}
			});
	  	});
		
		//닉네임 중복체크버튼
		$('#nickcheckbutton').click(function(){	
			alert("닉네임중복체크하기");
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
				}else if(msg == ""){	//아이디가 중복안될때 메시지
					$('#nicksuccess').show();
					$('#nickfail').hide();
					$('#nickre').hide();
				}else{					//오류일때
					$('#nickre').show();
					$('#nicksuccess').hide();
					$('#nickfail').hide();
					$('#user_nick').val("");
				}
			});
	  	});
		
		//비밀번호 확인
		$('#pwcheck').click(function(){	
			
				if(re_pw.test(upw.val()) != true) { // 비밀번호 양식 오류
					alert('[PW 입력 오류] 유효한 PW를 입력해 주세요.');
					upw.focus();
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
					}else{					//오류일때
						$('#pwre').show();
						$('#pwsuccess').hide();
						$('#pwfail').hide();
						$('#user_pw').val("");
						$('#user_pw_check').val("");
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
		
		$('#addButton').click(function(){	//회원가입버튼
			$('#addFormUser').submit();
        });
		
    });
	
	
</script>
<title>일반회원가입폼</title>
</head>
<body>
	
	
	    <h1>회원가입 기본 폼</h1>
	    <form id="addFormUser" action="${pageContext.request.contextPath}/userAdd" method="post">
	    
	       		<!-- 아이디 -->
	           	<label for="user_id">아이디 :</label>
	            <input name="userId" id="user_id" type="text"/>
	            <input class="btn btn-default" id="idcheckbutton" type="button" value="아이디중복검사" /> 5자~16자 이내 영문과 숫자만가능<br>
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
	            <input name="userPw" id="user_pw_check" type="password"/>
	            <input class="btn btn-default" id="pwcheck" type="button" value="비밀번호확인" />6자~16자 이내 특수문자가능<br>
				<div>비밀번호 확인결과 :
	            	<span id="pwsuccess" >비밀번호일치</span>
	            	<span id="pwfail" >비밀번호 불일치</span>
	            	<span id="pwre" >비밀번호 다시입력해주세요</span>
	            </div>
				
				<!-- 닉네임 -->	        
	       		<label for="user_nick">닉네임 :</label>
	            <input name="userNick" id="user_nick" type="text"/>
	            <input class="btn btn-default" id="nickcheckbutton" type="button" value="닉네임중복검사" /><br>
        		<div>닉네임중복체크결과 :
	            	<span id="nicksuccess" >사용가능한 닉네임입니다</span>
	            	<span id="nickfail" >사용불가능한 닉네임입니다</span>
	            	<span id="nickre" >닉네임 다시 입력해주세요</span>
            	</div>
            	
            	<!-- 이름 -->
	        	<label for="user_name">이름 :</label>
	            <input name="userName" id="user_name" type="text"/><br>
	        
	        	<label for="user_tel">전화번호 :</label>
	            <input name="userTel" id="user_tel" type="text"/> - 빼고 숫자만 입력하세요 ** 수정필요<br>
	       		<div>전화번호 양식검사 :
	            	<span id="telsuccess" >사용가능한 전화번호입니다</span>
	            	<span id="telfail" >사용불가능한 전화번호입니다</span>
	            </div>
	            
	        	<label for="user_email">이메일 :</label>
	            <input name="userEmail" id="user_email" type="text"/><br>
	            <div>이메일양식검사 :
	            	<span id="emailsuccess" >사용가능한 이메일입니다</span>
	            	<span id="emailfail" >사용불가능한 이메일입니다</span>
	            </div>
	        
	        	<label for="user_addr">주소 :</label>
	            <input name="userAddr" id="user_addr" type="text"/><br>
	        
	        	<label for="user_gender">성별 :</label>
	            <input name="userGender" id="user_gender" type="text"/><br>
	        
	        	<label for="user_age">나이 :</label>
	            <input name="userAge" id="user_age" type="text"/><br>
	        
	        	<label for="user_tall">키 :</label>
	            <input name="userTall" id="user_tall" type="text"/><br>
	      
	        	<label for="user_size">사이즈 :</label>
	            <input name="userSize" id="user_size" type="text"/><br>
	        
	        	<label for="user_q">질문 :</label>
	            <input name="userQ" id="user_q" type="text"/><br>
	       
	        	<label for="user_a">질문의 답 :</label>
	            <input name="userA" id="user_a" type="text"/><br>
	        	
	        	<!-- 색상이랑 스타일 체크박스로 넣어야한다 -->
	        
	     	<div>
	       		<input class="btn btn-default" id="addButton" type="button" value="회원가입"/>
	        </div>
	    </form>
	

</body>
</html>