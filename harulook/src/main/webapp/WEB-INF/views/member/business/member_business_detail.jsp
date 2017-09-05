<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<title>사업자회원정보보기</title>
</head>
<body>
	<!-- 해더인클루드 -->
	<c:import url="../../module/header.jsp"></c:import>	
	<!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-1"></div>
	    <div id="div1" class="col-xs-9">
	    
	     <div class="container">
			<div class="row">
				<div class="page-header">
		  	    
				</div>
					<div id="" class="col-md-2"></div>
					<div id="" class="col-md-7">
					<h2 id="loginTitle">${businessDetail.userLevel}정보보기</h2>
						<div class="login-box well">
						 	<!-- 아이디 -->
				           	<label style="letter-spacing:11.3px" for="user_id">아이디:</label>${businessDetail.userId}
				            <br>
				            <!-- 닉네임 -->	        
				       		<label style="letter-spacing:11.3px" for="user_nick">닉네임:</label>${businessDetail.userNick}
				         	<br>
				            <!-- 이름 -->
				        	<label style="letter-spacing:10px" for="user_name">이&nbsp;&nbsp;름:</label>${businessDetail.userName}
				            <br>
							<!-- 전화번호 -->
				        	<label style="letter-spacing:5px" for="user_tel">전화번호:</label> ${businessDetail.userTel}
				            <br>
				            <!--  이메일 -->
				        	<label style="letter-spacing:11.3px" for="user_email">이메일:</label>${businessDetail.userEmail}
				           	<br>
				            <!-- 주소 -->
				        	<label style="letter-spacing:10px" for="user_addr">주&nbsp;&nbsp;소:</label>${businessDetail.userAddr}
				            <br>
				        	<!-- 사업자번호 -->
				        	<label style="letter-spacing:1px" for="user_bs_no">사업자번호:</label>&nbsp;&nbsp;${businessDetail.userBsNo}
				            <br>
				            <!-- 업종 -->
				        	<label style="letter-spacing:10px" for="user_bs_type">업&nbsp;&nbsp;종:</label>${businessDetail.userBsType}
				            <br>
				            <!-- 업태 -->
				        	<label style="letter-spacing:10px" for="user_bs_status">업&nbsp;&nbsp;태:</label>${businessDetail.userBsStatus}
				            <br>
				            <!-- 업체명 -->
				        	<label style="letter-spacing:11.3px" for="user_bs_name">업체명:</label>${businessDetail.userBsName}
				            <br>
				            <!-- 업체홈페이지 -->
				        	<label style="letter-spacing:5px" for="user_url">홈페이지:</label> ${businessDetail.userUrl}
				            <br>
				            <!-- 가입날짜 -->
				        	<label style="letter-spacing:5px" for="user_date">가입날짜:</label> ${businessDetail.userDate}
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