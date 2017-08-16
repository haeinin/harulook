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
		$('#login').click(function(){	//로그인 버튼
			$('#loginAdd').submit();
        
		});
		
		$('#userinserformbutton').click(function(){	//회원가입버튼
			$('#userinserform').submit();
        });
		
		$('#idfindbutton').click(function(){	//아이디찾기
			$('#idfind').submit();
        });
		
		$('#pwfindbutton').click(function(){	//비밀번호찾기
			$('#pwfind').submit();
        });
	 });
	
	
</script>
<title>일반회원가입폼</title>
</head>
<body>
	
	
	    <h1>로그인 기본 폼</h1>
	    <!-- 로그인 -->
	    <form id=loginAdd action="${pageContext.request.contextPath}/login" method="post">
	    
	       		<!-- 아이디 -->
	           	<label for="user_id">아이디 :</label>
	            <input name="userId" id="user_id" type="text"/>
	           
	       		<!-- 비밀번호 -->
	        	<label for="user_pw">비번 :</label>
	            <input name="userPw" id="user_pw" type="password"/><br>
	            <a>${login}</a><br>
	        
	     	<div>
	       		<input class="btn btn-default" id="login" type="button" value="로그인"/>
	        </div>
	        
	       
	    </form>
	    
	    <!-- 회원가입하기 -->
		<form id=userinserform action="${pageContext.request.contextPath}/member_user_insert" method="get">
			<input class="btn btn-default" id="userinserformbutton" type="button" value="회원가입"/>
		</form>
		
		<!-- 아이디찾기 -->
		<form id=idfind action="${pageContext.request.contextPath}/idfind" method="get">
			<input class="btn btn-default" id="idfindbutton" type="button" value="아이디찾기"/>
		</form>
		
		<!-- 비밀번호찾기 -->
		<form id=pwfind action="${pageContext.request.contextPath}/pwfind" method="get">
			<input class="btn btn-default" id="pwfindbutton" type="button" value="비밀번호찾기"/>
		</form>
</body>
</html>