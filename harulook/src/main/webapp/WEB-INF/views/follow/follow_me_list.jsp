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
		
		$('.deleteButton').click(function(){	//팔로우삭제
			//console.log($(this).val());
			var request = $.ajax({
				  url: "./followMeDelete", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'followId' : $(this).val() }, //전송해줄값
				  dataType: "text", //결과값 타입 (리턴)
			});
			location.reload(true); 
		});
		
		////////////////////////////////////////////////////////  팔로우입력만들어야함
		/* $('.followBoard').click(function(){	//팔로우삭제
			//console.log($(this).val());
			var request = $.ajax({
				  url: "./followBoard", //호출 경로
				  method: "POST",	//전송방식
				  data: { 'followId' : $(this).val() }, //전송해줄값
				  dataType: "text", //결과값 타입 (리턴)
			});
			location.reload(true); 
		}); */
		
	});
</script>
</head>
<body>

	<!-- 나를 등록한 친구 리스트 -->
	<div class="container">
	    <h1>친구 목록</h1>
	    <div>전체행의 수 : ${followListCount}</div>
	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>아이디</th>
	                <th>닉네임</th>
	                <th>이름</th>
            	  </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="f" items="${followMeList}">
	                <tr>
		                <td><a type="button" class="followBoard" id="친구의 게시물" value="${f.userId}">${f.userId}</A></td>
				      	<td>${f.followDate}</td>
				        <td><button type="button" class="btn btn-default deleteButton" value="${f.userId}">삭제하기</button></td>
                    </tr>
	            </c:forEach>
	        </tbody>
	   </table>
	</div>
    <ul class="pager" >
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/followMeList?currentPage=${currentPage-1}" >이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/followMeList?currentPage=${currentPage+1}" >다음</a></li>
        </c:if>
    </ul>
</body>
</html>