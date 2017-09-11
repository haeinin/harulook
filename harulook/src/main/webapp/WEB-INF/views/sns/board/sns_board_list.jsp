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

<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- 댓글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- sns스타일 탬플릿 css-->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<!-- 예뻐요 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 게시글 필터 버튼 모양 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="resources/js/boardDetail.js?ver=1"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>

<script type="text/javascript">


/* 게시글 추천수, 댓글수 보이기 및 감추기 */
function likeAndComment() {
	$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
	$('.sns-photo-box').mouseenter(function(){
		$(this).find('.likes').show();
	});
	$('.sns-photo-box').mouseleave(function(){
		$(this).find('.likes').hide();
	});
}

/*  게시물 클릭  */
function showDetail(data) {
	$('.sns-photo-box').click(function(){
		var index = $('.sns-photo-box').index(this);
		if(data != null) {
			var boardNo = data[index].snsBoardNo;
		} else {
			var boardNo = $(this).children().eq(0).val();
		}
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo,'');
		
		
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

function boardSearch(){
	
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
		url : './boardSearchList',
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
			var boardHtml = '';
			if(data.length > 0) {
				for(var i=0; i<data.length; i++) {
					boardHtml += '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >';
					boardHtml += '<div class="sns-photo-box" value="'+data[i].snsBoardNo+'">';
					boardHtml += '<div class="image-wrap">';
					boardHtml += '<img style="max-width: 300px; max-height: 300px; width: auto; height: auto" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data[i].snsBoardImg+'">';
					boardHtml += '<div class="likes">';
					boardHtml += '<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>';
					boardHtml += '<span class="center">&nbsp;'+data[i].snsLikeCount+'&nbsp;&nbsp;&nbsp;</span>';
					boardHtml += '<i class="fa fa-commenting center" style="font-size:24px"></i>';
					boardHtml += '<span class="center">&nbsp;'+data[i].snsCommentCount+'</span>';
					boardHtml += '</div>';
					boardHtml += '</div>';
					boardHtml += '</div>';
					boardHtml += '</div>';
					
				}
			} else {
				boardHtml += '<span>일치하는 결과가 없습니다.</span>';
			}	
			$('#boardOutput').html(boardHtml);
			likeAndComment();
			showDetail(data);
		}
	});
}

$(function(){     
	
	likeAndComment();
	showDetail(null);
	
	/*  현재 페이지 값을 받아 number타입으로 변환  */
	var currentPage = '<c:out value="${currentPage}" />';
	currentPage = Number(currentPage);
	console.log('currentPage : ',currentPage);
	console.log('typeof currentPage : ',typeof currentPage);
	
	/* 게시글 검색 (ajax - searchCategory 클래스에 변화가 발생할 때) */
	$('.searchCategory').change(function(){
		currentPage = 1;
		console.log('currentPage : ',currentPage);
		boardSearch();
	});
	
	/* 더 읽어들이기 버튼 클릭 */
 	$('#readMoreBtn').click(function(){
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
 		
 		currentPage += 1;
 		console.log('currentPage : ',currentPage);
		var readMoreRequest = $.ajax({
			url: './boardListMore',
			data:{ 'currentPage' : currentPage
				,'userId'		: $('#userId').val()
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
			datatype: 'json',
			method: 'get',
			success: function(data) {
				console.log(currentPage,'page data : ',data);
				var readMoreHtml = '';
				
				for(var i=0; i < data.list.length; i++) {
					readMoreHtml += '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >';
					readMoreHtml += '<div class="sns-photo-box">';
					readMoreHtml += '<input type="hidden" id="boardNo" value="'+data.list[i].snsBoardNo+'">';
					readMoreHtml += '<div class="image-wrap">';
					readMoreHtml += '<img style="height: auto; max-width: 300px; max-height: 300px; width: auto;" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data.list[i].snsBoardImg+'">';
					readMoreHtml += '<div class="likes">';
					readMoreHtml += '<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>';
					readMoreHtml += '<span class="center">&nbsp;'+data.list[i].snsLikeCount+'&nbsp;&nbsp;&nbsp;</span>';
					readMoreHtml += '<i class="fa fa-commenting center" style="font-size:24px"></i>';
					readMoreHtml += '<span class="center">&nbsp;'+data.list[i].snsCommentCount+'</span>';
					readMoreHtml += '</div>';
					readMoreHtml += '</div>';
					readMoreHtml += '</div>';
					readMoreHtml += '</div>';
				}
				$('#boardOutput').append(readMoreHtml);
				
				likeAndComment();
				showDetail(null);
			}
		});
	}); 
});
</script>
</head>
<body>
	<br>

	<div class="row">
		<div class="col-xs-2"></div>
		<!-- sns 게시물 목록 영역 -->
	    <div class="col-xs-9">
	        <div class="instagram-content">
	        
	            <h3>최신 게시물</h3>
	            <!-- The following HTML will be our template inside instafeed -->
				<div id="boardOutput" class="row photos-wrap"  style="text-align: center;">
				<c:forEach items="${list}" var="b">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >
					<div class="sns-photo-box">
						<input type="hidden" id="boardNo" value="${b.snsBoardNo}">
						<div class="image-wrap">
							<img style="height: auto; max-width: 300px; max-height: 300px; width: auto;" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${b.snsBoardImg}">
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
				<div class="text-center">
					<button type="button" id="readMoreBtn" class="btn btn-default">더 읽어들이기</button>
				</div>
				<br>
				<br>
	       	</div>
		</div>
		<!-- sns 게시물 목록 영역 -->
	
	
		<!-- sns 게시물 상세보기 모달 -->
		<div class="modal fade" id="snsModal" role="dialog">
		    <div id="modalFrame" class="modal-dialog modal-lg" >
				<div id="snsDetail" class="modal-content">
			        <div class="row">
			        
			        	<!-- 게시물 이미지 영역 -->
				        <div id="snsDetailImgArea" class="modal-body col-xs-12 col-sm-6" style="padding-bottom: 0; padding-top: 0;">
							<div id="snsDetailImg"></div>
			        	</div>
			        	<!-- 게시물 이미지 영역 -->
			        	
			        	<!-- 게시물 내용 영역 -->
				        <div id="contentArea" class="modal-body col-xs-12 col-sm-6">
				        	<input type="hidden" id="sessionUserLevel" value="${sessionScope.level}">
			        		<div id="snsDetailContent"></div>
			        		<hr>
			        	
				        	<div id="snsDetailLike"></div>
				        	<hr>
				        	<div id="snsDetailComment"></div>
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