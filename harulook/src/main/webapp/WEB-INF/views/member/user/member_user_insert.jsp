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
 
<script>
	$(document).ready(function(){
		
		$('#idcheckbutton').click(function(){	//아이디중복체크버튼
			alert("아이디중복체크하기");
			
			var request = $.ajax({
				  url: "./idcheck", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'idcheck' : $('#user_id').val() }, //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			
			});
			
			request.done(function( msg ) {
				msg = msg.trim();
				console.log(msg);
				console.log($('#user_id').val());
				
				
				
				
			});
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
	    
	       
	           	<label for="user_id">아이디 :</label>
	            <input name="userId" id="user_id" type="text"/>
	            <input class="btn btn-default" id="idcheckbutton" type="button" value="아이디중복검사" /><br>
	            
	            
	            <div id="idck">셀렉트된 아이디 : ${userid} </div>
	       		
	        	<label for="user_pw">비번 :</label>
	            <input name="userPw" id="user_pw" type="password"/><br>
	        
	       		<label for="user_nick">닉네임 :</label>
	            <input name="userNick" id="user_nick" type="text"/><br>
	        
	        	<label for="user_name">이름 :</label>
	            <input name="userName" id="user_name" type="text"/><br>
	        
	        	<label for="user_tel">전화번호 :</label>
	            <input name="userTel" id="user_tel" type="text"/><br>
	       
	        	<label for="user_email">이메일 :</label>
	            <input name="userEmail" id="user_email" type="text"/><br>
	        
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
	        
	        
	     	<div>
	       		<input class="btn btn-default" id="addButton" type="button" value="회원가입"/>
	        </div>
	    </form>
	

</body>
</html>