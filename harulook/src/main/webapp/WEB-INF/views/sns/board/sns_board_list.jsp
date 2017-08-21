<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD LIST(spring mvc + mybatis 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
sns 게시물 목록
	<div>현재 페이지 : ${currentPage}</div>
	<div class="container">
		<%@ include file="./sns_board_search.jsp" %>
	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>snsBoardNo</th>
	                <th>snsBoardImg</th>
	                <th>댓글수</th>
	                <th>추천수</th>
	                <th>snsBoardDate</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="b" items="${list}">
	                <tr>
	                    <td>${b.snsBoardNo}</td>
	                    <td><a href="${pageContext.request.contextPath}/boardDetail?boardNo=${b.snsBoardNo}">${b.snsBoardImg}</a></td>
	                    <td>${b.snsCommentCount}</td>
	                    <td>${b.snsLikeCount}</td>
	                    <td>${b.snsBoardDate}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    <ul class="pager">
	        <c:if test="${currentPage > 1}">
	            <li class="previous"><a href="${pageContext.request.contextPath}/boardList?currentPage=${currentPage-1}">이전</a></li>
	        </c:if>
	        <c:if test="${currentPage < lastPage+1}">
	            <li class="next"><a href="${pageContext.request.contextPath}/boardList?currentPage=${currentPage+1}">다음</a></li>
	        </c:if>
    	</ul>
	    <div>
	        <a class="btn btn-default" href="${pageContext.request.contextPath}/boardInsert">게시글 입력</a>
	    </div>
	</div>
</body>
</html>