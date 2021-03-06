<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>~하루룩~</title>
<!-- 댓글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 예뻐요 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 게시글 필터 버튼 모양 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>BOARD LIST(spring mvc + mybatis 방식)</title>
<c:set value="${sessionScope.id}" var="sessionId" />
<script type="text/javascript" src="resources/js/boardDetail.js?ver=2"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>

<c:set value="${boardCount}" var="boardCount"></c:set>
<c:set value="${sessionScope.id}" var="sessionId" />
<style>
.scroll {
   overflow-y: auto;
}
</style>
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
			var boardNo = data.list[index].snsBoardNo;
		} else {
			var boardNo = $(this).children().eq(0).val();
		}
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo,' in pop_list');
		var imgname;
		
		var boardDetailRequest = $.ajax({
			url : './boardDetail',
			method : 'get',
			data :{'boardNo' : boardNo},
			datatype : 'json',
			success : function(msg) {
				boardDetail(msg);
				followCheck(msg);
				imgname = msg.board.snsBoardImg;
				var request = $.ajax({
					url : "./getSize", //호출 경로
					method : "POST", //전송방식
					data : {
						'imgroot' : imgname
					}, //전송해줄값
					dataType : "text", //결과값 타입 (리턴)
					success : function(msg){
						
						console.log('와배고프당당당'+msg);
						var width = msg+"px";
						$('.scroll').css("max-height", width);
					}
					});
			}
		});
		$('#snsModal').modal();
	});
}

function popBoardSearch(){
	
	/* 체크박스 체크 유무를 배열로 처리  */
	var colorValue=[], styleValue=[], situationValue=[];
	
	$(":checkbox[name='colorValue']:checked").each(function(i){
		colorValue.push($(this).val());
	  });
	
	$(":checkbox[name='styleValue']:checked").each(function(i){
		styleValue.push($(this).val());
	  });
	
	$(":checkbox[name='situationValue']:checked").each(function(i){
		situationValue.push($(this).val());
	  });
	
	console.log('colorValue : ',colorValue);
	console.log('styleValue : ',styleValue);
	console.log('situationValue : ',situationValue);
	
	$.ajaxSettings.traditional = true; //배열 형태로 서버쪽 전송을 위한 설정
	
	$.ajax({
		url : './boardPopSearchList',
		method : 'get',
		data : { 'userId'		: $('#userId').val()
				,'snsBoardWeather'	: $('#snsBoardWeather').val()
				,'snsBoardTall'		: $('#snsBoardTall').val()
				,'snsBoardSize'		: $('#snsBoardSize').val()
				,'snsBoardLoc'		: $('#snsBoardLoc').val()
				,'snsBoardGender'	: $(":input:radio[name=snsBoardGender]:checked").val()
				,'snsBoardAge'		: $('#snsBoardAge').val()
				,'colorValue'		: colorValue
				,'styleValue'		: styleValue
				,'situationValue'	: situationValue
				},
		datatype : 'json',
		success : function(data){
			console.log(data);
			var popBoardHtml = '';
			var boardCountHtml = '';
			if(data.list.length > 0) {
				for(var i=0; i<data.list.length; i++) {
					popBoardHtml += '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >';
					popBoardHtml += '<div class="sns-pop-photo-box cursor-click" value="'+data.list[i].snsBoardNo+'">';
					popBoardHtml += '<div class="image-wrap" style="float: left; margin: 5px; overflow: hidden;">';
					popBoardHtml += '<img style="display: inline-block; width: 100%; min-height: 100%;" height: auto" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data.list[i].snsBoardImg+'">';
					popBoardHtml += '<div class="likes">';
					popBoardHtml += '<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>';
					popBoardHtml += '<span class="center">&nbsp;'+data.list[i].snsLikeCount+'&nbsp;&nbsp;&nbsp;</span>';
					popBoardHtml += '<i class="fa fa-commenting center" style="font-size:24px"></i>';
					popBoardHtml += '<span class="center">&nbsp;'+data.list[i].snsCommentCount+'</span>';
					popBoardHtml += '</div>';
					popBoardHtml += '</div>';
					popBoardHtml += '</div>';
					popBoardHtml += '</div>';
					
				}
			} else {
				popBoardHtml += '<span>일치하는 결과가 없습니다.</span>';
			}	
			boardCountHtml += '게시물 : '+data.boardSearchCount
			$('#popBoardOutput').html(popBoardHtml);
			$('#boardCount').html(boardCountHtml);
			popLikeAndComment();
			popShowDetail(data);
		}
	});
}


$(function(){     
	
	
	popLikeAndComment();
	popShowDetail(null);
	
	/* 게시글 검색 (ajax - searchCategory 클래스에 변화가 발생할 때) */
	$('.searchCategory').change(function(){
		currentPage = 1;	// 현재 페이지를 1페이지로 초기화
		popBoardSearch();
	});
});
</script>
</head>
<body>
<div class="container">
<div class="row">
	<div class="col-xs-2"></div>
		
	<!-- sns 게시물 목록 영역 -->
    <div class="col-xs-9">
        <div class="instagram-content">
        <h1>#하루룩</h1><br>
			        	<h2 id="boardCount">게시물 : ${boardCount}</h2>
			<!-- 광고게시물 -->
   			<c:import url="/adBoardList"></c:import>
   			
            <br>
            <br>
            <h3>인기 게시물</h3>
        	
            <!-- The following HTML will be our template inside instafeed -->
			<div id="popBoardOutput" class="row photos-wrap"  style="text-align: center;">
			<c:forEach items="${list}" var="b">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >
				<div class="sns-pop-photo-box cursor-click">
					<input type="hidden" id="boardNo" value="${b.snsBoardNo}">
					<div class="image-wrap" style="float: left; margin: 5px; overflow: hidden;">
						<img style="display: inline-block; width: 100%; min-height: 100%;" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${b.snsBoardImg}">
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
			        <div class="modal-body col-xs-12 col-md-8" style="padding-bottom: 0; padding-top: 0;">
						<div id="snsDetailImg"></div>
		        	</div>
		        	<!-- 게시물 이미지 영역 -->
		        	
		        	<!-- 게시물 내용 영역 -->
		        	
			        <div id="contentArea" class="modal-body col-xs-12 col-md-4" style="padding-left: 30px; padding-bottom: 0px;
    padding-top: 0px;">
			        <div class="scroll">
			        	<input type="hidden" id="sessionUserLevel" value="${sessionScope.level}">
			        	<div id="snsDetailHeader"></div>
			        		<div id="snsDetailContent"></div>
			        		<hr>
			        	
				        	<div id="snsDetailLike"></div>
				        	<hr>
				        	<div id="snsDetailComment"></div>
			        	<hr>
			        	<c:if test="${sessionScope.id != null}">
			        	<input type="hidden" id="sessionUserId" value="${sessionScope.id}">
			        	<div id="snsDetailCommentControll">
			        	</div>
			        	</c:if>
			        	<br>
			        	<div style="text-align: right; padding-right: 20px;">
			        		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        	</div>
			        	
					</div>
					<!-- 게시물 내용 영역 -->
					</div>
			     </div>
			</div>
		</div>
	</div>
	<!-- sns 게시물 상세보기 모달 -->
	
<!-- 로그인권한별로 버튼을 나누기 위한 세션 아이디 -->
<input id="levelCheck" type="hidden" value="${sessionScope.level}"/>
</div>
</div>
</body>
</html>