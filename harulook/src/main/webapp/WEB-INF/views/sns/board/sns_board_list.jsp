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
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	/* 게시글 추천수, 댓글수 보이기 및 감추기 ***************/
	$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
	$('.photo-box').mouseenter(function(){
		$(this).find('.likes').show();
	});
	$('.photo-box').mouseleave(function(){
		$(this).find('.likes').hide();
	});
	
});
</script>
</head>
<body>
<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    <section class="instagram-wrap">
sns 게시물 목록
	<div>현재 페이지 : ${currentPage}</div>
	<div class="container">
		<%@ include file="./sns_board_search.jsp" %>
		
       <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="instagram-content">
                        <h3>Latest Photos</h3>
                        <!-- The following HTML will be our template inside instafeed -->
						<div class="row photos-wrap">
						<c:forEach var="b" items="${list}">
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
			                <div class="photo-box">
				                <div class="image-wrap">
				                    <a href="${pageContext.request.contextPath}/boardDetail?boardNo=${b.snsBoardNo}"><img alt="no image" src="${b.snsBoardImg}"></a>
				                    <div class="likes">
				                    	<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i><span class="center">&nbsp;${b.snsLikeCount}&nbsp;&nbsp;&nbsp;</span>
				                    	<i class="fa fa-commenting center" style="font-size:24px"></i><span class="center">&nbsp;${b.snsCommentCount}</span>
				                    </div>
				                </div>
	                            <div class="description">
	                                <div class="date">${b.snsBoardDate}</div>
	                            </div>
                            </div>
                        </div>
                        </c:forEach>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%-- 	    <table class="table table-striped">
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
	                    <td><a href="${pageContext.request.contextPath}/boardDetail?boardNo=${b.snsBoardNo}"><img alt="no image" src="${b.snsBoardImg}"  width="200px" height="200px"></a></td>
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
    	</ul> --%>
	    <div>
	        <a class="btn btn-default" href="${pageContext.request.contextPath}/boardInsert">게시글 입력</a>
	    </div>
	</section>
</body>
</html>