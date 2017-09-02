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
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 댓글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- sns스타일 탬플릿 css-->
<link rel="stylesheet" type="text/css" href="resources/css/style.css?ver=1">
<!-- 예뻐요 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>BOARD LIST(spring mvc + mybatis 방식)</title>
<c:set value="${sessionScope.id}" var="sessionId" />
<script type="text/javascript" src="resources/js/boardDetail.js"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>
<script type="text/javascript">
$(function(){     
	
	/* 게시글 추천수, 댓글수 보이기 및 감추기 ***************/
	
	$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
	$('.sns-photo-box').mouseenter(function(){
		$(this).find('.likes').show();
	});
	$('.sns-photo-box').mouseleave(function(){
		$(this).find('.likes').hide();
	});
	
	$('.image-wrap img').each(function() {
        var maxWidth = 345; // Max width for the image
        var maxHeight = 345;    // Max height for the image
        var ratio = 0;  // Used for aspect ratio
        var width = $(this).width();    // Current image width
        var height = $(this).height();  // Current image height

        // Check if the current width is larger than the max
		if(width > maxWidth){
            ratio = maxWidth / width;   // get ratio for scaling image
            $(this).css("width", maxWidth); // Set new width
            $(this).css("height", height * ratio);  // Scale height based on ratio
            height = height * ratio;    // Reset height to match scaled image
		}	

       width = $(this).width();    // Current image width
       height = $(this).height();  // Current image height

        // Check if current height is larger than max
		if(height > maxHeight){
            ratio = maxHeight / height; // get ratio for scaling image
            $(this).css("height", maxHeight);   // Set new height
            $(this).css("width", width * ratio);    // Scale width based on ratio
            width = width * ratio;    // Reset width to match scaled image
		}
    });
	
	/*  게시물 클릭  */
	$('.sns-photo-box').click(function(){
		var index = $('.sns-photo-box').index(this);
		var boardNo = $(this).children().eq(0).val();
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo);
		
		
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
	
	/* 게시글 검색 (ajax - searchCategory 클래스에 변화가 발생할 때) */
	$('.searchCategory').change(function(){
		
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
						boardHtml += '<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" >';
						boardHtml += '<div class="sns-photo-box" value="'+data[i].snsBoardNo+'">';
						boardHtml += '<div class="image-wrap">';
						boardHtml += '<img style="height: 100%;" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data[i].snsBoardImg+'">';
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

				/* 게시글 추천수, 댓글수 보이기 및 감추기 ***************/
				
				$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
				$('.sns-photo-box').mouseenter(function(){
					$(this).find('.likes').show();
				});
				$('.sns-photo-box').mouseleave(function(){
					$(this).find('.likes').hide();
				});
				
				$('.image-wrap img').each(function() {
			        var maxWidth = 345; // Max width for the image
			        var maxHeight = 345;    // Max height for the image
			        var ratio = 0;  // Used for aspect ratio
			        var width = $(this).width();    // Current image width
			        var height = $(this).height();  // Current image height

			        // Check if the current width is larger than the max
					if(width > maxWidth){
			            ratio = maxWidth / width;   // get ratio for scaling image
			            $(this).css("width", maxWidth); // Set new width
			            $(this).css("height", height * ratio);  // Scale height based on ratio
			            height = height * ratio;    // Reset height to match scaled image
					}	

			       width = $(this).width();    // Current image width
			       height = $(this).height();  // Current image height

			        // Check if current height is larger than max
					if(height > maxHeight){
			            ratio = maxHeight / height; // get ratio for scaling image
			            $(this).css("height", maxHeight);   // Set new height
			            $(this).css("width", width * ratio);    // Scale width based on ratio
			            width = width * ratio;    // Reset width to match scaled image
					}
			    });
				
				/*  게시물 클릭  */
				$('.sns-photo-box').click(function(){
					var index = $('.sns-photo-box').index(this);
					var boardNo = data[index].snsBoardNo;
					
					console.log('index : ',index);
					console.log('data[',index,'].snsBoardNo : ',boardNo);
					
					
					var boardDetailRequest = $.ajax({
						url : './boardDetail',
						method : 'get',
						data :{'boardNo' : boardNo},
						datatype : 'json',
						success: function(msg) {
							boardDetail(msg);
							followCheck(msg);
						}
					});
					$('#snsModal').modal();
				});
			}
		});
	});
});
</script>
</head>
<body>
<!-- sns 게시물 검색 항목 -->

	    <div class="col-xs-1"></div>
	    <div class="col-xs-9">
<div class="container">
	<a href="#demo" class="btn btn-default" data-toggle="collapse">게시물 검색</a>
	<div id="demo" class="collapse">
		<div class="searchGroup">
			<label for="snsBoardWeather">날씨 :</label>
			<select class="searchCategory" name="snsBoardWeather" id="snsBoardWeather">
				<option></option>
				<option>맑음</option>
				<option>구름조금</option>
				<option>흐림</option>
				<option>비</option>
				<option>눈</option>
			</select>
		    
		    <label for="snsBoardTall">키 :</label>
		    <select class="searchCategory" name="snsBoardTall" id="snsBoardTall">
		    	<option></option>
		    	<option>큰키</option>
		    	<option>보통키</option>
		    	<option>작은키</option>
		    </select>
		    
		    <label for="snsBoardSize">체형 :</label>
		    <select class="searchCategory" name="snsBoardSize" id="snsBoardSize">
		    	<option></option>
		    	<option>마른</option>
		    	<option>보통</option>
		    	<option>뚱뚱</option>
		    </select>
		
		    <label for="snsBoardLoc">지역 :</label>
		    <select class="searchCategory" name="snsBoardLoc" id="snsBoardLoc">
		    	<option></option>
		    	<option>서울</option>
		    	<option>경기</option>
		    	<option>강원</option>
		    	<option>충남</option>
		    	<option>충북</option>
		    	<option>전북</option>
		    	<option>전남</option>
		    	<option>경북</option>
		    	<option>경남</option>
		    	<option>제주</option>
		    	<option>세종</option>
		    </select>
		
		    <label for="snsBoardGender">성별 :</label>
		    <input class="searchCategory" name="snsBoardGender" id="snsBoardGender" type="radio" value="여">여
		    <input class="searchCategory" name="snsBoardGender" id="snsBoardGender" type="radio" value="남">남
	
		    <label for="snsBoardAge">나이 :</label>
		    <select class="searchCategory" name="snsBoardAge" id="snsBoardAge">
		    	<option></option>
		    	<option>10</option>
		    	<option>20</option>
		    	<option>30</option>
		    	<option>40</option>
		    	<option>50</option>
		    </select>
		</div>
		<div class="form-group">
			<label for="searchSnsBoardStyle">스타일 :</label>		
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_01">클래식
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_02">캐쥬얼
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_03">빈티지
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_04">스트리트
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_05">댄디
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_06">럭셔리
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_07">러블리
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_08">로맨틱
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_09">심플
			<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_10">액티브
		</div>
		<div class="form-group">
	      	<label for="searchSnsBoardColor">색상 :</label>
	     	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_01">빨강
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_02">주황
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_03">노랑
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_04">초록
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_05">파랑
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_06">남색
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_07">보라
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_08">검정
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_09">회색
	    	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_10">흰색
	    	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_11">갈색
	    	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_12">베이지
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_13">핑크       	
	    </div>
	    <div class="form-group">
	      	<label class="searchCategory" for="searchSnsBoardSituation">상황 :</label>
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_01">학교
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_02">출근
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_03">파티
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_04">여행
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_05">운동
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_06">나들이
	      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_07">하객    	
	    </div>
	    <div class="form-group">
	    	<label class="searchCategory" for="userId">아이디 :</label>
	    	<input type="text" class="searchCategory" id="userId" name="userId">
	    	<input type="button" value="검색">
	    </div>
	</div>
</div>
<!-- sns 게시물 검색 항목 -->


<!-- sns 게시물 목록 영역 -->

<div class="container">
	<div class="row">
	    <div class="col-xs-12">
	        <div class="instagram-content">
	        	
	            <h3>최근 게시물</h3>
	            <!-- The following HTML will be our template inside instafeed -->
				<div id="boardOutput" class="row photos-wrap"  style="text-align: center;">
				<c:forEach items="${list}" var="b">
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" >
					<div class="sns-photo-box">
						<input type="hidden" id="boardNo" value="${b.snsBoardNo}">
						<div class="image-wrap">
							<img style="height: 100%;" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${b.snsBoardImg}">
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
		        	<div id="snsDetailContent"></div>
		        	<hr>
		        	<div id="snsDetailComment">
		        	</div>
		        	<hr>
		        	<c:if test="${sessionScope.id != null}">
		        	<input type="hidden" id="commentUserId" value="${sessionScope.id}">
		        	<div id="snsDetailCommentControll">
		        	</div>
		        	</c:if>
				</div>
				<!-- 게시물 내용 영역 -->
				
		     </div>
		</div>
	</div>
</div>
<!-- 로그인권한별로 버튼을 나누기 위한 세션 아이디 -->
<input id="levelCheck" type="hidden" value="${sessionScope.level}"/>
<!-- sns 게시물 상세보기 모달 -->
</div>
</body>
</html>