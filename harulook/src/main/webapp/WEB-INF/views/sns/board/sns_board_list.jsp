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
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	/*  게시물 상세보기  */
	$('.photo-box').click(function(){
		var index = $('.photo-box').index(this);
		var boardNo = data[index].snsBoardNo;
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo);
		
		
		$.ajax({
			url : './boardDetail',
			method : 'get',
			data :{'boardNo' : boardNo},
			datatype : 'json',
			success : function(data) {
				console.log('boardDatil : ',data);
				var snsDetailImg = '';
				snsDetailImg += '<img alt="no image" style="width: 580px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data.board.snsBoardImg+'">';
				$('#snsDetailImg').html(snsDetailImg);
				
				var snsDetailContent = '';
				snsDetailContent += '<div style="float: left;">';
				snsDetailContent += '<h4>'+data.board.userNick+'(<a atction="#">'+data.board.userId+'</a>)</h4>';
				snsDetailContent += '</div>';
				snsDetailContent += '<button>팔로우</button>';
				snsDetailContent += '<hr></hr>';
				snsDetailContent += '<div>';
				snsDetailContent += '<span>'+data.board.snsBoardContent+'</span><br>';
				for(var i=0; i<data.snsStyle.length; i++) {
					snsDetailContent += '<a href="./oardSearchList?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&styleValue='+data.snsStyle[i]+'">#'+data.snsStyle[i]+'</a>&nbsp';
				}
				for(var i=0; i<data.snsColor.length; i++) {
					snsDetailContent += '<a>#'+data.snsColor[i]+'</a>&nbsp';
				}
				for(var i=0; i<data.snsSituation.length; i++) {
					snsDetailContent += '<a>#'+data.snsSituation[i]+'</a>&nbsp';
				}
				snsDetailContent += '</div>';
				snsDetailContent += '<hr></hr>';
				snsDetailContent += '<div>';
				for(var i=0; i<data.commentList.length; i++) {
					snsDetailContent += '<span>'+data.commentList[i].userId+': '+data.commentList[i].snsCommentContent+'</span><br>';
				}
				snsDetailContent += '</div>';
				$('#snsDetailContent').html(snsDetailContent);
			},
			error : function(){
				alert('fail');
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
			data : { 'snsBoardWeather'	: $('#snsBoardWeather').val()
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
						boardHtml += '<div class="photo-box" value="'+data[i].snsBoardNo+'">';
						boardHtml += '<div class="image-wrap">';
						boardHtml += '<img style="height: 100%;" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data[i].snsBoardImg+'">';
						boardHtml += '<div class="likes">';
						boardHtml += '<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>';
						boardHtml += '<span class="center">&nbsp;'+data[i].snsLikeCount+'&nbsp;&nbsp;&nbsp;</span>';
						boardHtml += '<i class="fa fa-commenting center" style="font-size:24px"></i>';
						boardHtml += '<span class="center">&nbsp;'+data[i].snsCommentCount+'</span>';
						boardHtml += '</div>';
						boardHtml += '</div>';
						boardHtml += '<div class="description">';
						boardHtml += '<div class="date">'+data[i].snsBoardDate+'</div>';
						boardHtml += '</div>';
						boardHtml += '</div>';
						boardHtml += '</div>';
					}
				} else {
					boardHtml += '<span>일치하는 결과가 없습니다.</span>';
				}	
				$('#boardOutput').html(boardHtml);

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
			            
				/* 게시글 추천수, 댓글수 보이기 및 감추기 ***************/
				
				$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
				$('.photo-box').mouseenter(function(){
					$(this).find('.likes').show();
				});
				$('.photo-box').mouseleave(function(){
					$(this).find('.likes').hide();
				});
				
				/*  게시물 상세보기  */
				$('.photo-box').click(function(){
					var index = $('.photo-box').index(this);
					var boardNo = data[index].snsBoardNo;
					
					console.log('index : ',index);
					console.log('data[',index,'].snsBoardNo : ',boardNo);
					
					
					$.ajax({
						url : './boardDetail',
						method : 'get',
						data :{'boardNo' : boardNo},
						datatype : 'json',
						success : function(data) {
							console.log('boardDatil : ',data);
							var snsDetailImg = '';
							snsDetailImg += '<img alt="no image" style="width: 580px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data.board.snsBoardImg+'">';
							$('#snsDetailImg').html(snsDetailImg);
							
							var snsDetailContent = '';
							snsDetailContent += '<h2>'+data.board.userNick+'('+data.board.userId+')</h2>';
							snsDetailContent += '<hr></hr>';
							$('#snsDetailContent').html(snsDetailContent);
							
							$('#snsDetailImg img').each(function() {
						        var maxWidth = 400; // Max width for the image
						        var maxHeight = 400;    // Max height for the image
						        var ratio = 0;  // Used for aspect ratio
						        var width = $(this).width();    // Current image width
						        var height = $(this).height();  // Current image height
								console.log(width);
								console.log(height);
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
						},
						error : function(){
							alert('fail');
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
<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    <section class="instagram-wrap">
sns 게시물 목록
	<div>현재 페이지 : ${currentPage}</div>
		<div class="container">
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
			    	<input type="text" id="userId" name="userId">
			    	<button type="button" id="searchBtn">검색</button>
			    </div>
       
            <div class="row">
                <div class="col-xs-12">
                    <div class="instagram-content">
                        <h3>Latest Photos</h3>
                        <!-- The following HTML will be our template inside instafeed -->
						<div id="boardOutput" class="row photos-wrap"  style="text-align: center;"></div>
                    </div>
                </div>
            </div>
        </div>
	    <div>
	        <a class="btn btn-default" href="${pageContext.request.contextPath}/boardInsert">게시글 입력</a>
	    </div>
	</section>
	
	
<div class="modal fade" id="snsModal" role="dialog">
    <div class="modal-dialog modal-lg" >
      <div id="snsDetail" class="modal-content">
        	
        <div class="row">
	        <div class="modal-body col-xs-8" style="padding-bottom: 0; padding-top: 0;">
				<div id="snsDetailImg">
					<c:forEach items="list" var="list">
					<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" >
						<div class="photo-box">
							<div class="image-wrap">
								<img style="height: 100%;" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="${list.snsBoardImg}">
								<div class="likes">
									<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>
									<span class="center">&nbsp;${list.snsLikeCount}&nbsp;&nbsp;&nbsp;</span>
									<i class="fa fa-commenting center" style="font-size:24px"></i>
									<span class="center">&nbsp;${list.snsCommentCount}</span>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
	        </div>
	        <div id="snsDetailContent" class="modal-body col-xs-4">
	        	<div id="snsDetailContent"></div>
	        </div>
      	</div>
      </div>
    </div>
    </div>
</body>
</html>