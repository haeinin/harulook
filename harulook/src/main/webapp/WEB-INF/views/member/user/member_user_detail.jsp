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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
	
</script>
<title>일반회원정보보기</title>
</head>
<body>
	<!-- 해더인클루드 -->
	<c:import url="../../module/header.jsp"></c:import>	
	<!-- 바디 인클루드 -->
    <div class="row">
	    <div class="col-xs-1"></div>
	    <div id="div1" class="col-xs-9">
	    
	    <h1>일반회원정보보기</h1>
	    
	    	아이디 : <a>${userDetail.userId}</a><br>
	       	닉네임 : <a>${userDetail.userNick}</a><br>
	       	이름: <a>${userDetail.userName}</a><br>
	       	성별: <a>${userDetail.userGender}</a><br>
	       	이메일: <a>${userDetail.userEmail}</a><br>
	       	전화번호: <a>${userDetail.userTel}</a><br>
	       	주소: <a>${userDetail.userAddr}</a><br>
	       	나이: <a>${userDetail.userAge}</a><br>
	       	키: <a>${userDetail.userTall}</a><br>
	       	체형: <a>${userDetail.userSize}</a><br>
	       	권한: <a>${userDetail.userLevel}</a><br>
	       	가입날짜: <a>${userDetail.userDate}</a><br>
	       	
	                    	
	                    
                          스타일:    
           <c:forEach var="c" items="${userColor}">
                 	<a>${c.colorValue}</a><br>
           </c:forEach>
           <br>
                         선호색: 
           <c:forEach var="s" items="${userStyle}">
               		<a>${s.styleValue}</a><br>
           </c:forEach>
        </div>  
        
        <!-- 우측 베너 인클루드 -->
	    <c:import url="../../module/right.jsp"></c:import>
    </div>
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import>
     

</body>
</html>