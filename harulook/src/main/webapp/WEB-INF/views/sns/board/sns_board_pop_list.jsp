<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BOARD LIST(spring mvc + mybatis 방식)</title>
<!-- 댓글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 예뻐요 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 게시글 필터 버튼 모양 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>BOARD LIST(spring mvc + mybatis 방식)</title>
<c:set value="${sessionScope.id}" var="sessionId" />
<script type="text/javascript" src="resources/js/boardDetail.js"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>
<c:set value="${boardCount}" var="boardCount"></c:set>
<script type="text/javascript">

/* 게시글 추천수, 댓글수 보이기 및 감추기 */
function popLikeAndComment() {
	$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
	$('.sns-pop-photo-box').mouseenter(function(){
		$(this).find('.likes').show();
	});
	$('.sns-pop-photo-box').mouseleave(function(){
		$(this).find('.likes').hide();
	});
}

/*  게시물 클릭  */
function popShowDetail(data) {
	$('.sns-pop-photo-box').click(function(){
		var index = $('.sns-pop-photo-box').index(this);
		if(data != null) {
			var boardNo = data[index].snsBoardNo;
		} else {
			var boardNo = $(this).children().eq(0).val();
		}
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo,' in pop_list');
		
		
		var boardDetailRequest = $.ajax({
			url : './boardDetail',
			method : 'get',
			data :{'boardNo' : boardNo},
			datatype : 'json',
			success : function(msg) {
				boardDetail(msg);
				followCheck(msg);
			}
		});
		$('#snsModal').modal();
	});
}
$(function(){     
	
	popLikeAndComment();
	popShowDetail(null);
});
</script>
</head>
<body>
<div class="row">
	<div class="col-xs-2"></div>
		
	<!-- sns 게시물 목록 영역 -->
    <div class="col-xs-9">
        <div class="instagram-content">
        <h1>#하루룩</h1><br>
			        	<h2>게시물 : ${boardCount}</h2>
            <h3>인기 게시물</h3>
        	
            <!-- The following HTML will be our template inside instafeed -->
			<div class="row photos-wrap"  style="text-align: center;">
			<c:forEach items="${list}" var="b">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >
				<div class="sns-pop-photo-box">
					<input type="hidden" id="boardNo" value="${b.snsBoardNo}">
					<div class="image-wrap">
						<img style="max-width: 300px; max-height: 300px; width: auto; height: auto;" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${b.snsBoardImg}">
						<div class="likes">
							<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>
							<span class="center">&nbsp;${b.snsLikeCount}&nbsp;&nbsp;&nbsp;</span>
							<i class="fa fa-commenting center" style="font-size:24px"></i>
							<span class="center">&nbsp;${b.snsCommentCount}</span>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			</div>
       	</div>
	</div>
	<!-- sns 게시물 목록 영역 -->


	<!-- sns 게시물 상세보기 모달 -->
	<div class="modal fade" id="snsModal" role="dialog">
	    <div class="modal-dialog modal-lg" >
			<div id="snsDetail" class="modal-content">
		        <div class="row">
		        
		        	<!-- 게시물 이미지 영역 -->
			        <div class="modal-body col-xs-8" style="padding-bottom: 0; padding-top: 0;">
						<div id="snsDetailImg"></div>
		        	</div>
		        	<!-- 게시물 이미지 영역 -->
		        	
		        	<!-- 게시물 내용 영역 -->
			        <div class="modal-body col-xs-4">
			        	<input type="hidden" id="sessionUserLevel" value="${sessionScope.level}">
			        	<div id="snsDetailContent"></div>
			        	<hr>
			        	<div id="snsDetailLike"></div>
			        	<div id="snsDetailComment">
			        	</div>
			        	<hr>
			        	<c:if test="${sessionScope.id != null}">
			        	<input type="hidden" id="sessionUserId" value="${sessionScope.id}">
			        	<div id="snsDetailCommentControll">
			        	</div>
			        	</c:if>
					</div>
					<!-- 게시물 내용 영역 -->
					
			     </div>
			</div>
		</div>
	</div>
	<!-- sns 게시물 상세보기 모달 -->
	
<!-- 로그인권한별로 버튼을 나누기 위한 세션 아이디 -->
<input id="levelCheck" type="hidden" value="${sessionScope.level}"/>
</div>
</body>
</html>