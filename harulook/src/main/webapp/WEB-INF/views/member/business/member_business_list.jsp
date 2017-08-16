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
		
        });
		
    });
</script>
<title>사업자목록리스트</title>
</head>
<body>
	<div class="container">
	    <h1>사업자목록리스트</h1>
	    <div>전체행의 수 : ${boardCount}</div>
	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>아이디</th>
	                <th>닉네임</th>
	                <th>이름</th>
	                <th>사업체</th>
	                <th>가입날짜</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="b" items="${list}">
	                <tr>
	                    <td><a href="${pageContext.request.contextPath}/member_business_detail?userId=${b.userId}">${b.userId}</a></td> <!-- 연결되는주소 수정하여라 -->
	                    <td>${b.userNick}</td>
	                    <td>${b.userName}</td>
	                    <td>${b.userBsName}</td>	
	                    <td>${b.userDate}</td>
	                   
	                </tr>
	            </c:forEach>
	        </tbody>
	   </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/member_business_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/member_business_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
   

	  
	   

</body>
</html>