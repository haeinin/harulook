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

<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- 댓글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- sns스타일 탬플릿 css-->
<link rel="stylesheet" type="text/css" href="resources/css/style.css?ver=1">
<!-- 예뻐요 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 게시글 필터 버튼 모양 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="resources/js/boardDetail.js?ver=2"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>

<script type="text/javascript">


/* 게시물 목록에서 게시글 추천수, 댓글수 보이기 및 감추기 */
function likeAndComment() {
	$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기(초기화)
	
	// 해당 게시물에 마우스를 올렸을 때, 추천수와 댓글수 보이기 
	$('.sns-photo-box').mouseenter(function(){
		$(this).find('.likes').show();
	});
	
	// 마우스가 해당 게시물 영역을 벗어났을 때, 추천수와 댓글수 감추기
	$('.sns-photo-box').mouseleave(function(){
		$(this).find('.likes').hide();
	});
}

/* 게시물 상세보기 기능을 활성화 해주는 함수  */
function showDetail(data) {	// data: 게시물 필터를 이용한 검색 시 ajax 응답
	
	// 게시물 목록에서 게시물 클릭
	$('.sns-photo-box').click(function(){
		var index = $('.sns-photo-box').index(this); // 검색 결과로 나온 게시물들의 index
		
		// 게시물 필터 이용 여부에 따른 분기문
		if(data != null) {	// 게시물 필터로 검색한 경우
			var boardNo = data[index].snsBoardNo;	//	게시물 검색 ajax 결과의 index번째 게시물 번호 
		} else {			// 게시물 검색하지 않은 경우
			var boardNo = $(this).children().eq(0).val(); // 선택한 게시물 영역의 첫 번째 자식 요소가 가지는 값()
		}
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo,'');
		var imgname;
		
		// 게시물 상세보기를 위한 데이터를 요청하는  ajax
		var boardDetailRequest = $.ajax({
			url : './boardDetail',
			method : 'get',
			data :{'boardNo' : boardNo},	// 위의 과정에서 얻은 게시물 번호를 넘긴다.
			datatype : 'json',
			success : function(msg) {
				boardDetail(msg);	// 게시물 상세보기 함수 호출
				followCheck(msg);	// 해당 게시물 등록자와 팔로우 유무 검색 함수
				
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
		$('#snsModal').modal();	// 모달 실행
	});
}

/* 게시물 검색 */
function boardSearch(){
	
	/* 체크박스 체크 유무를 배열로 처리  */
	var colorValue=[], styleValue=[], situationValue=[];
	
	// 색상 체크박스에서 선택된 항목을 배열에 추가
	$(":checkbox[name='colorValue']:checked").each(function(i){
		colorValue.push($(this).val());
	  });
	
	// 스타일 체크박스에서 선택된 항목을 배열에 추가
	$(":checkbox[name='styleValue']:checked").each(function(i){
		styleValue.push($(this).val());
	  });
	
	// 상황 체크박스에서 선택된 항목을 배열에 추가
	$(":checkbox[name='situationValue']:checked").each(function(i){
		situationValue.push($(this).val());
	  });
	
	console.log('colorValue : ',colorValue);
	console.log('styleValue : ',styleValue);
	console.log('situationValue : ',situationValue);
	
	$.ajaxSettings.traditional = true; //배열 형태로 서버쪽 전송을 위한 설정
	
	// 검색 조건에 맞는 게시물 목록을 요청하는 ajax
	$.ajax({
		url : './boardSearchList',
		method : 'get',
		data : { 'userId'		: $('#userId').val()	// 검색창에 입력한 게시자 아이디
				,'snsBoardWeather'	: $('#snsBoardWeather').val()	// 선택한 날씨
				,'snsBoardTall'		: $('#snsBoardTall').val()		// 선택한 키
				,'snsBoardSize'		: $('#snsBoardSize').val()		// 선택한 체형
				,'snsBoardLoc'		: $('#snsBoardLoc').val()		// 선택한 지형
				,'snsBoardGender'	: $(":input:radio[name=snsBoardGender]:checked").val() // 선택한 성별(라디오 버튼)
				,'snsBoardAge'		: $('#snsBoardAge').val()		// 선택한 연령대
				,'colorValue'		: colorValue					// 선택한 색상 체크박스 배열
				,'styleValue'		: styleValue					// 선택한 스타일 체크박스 배열 
				,'situationValue'	: situationValue				// 선택한 상황 체크박스 배열
				},
		datatype : 'json',
		success : function(data){
			console.log(data);
			var boardHtml = '';	// 검색 결과를 html으로 나타낼 변수 초기화
			if(data.length > 0) {	// 검색 조건에 해당하는 검색 결과가 존재하는 경우
				for(var i=0; i<data.length; i++) {
					boardHtml += '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >';
					boardHtml += '<div class="sns-photo-box cursor-click" value="'+data[i].snsBoardNo+'">';
					boardHtml += '<div class="image-wrap">';
					boardHtml += '<img style="display: inline-block; width: 100%; min-height: 100%;" height: auto" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data[i].snsBoardImg+'">';
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
			} else {	// 검색 조건에 해당하는 결과가 없을 경우
				boardHtml += '<span>일치하는 결과가 없습니다.</span>';
			}	
			$('#boardOutput').html(boardHtml);	// 작성한 문장을 출력
			likeAndComment();	// 검색 결과 게시물의 추천수, 댓글수 감추기 및 보이기 함수 호출
			showDetail(data);	// 게시물 상세보기 활성화 함수에 검색 결과를 대입하여 호출
		}
	});
}

$(function(){     
	
	likeAndComment();	// 검색 결과 게시물의 추천수, 댓글수 감추기 및 보이기 함수 호출 
	showDetail(null);	// 게시물 상세보기 활성화 함수에 null갑을 대입하여 호출
	
	
	/* 게시글 검색 (ajax - searchCategory 클래스에 변화가 발생할 때) */
	$('.searchCategory').change(function(){
		currentPage = 1;	// 현재 페이지를 1페이지로 초기화
		console.log('currentPage : ',currentPage);
		boardSearch();		// 게시물 검색 함수 호출
	});
	
	/* 더 읽어들이기 버튼 클릭 */
 	$('#readMoreBtn').click(function(){
 		/* 체크박스 체크 유무를 배열로 처리  */
 		var colorValue=[], styleValue=[], situationValue=[];
 		
 		// 색상 체크박스에서 선택된 항목을 배열에 추가
 		$(":checkbox[name='colorValue']:checked").each(function(i){
 			colorValue.push($(this).val());
 		  });
 		
 		// 스타일 체크박스에서 선택된 항목을 배열에 추가
 		$(":checkbox[name='styleValue']:checked").each(function(i){
 			styleValue.push($(this).val());
 		  });
 		
 		// 상황 체크박스에서 선택된 항목을 배열에 추가
 		$(":checkbox[name='situationValue']:checked").each(function(i){
 			situationValue.push($(this).val());
 		  });
 		
 		console.log('colorValue : ',colorValue);
 		console.log('styleValue : ',styleValue);
 		console.log('situationValue : ',situationValue);
 		
 		$.ajaxSettings.traditional = true; //배열 형태로 서버쪽 전송을 위한 설정
 		
 		currentPage += 1; // 현재 페이지 1 증가
 		console.log('currentPage : ',currentPage);
 		
 		// 현재 페이지의 다음 페이지 게시물 목록을 요청하는 ajax
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
					readMoreHtml += '<div class="sns-photo-box cursor-click">';
					readMoreHtml += '<input type="hidden" id="boardNo" value="'+data.list[i].snsBoardNo+'">';
					readMoreHtml += '<div class="image-wrap" style="float: left; margin: 5px; overflow: hidden;">';
					readMoreHtml += '<img style="display: inline-block; width: 100%; min-height: 100%;" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data.list[i].snsBoardImg+'">';
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
				$('#boardOutput').append(readMoreHtml);	// 작성된 html문장을 현재 페이지 밑에 추가
				
				likeAndComment();	// 검색 결과 게시물의 추천수, 댓글수 감추기 및 보이기 함수 호출 
				showDetail(null);	// 게시물 상세보기 활성화 함수에 null갑을 대입하여 호출
			}
		});
	}); 
});
</script>

</head>
<body>
<div class="container">
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
					<div class="sns-photo-box cursor-click">
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
				        <div id="snsDetailImgArea" class="modal-body col-xs-12 col-md-8" style="padding-bottom: 0; padding-top: 0;">
							<div id="snsDetailImg"></div>
			        	</div>
			        	<!-- 게시물 이미지 영역 -->
			        	
			        	<!-- 게시물 내용 영역 -->
				        <div id="contentArea" class="modal-body col-xs-12 col-md-4" style="padding-left: 30px;">
				        	<input type="hidden" id="sessionUserLevel" value="${sessionScope.level}">
			        		<div id="snsDetailHeader"></div>
			        		<div >
				        		<div id="snsDetailContent"></div>
				        		<hr>
				        	
					        	<div id="snsDetailLike"></div>
					        	<hr>
					        	<div id="snsDetailComment"></div>
				        	</div>
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
		<!-- sns 게시물 상세보기 모달 -->
		
		<!-- 로그인권한별로 버튼을 나누기 위한 세션 아이디 -->
		<input id="levelCheck" type="hidden" value="${sessionScope.level}"/>
	</div>
</div>
</body>
</html>