<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	$(document).ready(function(){
		
		$('#idcheckbutton').click(function(){	//아이디중복체크버튼
		
        });
		
    });
</script>
<title>관리자리스트</title>
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
			    <h1>관리자리스트</h1>
			    <div>전체행의 수 : ${boardCount}</div>
			    <table class="table table-striped">
			        <thead>
			            <tr>
			                <th>아이디</th>
			                <th>닉네임</th>
			                <th>이름</th>
			                <th>전화번호</th>
			                <th>가입날짜</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="b" items="${list}">
			                <tr>
			                    <td><a href="${pageContext.request.contextPath}/member_manager_detail?userId=${b.userId}">${b.userId}</a></td> <!-- 연결되는주소 수정하여라 -->
			                    <td>${b.userNick}</td>
			                    <td>${b.userName}</td>
			                    <td>${b.userTel}</td>
			                    <td>${b.userDate}</td>
		                    </tr>
			            </c:forEach>
			        </tbody>
			    </table>
			    <ul class="pager">
			        <c:if test="${currentPage > 1}">
			            <li class="previous"><a href="${pageContext.request.contextPath}/member_manager_list?currentPage=${currentPage-1}">이전</a></li>
			        </c:if>
			        <c:if test="${currentPage < lastPage}">
			            <li class="next"><a href="${pageContext.request.contextPath}/member_manager_list?currentPage=${currentPage+1}">다음</a></li>
			        </c:if>
			    </ul>
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