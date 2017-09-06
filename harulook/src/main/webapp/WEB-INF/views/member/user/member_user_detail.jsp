<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

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
<!-- 드롭다운과충돌 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
 
<script>
	
	$(document).ready(function(){	
		$('#userDelete').click(function(){	//회원추방
			alert('추방하였습니다');
			var request = $.ajax({
				  url: "./userDeleteAdd", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'deleteid' : $('#user_id').attr("value") }, //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			});
			$('#home').submit();	
		});
	});
	
</script>
<title>일반회원정보보기</title>
</head>
<body>
	<!-- 해더인클루드 -->
	<c:import url="../../module/header.jsp"></c:import>	
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
					<h2 id="loginTitle">${userDetail.userLevel}정보보기</h2>
						<div class="login-box well">
						 	<!-- 아이디 -->
				           	<label style="letter-spacing:11.3px" for="user_id">아이디:</label>${userDetail.userId}
				            <br>
				            <!-- 닉네임 -->	        
				       		<label style="letter-spacing:11.3px" for="user_nick">닉네임:</label>${userDetail.userNick}
				         	<br>
				            <!-- 이름 -->
				        	<label style="letter-spacing:10px" for="user_name">이&nbsp;&nbsp;름:</label>${userDetail.userName}
				            <br>
							<!-- 전화번호 -->
				        	<label style="letter-spacing:5px" for="user_tel">전화번호:</label> ${userDetail.userTel}
				            <br>
				            <!--  이메일 -->
				        	<label style="letter-spacing:11.3px" for="user_email">이메일:</label>${userDetail.userEmail}
				           	<br>
				            <!-- 주소 -->
				        	<label style="letter-spacing:10px" for="user_addr">주&nbsp;&nbsp;소:</label>${userDetail.userAddr}
				            <br>
				        	<!-- 성별 -->
				        	<label style="letter-spacing:10px" for="user_gender" >성&nbsp;&nbsp;별:</label>${userDetail.userGender}
					        <br>   
							<!-- 나이 -->	 
							<label style="letter-spacing:10px" for="user_age">나&nbsp;&nbsp;이:</label>${userDetail.userAge}
					        <br>
				        	<!-- 키 -->
				        	<label style="letter-spacing:11.3px" for="user_tall">본인키:</label>${userDetail.userTall}
				            <br>
				      		<!-- 사이즈 -->
				        	<label style="letter-spacing:11.3px" for="user_size">사이즈:</label>${userDetail.userSize}
				        	<br>
					        <!-- 가입날짜 -->
				        	<label style="letter-spacing:5px" for="user_date">가입날짜:</label> ${userDetail.userDate}
				            <br>
				        	<!-- 유저선호스타일 -->
			        		<label style="letter-spacing:11.3px" for="userStyle">스타일:</label>${userStyle}
				        	<br>
				        	<!-- 유저선호색상 -->
							<label style="letter-spacing:11.3px" for="userColor">선호색:</label>${userColor}
					       	<br>
					       	<br>
		   					
		   					<!-- 추방하기 -->
							<c:if test="${sessionScope.level == '관리자'}">
							<input class="btn btn-default" id="userDelete" type="button" value="추방하기"/>
							<form id="home" action="${pageContext.request.contextPath}/home" method="get"></form>	
							</c:if>	
		   					
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
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import>
     

</body>
</html>