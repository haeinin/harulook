<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet prefetch" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="<c:url value="resources/css/like-btn.css" />" type="text/css">
<script type="text/javascript">
$(function(){
	var like_cnt = $("#like-cnt");
	var like_parent = $(".like-container");
	var t1 = new TimelineLite();
	var t2 = new TimelineLite();
	
	var burst = new mojs.Burst({
	  parent: like_parent,
	  radius:   { 20: 60 },
	  count: 15,
	  angle:{0:30},
	  children: {
	    delay: 250,
	    duration: 700,
	    radius:{10: 0},
	    fill:   [ '#FFB2F5' ],
	    easing: 		mojs.easing.bezier(.08,.69,.39,.97)
	  }
	});
});
</script>
</head>
<body>
게시물 상세보기 화면
${b.snsBoardImg}
<div class="container">
     <table class="table">
         <tbody>
            <tr>
            	<!-- 게시물 번호(시험용, 나중에 삭제해야 함) -->
                <td>sns_board_no :</td>
                <td id="snsBoardNo">${board.snsBoardNo}</td>
            </tr>
            <tr>
            	<!-- 게시물 등록자 닉네임과 아이디, 클릭시 팔로우 -->
                <td>user :</td>
                <td>${board.userNick} (${board.userId})</td>
            </tr>
            <tr>
				<td>sns_board_img :</td>
				<td><img alt="no image" src="${board.snsBoardImg}"></td>
            </tr>
            <tr>
                <td>sns_board_content :</td>
                <td>${board.snsBoardContent}</td>
            </tr>
            <tr>
                   <td></td>
            </tr>
            <tr>
	                <th>sns_user_id</th>
	                <th>sns_comment_content</th>
	                <th>sns_comment_date</th>
	        </tr>
        </tbody>
    </table>
    <c:if test="${sessionScope.id == board.userId}">
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/boardUpdate?boardNo=${board.snsBoardNo}">수정</a>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/boardDelete?boardNo=${board.snsBoardNo}">삭제</a>
	</c:if>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
</div>
</body>
</html>