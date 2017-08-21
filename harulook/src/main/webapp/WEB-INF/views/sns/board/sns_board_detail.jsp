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
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<style>

.like-container{filter: url('#filter');}

.like-cnt{  
  position: absolute; 
  cursor: pointer;
  left: 50%; 
  top: 50%; 
  transform: translate(-50%, -50%);       
  width: 60px; 
  height: 60px;  
  border-radius: 50%;
  text-align: center;
  line-height: 75px;
  z-index: 10;
}

.like-btn{
  color: #fff;
}


::-moz-selection { background: transparent;}
::selection {background: transparent;}
</style>
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

	$("#like-cnt").click(function(){
		console.log($('#snsBoardNo').text());
		$.ajax({
            url : './likeBtnClick',
            method: 'POST',
            data : { 'snsBoardNo' : $('#snsBoardNo').text()
            		,'userId' : $('#userId').val()},
            dataType: 'JSON',
            success : function(data){
            	console.log(data);
            	$('#snsLikeCount').text(data.snsLikeCount);
            	if(data.likeClick === 0) {
            		 t1.set(like_cnt, {scale:0});
            		    t1.set('.like-btn', {scale: 0});
            		    t1.to(like_cnt, 0.6, {scale:1, background: '#FFB2F5',ease: Expo.easeOut});
            		    t2.to('.like-btn', 0.65, {scale: 1, ease: Elastic.easeOut.config(1, 0.3)}, '+=0.2');
//            		    t1.timeScale(5);
            		    //circleShape.replay();
            		    burst.replay();
            	} else {
            		t1.to(like_cnt, 1, {scale:1})
            	      .to(like_cnt, 1, {scale:1, background: 'rgba(0,0,0,0.3)', ease: Power4.easeOut});
            	    t1.timeScale(7);
            	}
            }
        });
	})
});
</script>
</head>
<body>
게시물 상세보기 화면
<div class="container">
     <table class="table">
         <tbody>
            <tr>
                <td>sns_board_no :</td>
                <td id="snsBoardNo">${board.snsBoardNo}</td>
            </tr>
            <tr>
                <td>user_id :</td>
                <td>${board.userId}</td>
            </tr>
            <tr>
				<td>sns_board_img :</td>
				<td>${board.snsBoardImg}</td>
            </tr>
            <tr>
                <td>sns_board_content :</td>
                <td>${board.snsBoardContent}</td>
            </tr>
            <tr>
                <td>sns_board_weather :</td>
                <td>${board.snsBoardWeather}</td>
            </tr>
            <tr>
                <td>sns_board_tall :</td>
                <td>${board.snsBoardTall}</td>
            </tr>
            <tr>
                <td>sns_board_size :</td>
                <td>${board.snsBoardSize}</td>
            </tr>
            <tr>
                <td>sns_board_loc :</td>
                <td>${board.snsBoardLoc}</td>
            </tr>
            <tr>
                <td>sns_board_date :</td>
                <td>${board.snsBoardDate}</td>
            </tr>
            <tr>
                <td>sns_board_gender :</td>
                <td>${board.snsBoardGender}</td>
            </tr>
            <tr>
                <td>sns_board_age :</td>
                <td>${board.snsBoardAge}</td>
            </tr>
            <tr>
                <td>추천수 :</td>
                <td id="snsLikeCount">${board.snsLikeCount}</td>
                
                <!-- 예뻐요 버튼  -->
                <c:if test="${sessionScope.id != null}">
				<div class="like-container">
				<c:if test="${likeToggle == false}">
					<div class="like-cnt" id="like-cnt" style="background-color: rgba(0,0,0,0.3);">
						<div class="like-cnt" id="like-cnt">
							<i class="like-btn material-icons">thumb_up</i>
						</div>
					</div>
				</c:if>
				<c:if test="${likeToggle == true}">
					<div class="like-cnt" id="like-cnt" style="background-color: #FFB2F5;">
						<div class="like-cnt" id="like-cnt">
							<i class="like-btn material-icons">thumb_up</i>
						</div>
					</div>
				</c:if>
				<script src="//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>
				<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
				<script src='https://cdn.jsdelivr.net/mojs/latest/mo.min.js'></script>
				<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/DrawSVGPlugin.min.js'></script>
				<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js'></script>
				</div>
				</c:if>
				<!-- 예뻐요 버튼  -->
				
            </tr>
            <tr>
                <td>댓글수 :</td>
                <td>${board.snsCommentCount}</td>
            </tr>
            <tr>
                <td>sns_board_style :</td>
                <td>
                	<c:if test="${snsColor.size() > 0}">
                		<c:forEach var="i" begin="0" end="${snsStyle.size()-1}">${snsStyle.get(i)}&nbsp;&nbsp;</c:forEach>
                	</c:if>
                </td> 
            </tr>
            <tr>
                <td>sns_board_color :</td>
                <td>
                	<c:if test="${snsColor.size() > 0}">
                		<c:forEach var="i" begin="0" end="${snsColor.size()-1}">${snsColor.get(i)}&nbsp;&nbsp;</c:forEach>
                	</c:if>
                </td>
            </tr>
            <tr>
                <td>sns_board_situation :</td>
                <td>
                	<c:if test="${snsSituation.size() > 0}">
                		<c:forEach var="i" begin="0" end="${snsSituation.size()-1}">${snsSituation.get(i)}&nbsp;&nbsp;</c:forEach>
                	</c:if>
                </td>
            </tr>
            <tr>
                   <td></td>
            </tr>
            <tr>
	                <th>sns_user_id</th>
	                <th>sns_comment_content</th>
	                <th>sns_comment_date</th>
	        </tr>
            <c:forEach var="commentList" items="${commentList}">
	            <tr>
	                <td>${commentList.userId}</td>
	                <td>${commentList.snsCommentContent}</td>
	                <td>${commentList.snsCommentDate}</td>
	                <c:if test="${sessionScope.id == commentList.userId}">
	                	<td><a class="btn btn-default" href="${pageContext.request.contextPath}/commentDelete?snsCommentNo=${commentList.snsCommentNo}&snsBoardNo=${commentList.snsBoardNo}">삭제</a></td>
	            	</c:if>
	            </tr>
	         </c:forEach>
	         <tr>
	         <c:if test="${sessionScope.id != null}">
	         	<form action="${pageContext.request.contextPath}/commentInsert" method="post">
	                <td>${sessionScope.id}<input type="hidden" id="userId" name="userId" value="${sessionScope.id}" readonly="readonly"></td>
	                <td><input type="text" id="snsCommentContent" name="snsCommentContent"></td>
	                <input type="hidden" name="snsBoardNo" value=${board.snsBoardNo}>
	                <td><input class="btn btn-default" type="submit" value="댓글입력"></td>
				</form>
				</td>
			</c:if>
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