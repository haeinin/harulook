/* 게시물 상세보기  */
function boardDetail(msg) {
	
	console.log('boardDatil : ',msg);
	
	var imgWidth = $('#snsDetailImgArea').width();
	console.log('snsDetailImgArea width : '+imgWidth); 
	$('#detailImg').width(imgWidth);
	
	/* 게시물 상세보기 이미지 */
	var snsDetailImg = '';
	snsDetailImg += '<img id="detailImg" alt="no image" style="width: 100%; height: 100%;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.board.snsBoardImg+'">';
	
	$('#snsDetailImg').html(snsDetailImg);
	/* 게시물 상세정보 */
	var snsDetailContent = '';
	snsDetailContent += '<div style="float: left;">';
	snsDetailContent += '<h4>'+ '<img style="height: 40px; max-width: 40px; max-height: 40px; width: 40px;" alt="no image" onError="this.src=\' resources/files/images/defaut.jpg \';" src='+ msg.userDetail.userImg +'>'
							 + msg.board.userNick+'(<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&userId='+msg.board.userId+'">'+msg.board.userId+'</a>)</h4>';
	snsDetailContent += '</div>';
	snsDetailContent += '<button id="followInsertButton" class="btn btn-default">팔로우</button>';
	snsDetailContent += '<span id="followCheckOverlap">&nbsp;</span>';
	snsDetailContent += '<span id="Blank">&nbsp;</span>';
	if(msg.board.userId == $('#sessionUserId').val()) {
		snsDetailContent += '<div class="menu">';
		snsDetailContent += '<div id="item">&nbsp<i class="fa fa-ellipsis-h" style="font-size:24px"></i></div>';
		snsDetailContent += '<div id="submenu">';
		snsDetailContent += '<a href="./boardUpdate?boardNo='+msg.board.snsBoardNo+'">수정</a>';
		snsDetailContent += '<a href="./boardDelete?boardNo='+msg.board.snsBoardNo+'">삭제</a>';
		snsDetailContent += '</div>';
		snsDetailContent += '</div>';
	}
	snsDetailContent += '<hr>';
	snsDetailContent += '<div>';
	
	if(msg.board.snsBoardWeather != '') {
		snsDetailContent += '<span>날씨&nbsp:&nbsp'+msg.board.snsBoardWeather+'</span><br>';
	}
	if(msg.board.snsBoardLoc != '') {
		snsDetailContent += '<span>지역&nbsp:&nbsp'+msg.board.snsBoardLoc+'</span><br>';
	}
	if(msg.board.snsBoardGender != null) {
		snsDetailContent += '<span>성별&nbsp:&nbsp'+msg.board.snsBoardGender+'</span><br>';
	}
	if(msg.board.snsBoardTall != null) {
		snsDetailContent += '<span>키&nbsp:&nbsp'+msg.board.snsBoardTall+'</span><br>';
	}
	if(msg.board.snsBoardSize != null) {
		snsDetailContent += '<span>체형&nbsp:&nbsp'+msg.board.snsBoardSize+'</span><br>';
	}
	if(msg.board.snsBoardAge != null) {
		snsDetailContent += '<span>연령대&nbsp:&nbsp'+msg.board.snsBoardAge+'</span><br>';
	}
	snsDetailContent += '<hr>';
	snsDetailContent += '<span>'+msg.board.snsBoardContent+'</span>';
	snsDetailContent += '<br>';
	for(var i=0; i<msg.snsStyle.length; i++) {
		var snsStyleValue = '';
		switch(msg.snsStyle[i]) {
		case '클래식' :
			snsStyleValue = 'style_01';
			break;
		case '캐쥬얼' :
			snsStyleValue = 'style_02';
			break;
		case '빈티지' :
			snsStyleValue = 'style_03';
			break;
		case '스트릿' :
			snsStyleValue = 'style_04';
			break;
		case '댄디' :
			snsStyleValue = 'style_05';
			break;
		case '럭셔리' :
			snsStyleValue = 'style_06';
			break;
		case '러블리' :
			snsStyleValue = 'style_07';
			break;
		case '로맨틱' :
			snsStyleValue = 'style_08';
			break;
		case '심플' :
			snsStyleValue = 'style_09';
			break;
		case '액티브' :
			snsStyleValue = 'style_10';
			break;
		default :
			snsStyleValue = '';
		break;
		}
		snsDetailContent += '<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&userId=&styleValue='+snsStyleValue+'">#'+msg.snsStyle[i]+'</a>&nbsp';
	}
	for(var i=0; i<msg.snsColor.length; i++) {
		var snsColorValue = '';
		switch(msg.snsColor[i]) {
		case '빨강' :
			snsColorValue = 'color_01';
			break;
		case '주황' :
			snsColorValue = 'color_02';
			break;
		case '노랑' :
			snsColorValue = 'color_03';
			break;
		case '초록' :
			snsColorValue = 'color_04';
			break;
		case '파랑' :
			snsColorValue = 'color_05';
			break;
		case '남색' :
			snsColorValue = 'color_06';
			break;
		case '보라' :
			snsColorValue = 'color_07';
			break;
		case '검정' :
			snsColorValue = 'color_08';
			break;
		case '회색' :
			snsColorValue = 'color_09';
			break;
		case '흰색' :
			snsColorValue = 'color_10';
			break;
		case '갈색' :
			snsColorValue = 'color_11';
			break;
		case '베이지' :
			snsColorValue = 'color_12';
			break;
		case '분홍' :
			snsColorValue = 'color_13';
			break;
		default :
			snsColorValue = '';
		break;
		}
		snsDetailContent += '<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&userId=&colorValue='+snsColorValue+'">#'+msg.snsColor[i]+'</a>&nbsp';
	}
	for(var i=0; i<msg.snsSituation.length; i++) {
		var snsSituationValue = '';
		switch(msg.snsSituation[i]) {
		case '학교' :
			snsSituationValue = 'situation_01';
			break;
		case '출근' :
			snsSituationValue = 'situation_02';
			break;
		case '파티' :
			snsSituationValue = 'situation_03';
			break;
		case '여행' :
			snsSituationValue = 'situation_04';
			break;
		case '운동' :
			snsSituationValue = 'situation_05';
			break;
		case '나들이' :
			snsSituationValue = 'situation_06';
			break;
		case '하객' :
			snsSituationValue = 'situation_07';
			break;
		default :
			snsSituationValue = '';
		break;
		}
		snsDetailContent += '<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&userId=&situationValue='+snsSituationValue+'">#'+msg.snsSituation[i]+'</a>&nbsp';
	}
	snsDetailContent += '</div>';
	
	$('#snsDetailContent').html(snsDetailContent);
	
	/* 게시물 추천 유무와 추천수 */
	var snsDetailLike = '';
	
	snsDetailLike += '<div>';
	snsDetailLike += '<div id="like">';
	if($('#sessionUserLevel').val() == '일반회원') {
		
		snsDetailLike += '<button id="likeBtn" class="btn btn-link">';
		console.log('likeToggle : ',msg.likeToggle);
		// 이전에 해당 게시물을 추천한 경우, 아이콘을 분홍색으로 표시
		if(msg.likeToggle == true) {
			snsDetailLike += '<i id="likeToggle" class="material-icons center" style="color: #FFB2F5; font-size:24px;">thumb_up</i>';

		// 이전에 해당 게시물을 추천한 적이 없는 경우, 아이콘을 회색으로 표시
		} else {
			snsDetailLike += '<i id="likeToggle" class="material-icons center" style="color: rgba(0,0,0,0.3); font-size:24px;">thumb_up</i>';
		}
		snsDetailLike += '</button>';
		
	} else {
		snsDetailLike += '<i class="material-icons center" style="color: rgba(0,0,0,0.3); font-size:24px;">thumb_up</i>';
	}
	
	snsDetailLike += '<span class="center" id="snsLikeCount">'+msg.board.snsLikeCount+'개&nbsp;&nbsp;</span>';
	
	snsDetailLike += '<div>'+msg.board.snsBoardDate+'</div>';
	snsDetailLike += '</div>';
	snsDetailLike += '</div>';
	$('#snsDetailLike').html(snsDetailLike);
	
	/* 게시물 댓글 정보 */
	var snsDetailComment = '';
	for(var i=0; i<msg.commentList.length; i++) {
		snsDetailComment += '<span>'+msg.commentList[i].userId+': '+msg.commentList[i].snsCommentContent+'</span>';
		if(msg.commentList[i].userId == $('#sessionUserId').val()) {
			snsDetailComment += '<a class="btn-sm" href="./commentDelete?snsCommentNo='+msg.commentList[i].snsCommentNo+'&snsBoardNo='+msg.board.snsBoardNo+'">삭제</a>';
		}
		snsDetailComment += '<br>';
	}
	snsDetailComment += '</div>';
	$('#snsDetailComment').html(snsDetailComment);
	
	
	var snsDetailCommentControll = '';
	snsDetailCommentControll += '<input type="text" id="commentValue">';
	snsDetailCommentControll += '<button type="button" id="commentBtn">등록</button>';
	$('#snsDetailCommentControll').html(snsDetailCommentControll);
	
	$('#contentArea').height($('#detailImg').height());
	console.log('contentArea height : ',$('#detailImg').height());
	/* 댓글 등록 버튼 클릭 */
	$('#commentBtn').click(function(){
		var snsCommentContent = $('#commentValue').val();
		
		console.log('commentValue : ',commentValue);
		if(snsCommentContent == '') {
			alert('댓글 내용을 입력하세요');
		} else {
			var commentInsertRequest = $.ajax({
				url: './commentInsert',
				method: 'post',
				data:{'snsCommentContent' : snsCommentContent
					, 'userId' : $('#sessionUserId').val()
					, 'snsBoardNo' : msg.board.snsBoardNo
					}
			});
			commentInsertRequest.done(function(commentInsertData){
				$.ajax({
					url: './boardDetail',
					method: 'get',
					data: { 'boardNo' : msg.board.snsBoardNo},
					datatype: 'json',
					success: function(data){
						snsDetailComment = '';
						
						snsDetailComment += '<div>';
						for(var i=0; i<data.commentList.length; i++) {
							snsDetailComment += '<span>'+data.commentList[i].userId+': '+data.commentList[i].snsCommentContent+'</span>';
							if(data.commentList[i].userId == $('#sessionUserId').val()) {
								snsDetailComment += '<a class="btn-sm" href="./commentDelete?snsCommentNo='+data.commentList[i].snsCommentNo+'&snsBoardNo='+msg.board.snsBoardNo+'">삭제</a>';
							}
							snsDetailComment += '<br>';
						}
						snsDetailComment += '</div>';
						$('#snsDetailComment').html(snsDetailComment);
					}
				});
			})
			$('#commentValue').val('');
		}
	});
	
	/* 게시물 수정,삭제 dropdown */
	$('#submenu').hide();
	
	$('#item').click(function(){
		$('#submenu').slideToggle(500);
	});
	
	/* 예뻐요(추천) 버튼 클릭 */
	$("#likeBtn").click(function(){
		
		console.log($('#sessionUserId').val());
		$.ajax({
            url : './likeBtnClick',
            method: 'POST',
            data : { 'snsBoardNo' : msg.board.snsBoardNo
            		,'userId' : $('#sessionUserId').val()},
            dataType: 'JSON',
            success : function(data){
            	console.log(data);
            	$('#snsLikeCount').text(data.snsLikeCount+'개');
            	if(data.likeClick === 0) {
            		$('#likeToggle').css('color','#FFB2F5');
            	} else {
            		$('#likeToggle').css('color','rgba(0,0,0,0.3)');
            	}
            }
        });
	})
}

