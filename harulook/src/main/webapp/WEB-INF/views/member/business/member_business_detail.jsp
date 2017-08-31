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
	    
	    <h1>사업자회원정보보기</h1>
	    
	    	아이디 : <a>${businessDetail.userId}</a><br>
	       	닉네임 : <a>${businessDetail.userNick}</a><br>
	       	이름: <a>${businessDetail.userName}</a><br>
	       	이메일: <a>${businessDetail.userEmail}</a><br>
	       	전화번호: <a>${businessDetail.userTel}</a><br>
	       	주소: <a>${businessDetail.userAddr}</a><br>
	       	권한: <a>${businessDetail.userLevel}</a><br>
	       	사업자번호: <a>${businessDetail.userBsNo}</a><br>
	       	업종: <a>${businessDetail.userBsType}</a><br>
	       	업태: <a>${businessDetail.userBsStatus}</a><br>
	       	업체명: <a>${businessDetail.userBsName}</a><br>
	       	업체홈페이지: <a>${businessDetail.userUrl}</a><br>
	       	가입날짜: <a>${businessDetail.userDate}</a><br>
	       	
	       	<!-- 추방하기 -->
			<c:if test="${sessionScope.level == '관리자'}">
			<input class="btn btn-default" id="userDelete" type="button" value="추방하기"/>
			<form id="home" action="${pageContext.request.contextPath}/home" method="get"></form>	
			</c:if>	
			
	    </div>
		
		<!-- 우측 베너 인클루드 -->
	    <c:import url="../../module/right.jsp"></c:import>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import>                	
	  
     

</body>
</html>