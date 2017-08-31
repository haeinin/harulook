/* 게시물 상세보기  */
function boardDetail(msg) {

	console.log('boardDatil : ',msg);
	var snsDetailImg = '';
	snsDetailImg += '<img alt="no image" style="width: 580px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.board.snsBoardImg+'">';
	$('#snsDetailImg').html(snsDetailImg);
	
	var snsDetailContent = '';
	snsDetailContent += '<div style="float: left;">';
	snsDetailContent += '<h4>'+msg.board.userNick+'(<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&userId='+msg.board.userId+'">'+msg.board.userId+'</a>)</h4>';
	snsDetailContent += '</div>';
	snsDetailContent += '<button>팔로우</button>';
	snsDetailContent += '<hr></hr>';
	snsDetailContent += '<div>';
	snsDetailContent += '<span>'+msg.board.snsBoardContent+'</span><br>';
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
		case '스트리트' :
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
		snsDetailContent += '<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&styleValue='+snsStyleValue+'">#'+msg.snsStyle[i]+'</a>&nbsp';
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
		snsDetailContent += '<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&colorValue='+snsColorValue+'">#'+msg.snsColor[i]+'</a>&nbsp';
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
		snsDetailContent += '<a href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&situationValue='+snsSituationValue+'">#'+msg.snsSituation[i]+'</a>&nbsp';
	}
	snsDetailContent += '</div>';
	snsDetailContent += '<hr></hr>';
	snsDetailContent += '<div>';
	for(var i=0; i<msg.commentList.length; i++) {
		snsDetailContent += '<span>'+msg.commentList[i].userId+': '+msg.commentList[i].snsCommentContent+'</span><br>';
	}
	snsDetailContent += '</div>';
	$('#snsDetailContent').html(snsDetailContent);
}