<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#addButton').click(function(){
			$('#addFormUser').submit();
           
        });
    });
</script>
<title>BOARD ADD(spring mvc + mybatis 방식)</title>
</head>
<body>
	<div class="container">
	    <h1>회원가입 기본 폼</h1>
	    <form id="addFormUser" action="${pageContext.request.contextPath}/userAdd" method="post">
	    
	        <div class="form-group">
	            <label for="user_id">아이디 :</label>
	            <input class="form-control" name="user_id" id="user_id" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_pw">비번 :</label>
	            <input class="form-control" name="user_pw" id="user_pw" type="password"/>
	        </div>
	       
	        <div class="form-group">
	            <label for="user_nick">닉네임 :</label>
	            <input class="form-control" name="user_nick" id="user_nick" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_name">이름 :</label>
	            <input class="form-control" name="user_name" id="user_name" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_tel">전화번호 :</label>
	            <input class="form-control" name="user_tel" id="user_tel" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_email">이메일 :</label>
	            <input class="form-control" name="user_email" id="user_email" type="text"/>
	        </div>
	        	        
	        <div class="form-group">
	            <label for="user_addr">주소 :</label>
	            <input class="form-control" name="user_addr" id="user_addr" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_gender">성별 :</label>
	            <input class="form-control" name="user_gender" id="user_gender" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_age">나이 :</label>
	            <input class="form-control" name="user_age" id="user_age" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_tall">키 :</label>
	            <input class="form-control" name="user_tall" id="user_tall" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_size">사이즈 :</label>
	            <input class="form-control" name="user_size" id="user_size" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_q">질문 :</label>
	            <input class="form-control" name="user_q" id="user_q" type="text"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="user_a">질문의 답 :</label>
	            <input class="form-control" name="user_a" id="user_a" type="text"/>
	        </div>
	        
	       	       
	        
	        <div>
	       		<input class="btn btn-default" id="addButton" type="button" value="회원가입"/>
	            <input class="btn btn-default" type="reset" value="초기화"/>
	            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
	        </div>
	    </form>
	</div>

</body>
</html>