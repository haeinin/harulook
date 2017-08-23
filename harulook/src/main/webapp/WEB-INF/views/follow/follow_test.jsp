<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript">
	$(document).ready(function(){
		//친구인지아닌지 판별
		console.log($('#checkFollow').val());
		$($('#followInsert')).hide();
		$($('#bbbb')).hide();
		if(!$('#checkFollow').val()){
			$($('#followInsert')).show();
			$($('#bbbb')).hide();
		}else{
			$($('#bbbb')).show();
			$($('#followInsert')).hide();
		}
		//친구등록버튼
		$('#followInsert').click(function(){
			var request = $.ajax({
				  url: "./followInsert", //호출 경로
				  method: "POST",	//전송방식
				  data:  { 'followId' : $('#checkFollowVal').val() } , //전송해줄값
				  dataType: "text" //결과값 타입 (리턴)
			});		//친구등록 성공여부에 따라서 버튼 체인지나 쇼 하이드 필요할듯
		});
	});
</script>
</head>
<body>
	
	<input class="checkFollow" id="checkFollow" name="checkFollow" value="${checkFollow}">팔로우 되있는지체크 : ${checkFollow}</input>
	<button type="button" id="followInsert" class="btn">중복없으니친구등록하기버튼활성화</button>
	<button type="button" id="bbbb" class="btn">이미있는친구친구등록버튼비활성화</button><br>
	
	<a>친구등록할아이디 임시등록 : </a><!-- 월래는 게시판 상세보기의 게시판 아이디가 입력되어야한다 -->
	<input class="checkFollow" id="checkFollowVal" name="checkFollowVal" type="text"></input>
</body>
</html>