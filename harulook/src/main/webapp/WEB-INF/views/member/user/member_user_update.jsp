<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
			
			var 
			form = $('.form'), 
			uid = $('#user_id'),
			upw = $('#user_pw'), 
			mail = $('#user_email'), 
			url = $('#url').val(), //다른회원가입에써야함
			tel = $('#user_tel');
			
			//아이디 중복체크 메시지 숨김
			$('#idsfirst').hide();
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
			
			//회원탈퇴비밀번호오류메시지
			$('#modalpwfail').hide();
		
		
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
		
		//회원수정하기버튼
		$('#userUpdateFormButton').click(function(){	
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
			}else if(!($('#user_gender').val())){	//성별 선택안했을때
				alert('성별입력하세요');
				$('#user_gender').focus();
				return false;
			}else if(!($('#user_age').val())){	//나이 선택안했을때
				alert('나이를 입력하세요');
				$('#user_age').focus();
				return false;
			}else if(!($('#user_tall').val())){	//키 선택안했을때
				alert('키를 입력하세요');
				$('#user_tall').focus();
				return false;	
			}else if(!($('#user_size').val())){	//사이즈 선택안했을때
				alert('사이즈를 입력하세요');
				$('#user_size').focus();
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
		
		
		/* 색상별 토글 버튼  */
		function toggleColor(color) { //color: 선택한 색상
			
			// 해당되는 색상 체크박스가 체크되지 않았을 때
			if($('#searchColor'+color+'').is(':checked') == false) { 
				$('input:checkbox[id="searchColor'+color+'"]').prop('checked',true);	// 체크박스 체크
				$('#circle'+color+'').attr('class','fa fa-check-circle cursor-click');				// 색상 버튼 체크 상태 그림으로 
				console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
				
			// 해당되는 색상 체크박스가 이미 체크되었을 때
			} else if($('#searchColor'+color+'').is(':checked') == true) {
				$('input:checkbox[id="searchColor'+color+'"]').prop('checked',false);	// 체크박스 체크 해제
				$('#circle'+color+'').attr('class','fa fa-circle cursor-click');						// 색상 버튼 체크 해제 상태 그림으로 
				console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
			}
		} 
		
		// 빨간색 버튼 클릭
		$('#circleRed').click(function(){
			toggleColor('Red');
		});
		
		// 주황색 버튼 클릭
		$('#circleOrange').click(function(){
			toggleColor('Orange');
		});
		
		// 노란색 버튼 클릭
		$('#circleYellow').click(function(){
			toggleColor('Yellow');
		});
		
		// 초록색 버튼 클릭
		$('#circleGreen').click(function(){
			toggleColor('Green');
		});
		
		// 파란색 버튼 클릭
		$('#circleBlue').click(function(){
			toggleColor('Blue');
		});
		
		// 남색 버튼 클릭
		$('#circleNavy').click(function(){
			toggleColor('Navy');
		});
		
		// 보라색 버튼 클릭
		$('#circlePurple').click(function(){
			toggleColor('Purple');
		});
		
		// 검정색 버튼 클릭
		$('#circleBlack').click(function(){
			toggleColor('Black');
		});
		
		// 회색 버튼 클릭
		$('#circleGrey').click(function(){
			toggleColor('Grey');
		});
		
		// 흰색 버튼 클릭
		$('#circleWhite').click(function(){
			toggleColor('White');
		});
		
		// 갈색 버튼 클릭
		$('#circleBrown').click(function(){
			toggleColor('Brown');
		});
		
		// 베이지색 버튼 클릭
		$('#circleBeige').click(function(){
			toggleColor('Beige');
		});
		
		// 분홍색 버튼 클릭
		$('#circlePink').click(function(){
			toggleColor('Pink');
		});
		
		/* 사용자 색상 체크 판별 */
		if($('#searchColorRed').is(':checked') == true) {
			$('#circleRed').attr('class','fa fa-check-circle');
		} 
		if($('#searchColorOrange').is(':checked') == true) {
			$('#circleOrange').attr('class','fa fa-check-circle');
		}
		if($('#searchColorYellow').is(':checked') == true) {
			$('#circleYellow').attr('class','fa fa-check-circle');
		} 
		if($('#searchColorGreen').is(':checked') == true) {
			$('#circleGreen').attr('class','fa fa-check-circle');
		}
		if($('#searchColorBlue').is(':checked') == true) {
			$('#circleBlue').attr('class','fa fa-check-circle');
		} 
		if($('#searchColorNavy').is(':checked') == true) {
			$('#circleNavy').attr('class','fa fa-check-circle');
		}
		if($('#searchColorPurple').is(':checked') == true) {
			$('#circlePurple').attr('class','fa fa-check-circle');
		} 
		if($('#searchColorBlack').is(':checked') == true) {
			$('#circleBlack').attr('class','fa fa-check-circle');
		}
		if($('#searchColorGrey').is(':checked') == true) {
			$('#circleGrey').attr('class','fa fa-check-circle');
		} 
		if($('#searchColorWhite').is(':checked') == true) {
			$('#circleWhite').attr('class','fa fa-check-circle');
		}
		if($('#searchColorBrown').is(':checked') == true) {
			$('#circleBrown').attr('class','fa fa-check-circle');
		}
		if($('#searchColorBeige').is(':checked') == true) {
			$('#circleBeige').attr('class','fa fa-check-circle');
		}
		if($('#searchColorPink').is(':checked') == true) {
			$('#circlePink').attr('class','fa fa-check-circle');
		}
		
		
		//이미지 실시간 띄우기
		$('#userImgFile').on('change', function(){
     	   var id = $(this).attr('id');
     	   id = id + "View";
     	   console.log(id);
             readURL(this , id);
             $('#userImgFileUpdate').hide();
         });
		function readURL(input ,id) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $("#" + id).attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
		
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
<title>회원수정폼</title>
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
					<h2 id="loginTitle" left="300px">회원수정하기</h2>
						<div class="login-box well">
							 <form id="addUserUpdate" action="${pageContext.request.contextPath}/addUserUpdate" method="post" enctype="multipart/form-data">
								<!-- 아이디 -->
					           	<label style="letter-spacing:11.3px" for="user_id">아이디</label>
					            <input name="userId" id="user_id" type="text" readonly value="${userDetail.userId}"/>  
						            <span id="idsfirst" >5자~16자 이내 영문과 숫자만가능</span>
					            	<span id="idsuccess" >사용가능한 아이디입니다</span>
					            	<span id="idfail" >사용불가능한 아이디입니다</span>
					            	<span id="idre" >아이디 다시 입력해주세요</span><br>
					            
					            <!-- 프로필사진 -->
					            <div class="form-group">
					            <label style="letter-spacing:11.3px" for="userImgFile">프로필</label>
					            <img id="userImgFileView" src="#" alt="" class="img-responsive" style="max-width: 100px;"/>
					            <img id="userImgFileUpdate" class="img-responsive" style="max-width: 100px; " alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${userDetail.userImg}">
								<input name="userImgFile" id="userImgFile" type="file"/>
					            <span id="imgFail" >사진을 올려주세요.</span><br>
						        </div>
					            					            	
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
					            <input name="userNick" id="user_nick" type="text" value="${userDetail.userNick}"/>
					            <input class="btn btn-default" id="userNickCheckButton" type="button" value="Check"/>
					           		<span id="nicksuccess" >사용가능한 닉네임입니다</span>
					            	<span id="nickfail" >사용불가능한 닉네임입니다</span>
					            	<span id="nickre" >닉네임 다시 입력해주세요</span><br>
				            	
				            	<!-- 이름 -->
					        	<label style="letter-spacing:11.3px" for="user_name">이&nbsp;&nbsp;름</label>
					            <input name="userName" id="user_name" type="text" value="${userDetail.userName}"/><br>
								
								<!-- 전화번호 -->
					        	<label style="letter-spacing:5px" for="user_tel">전화번호</label>
					            <input name="userTel" id="user_tel" type="text" value="${userDetail.userTel}"/>
									<span id="telfirst" >&nbsp;- 빼고 숫자만 입력하세요</span>
					            	<span id="telsuccess" >사용가능한 전화번호입니다</span>
					            	<span id="telfail" >사용불가능한 전화번호입니다</span><br>	
					            
					            <!--  이메일 -->
					        	<label style="letter-spacing:11.8px" for="user_email">이메일</label>
					            <input name="userEmail" id="user_email" type="text" value="${userDetail.userEmail}"/>
					           		<span id="emailsuccess" >사용가능한 이메일입니다</span>
					            	<span id="emailfail" >사용불가능한 이메일입니다</span><br>
					            					            
				            	<!-- 주소 -->
					        	<label style="letter-spacing:11.3px" for="user_addr">주&nbsp;&nbsp;소</label>
					            <!-- <input name="userAddr" id="user_addr" type="text"/><br> -->
					        	
					        	<input type="text" id="sample4_postcode" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
								<input name="userAddr" type="text" id="sample4_jibunAddress" placeholder="지번주소" value="${userDetail.userAddr}"><br><br>
								<span id="guide" style="color:#999"></span>
					        	    	
					        	<!-- 성별 -->
					        	<div>
						        	<label style="letter-spacing:11.3px" for="user_gender" >성&nbsp;&nbsp;별</label>
						            <select class="" style="WIDTH: 131pt; HEIGHT: 20pt" name="userGender" id="user_gender">
										<option>${userDetail.userGender}</option>
						            	<option>남</option>
						            	<option>여</option>
						            </select>
								</div>
								
								<!-- 나이 -->	   
								<div>     	
					        	<label style="letter-spacing:11.3px" for="user_age">나&nbsp;&nbsp;이</label>
						            <select class="" style="WIDTH: 131pt; HEIGHT: 20pt" name="userAge" id="user_age">
										<option>${userDetail.userAge}</option>
						            	<option>10</option>
						            	<option>20</option>
						            	<option>30</option>
						            	<option>40</option>
						            	<option>50</option>
						            	<option>60</option>
						            </select>
					        	</div>
					        	<!-- 키 -->
					        	<div>
					        	<label style="letter-spacing:11.8px" for="user_tall">본인키</label>
					            <select class="" style="WIDTH: 131pt; HEIGHT: 20pt" name="userTall" id="user_tall">
									<option>${userDetail.userTall}</option>
					            	<option>큰키</option>
					            	<option>보통</option>
					            	<option>작은키</option>
				            	</select>
					      		</div>
					      		<!-- 사이즈 -->
					        	<div>
						        	<label style="letter-spacing:11.8px" for="user_size">사이즈</label>
						            <select class="" style="WIDTH: 131pt; HEIGHT: 20pt" name="userSize" id="user_size">
										<option>${userDetail.userSize}</option>
						            	<option>마른</option>
						            	<option>보통</option>
						            	<option>뚱뚱</option>
					            	</select>
							    </div>
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
					            <input name="userA" id="user_a" type="text" value="${userDetail.userA}"/>
				        			<span id="userAfail" >답을 입력하세요</span><br>
					        	<br>
					       
					        	<!-- 유저선호스타일 -->
				        		<div class="form-group">
									<label style="letter-spacing:5px" for="userStyle">회원선호스타일</label>
									<br>
								  	<c:choose>
								  		<c:when test="${userStyle.contains('클래식')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_01" checked="checked">클래식
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_01">클래식
								  		</c:otherwise>
									</c:choose>
									
									<c:choose>
								  		<c:when test="${userStyle.contains('캐쥬얼')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_02" checked="checked">캐쥬얼
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_02">캐쥬얼
								  		</c:otherwise>
									</c:choose>
									
									<c:choose>
								  		<c:when test="${userStyle.contains('빈티지')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_03" checked="checked">빈티지
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_03">빈티지
								  		</c:otherwise>
									</c:choose>
									
									<c:choose>
								  		<c:when test="${userStyle.contains('스트리트')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_04" checked="checked">스트리트
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_04">스트리트
								  		</c:otherwise>
									</c:choose>
								    
								   	<c:choose>
								  		<c:when test="${userStyle.contains('댄디')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_05" checked="checked">댄디
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_05">댄디
								  		</c:otherwise>
									</c:choose>
								   	<br>
								   	<c:choose>
								  		<c:when test="${userStyle.contains('럭셔리')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_06" checked="checked">럭셔리
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_06">럭셔리
								  		</c:otherwise>
									</c:choose>
								    
								    <c:choose>
								  		<c:when test="${userStyle.contains('러블리')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_07" checked="checked">러블리
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_07">러블리
								  		</c:otherwise>
									</c:choose>
								    
								    <c:choose>
								  		<c:when test="${userStyle.contains('로맨틱')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_08" checked="checked">로맨틱
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_08">로맨틱
								  		</c:otherwise>
									</c:choose>
								    
								    <c:choose>
								  		<c:when test="${userStyle.contains('심플')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_09" checked="checked">심플
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_09">심플
								  		</c:otherwise>
									</c:choose>
								    
								    <c:choose>
								  		<c:when test="${userStyle.contains('액티브')}">
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_10" checked="checked">액티브
								  		</c:when>
								  		<c:otherwise>
								  			<input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_10">액티브
								  		</c:otherwise>
									</c:choose>
								</div>
								
								<!-- 유저선호색상 -->
								<div class="form-group">
							       	<label style="letter-spacing:5px" for="userColor">회원선호컬러</label>
							       	<br>
							       	<i id="circleRed" class="fa fa-circle cursor-click" title="빨강" style="font-size: 24px; color: red; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleOrange" class="fa fa-circle cursor-click" title="주황" style="font-size: 24px; color: orange; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleYellow" class="fa fa-circle cursor-click" title="노랑" style="font-size: 24px; color: yellow; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleGreen" class="fa fa-circle cursor-click" title="초록" style="font-size: 24px; color: green; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleBlue" class="fa fa-circle cursor-click" title="파랑" style="font-size: 24px; color: deepskyblue; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleNavy" class="fa fa-circle cursor-click" title="남색(네이비)" style="font-size: 28px; color: navy;"></i>
							     	<i id="circlePurple" class="fa fa-circle cursor-click" title="보라" style="font-size: 28px; color: purple;"></i>
							     	<i id="circleBlack" class="fa fa-circle cursor-click" title="검정" style="font-size: 28px; color: black;"></i>
							     	<i id="circleGrey" class="fa fa-circle cursor-click" title="회색" style="font-size: 24px; color: grey; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleWhite" class="fa fa-circle cursor-click" title="흰색" style="font-size: 24px; color: white; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleBrown" class="fa fa-circle cursor-click" title="갈색" style="font-size: 24px; color: brown; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circleBeige" class="fa fa-circle cursor-click" title="베이지" style="font-size: 24px; color: beige; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	<i id="circlePink" class="fa fa-circle cursor-click" title="분홍" style="font-size: 24px; color: pink; background-color: black; border-radius: 47%; width: 22px;"></i>
							     	
							       	
							       	<div style="display:none;">
								       	<c:choose>
									  		<c:when test="${userColor.contains('빨강')}">
									  			<input type="checkbox" id="searchColorRed" name="colorValue" value="color_01" class="checkSelectColor" checked="checked">빨강
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorRed" name="colorValue" value="color_01" class="checkSelectColor">빨강
									  		</c:otherwise>
										</c:choose>
								       	
								       	<c:choose>
									  		<c:when test="${userColor.contains('주황')}">
									  			<input type="checkbox" id="searchColorOrange" name="colorValue" value="color_02" class="checkSelectColor" checked="checked">주황
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorOrange" name="colorValue" value="color_02" class="checkSelectColor">주황
									  		</c:otherwise>
										</c:choose>
										
										<c:choose>
									  		<c:when test="${userColor.contains('노랑')}">
									  			<input type="checkbox" id="searchColorYellow" name="colorValue" value="color_03" class="checkSelectColor" checked="checked">노랑
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorYellow" name="colorValue" value="color_03" class="checkSelectColor">노랑
									  		</c:otherwise>
										</c:choose>
								       	
								       	<c:choose>
									  		<c:when test="${userColor.contains('초록')}">
									  			<input type="checkbox" id="searchColorGreen" name="colorValue" value="color_04" class="checkSelectColor" checked="checked">초록
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorGreen" name="colorValue" value="color_04" class="checkSelectColor">초록
									  		</c:otherwise>
										</c:choose>
										
										<c:choose>
									  		<c:when test="${userColor.contains('파랑')}">
									  			<input type="checkbox" id="searchColorBlue" name="colorValue" value="color_05" class="checkSelectColor" checked="checked">파랑
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorBlue" name="colorValue" value="color_05" class="checkSelectColor">파랑
									  		</c:otherwise>
										</c:choose>
										
										<c:choose>
									  		<c:when test="${userColor.contains('남색')}">
									  			<input type="checkbox" id="searchColorNavy" name="colorValue" value="color_06" class="checkSelectColor" checked="checked">남색
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorNavy" name="colorValue" value="color_06" class="checkSelectColor">남색
									  		</c:otherwise>
										</c:choose>
										
										<c:choose>
									  		<c:when test="${userColor.contains('보라')}">
									  			<input type="checkbox" id="searchColorPurple" name="colorValue" value="color_07" class="checkSelectColor" checked="checked">보라
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorPurple" name="colorValue" value="color_07" class="checkSelectColor">보라
									  		</c:otherwise>
										</c:choose>
								       	<br>
								       	<c:choose>
									  		<c:when test="${userColor.contains('검정')}">
									  			<input type="checkbox" id="searchColorBlack" name="colorValue" value="color_08" class="checkSelectColor" checked="checked">검정
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorBlack" name="colorValue" value="color_08" class="checkSelectColor">검정
									  		</c:otherwise>
										</c:choose>
								       	
								       	<c:choose>
									  		<c:when test="${userColor.contains('회색')}">
									  			<input type="checkbox" id="searchColorGrey" name="colorValue" value="color_09" class="checkSelectColor" checked="checked">회색
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorGrey" name="colorValue" value="color_09" class="checkSelectColor">회색
									  		</c:otherwise>
										</c:choose>
								       	
								       	<c:choose>
									  		<c:when test="${userColor.contains('흰색')}">
									  			<input type="checkbox" id="searchColorWhite" name="colorValue" value="color_10" class="checkSelectColor" checked="checked">흰색
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorWhite" name="colorValue" value="color_10" class="checkSelectColor">흰색
									  		</c:otherwise>
										</c:choose>
										
										<c:choose>
									  		<c:when test="${userColor.contains('갈색')}">
									  			<input type="checkbox" id="searchColorBrown" name="colorValue" value="color_11" class="checkSelectColor" checked="checked">갈색
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorBrown" name="colorValue" value="color_11" class="checkSelectColor">갈색
									  		</c:otherwise>
										</c:choose>
								       	
								       	<c:choose>
									  		<c:when test="${userColor.contains('베이지')}">
									  			<input type="checkbox" id="searchColorBeige" name="colorValue" value="color_12" class="checkSelectColor" checked="checked">베이지
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorBeige" name="colorValue" value="color_12" class="checkSelectColor">베이지
									  		</c:otherwise>
										</c:choose>
										
										<c:choose>
									  		<c:when test="${userColor.contains('분홍')}">
									  			<input type="checkbox" id="searchColorPink" name="colorValue" value="color_13" class="checkSelectColor" checked="checked">분홍
									  		</c:when>
									  		<c:otherwise>
									  			<input type="checkbox" id="searchColorPink" name="colorValue" value="color_13" class="checkSelectColor">분홍
									  		</c:otherwise>
										</c:choose>
									 </div>
							     </div>
			            	</form>	
			            	<!-- 회원가입버튼 -->
					     	<div>
					       		<input class="btn btn-default" id="userUpdateFormButton" type="button" value="회원수정"/>
					        </div>
					        
					        <!-- 회원탈퇴버튼 -->
					    	<div>
					      		<input class="btn btn-default" id="userDelete" type="button" value="탈퇴하기"/>
					        </div>	
						 </div>
					</div>
				</div>
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