/* 게시물 상세보기  */
function adBoardDetail(msg) {
	
	console.log('boardDatil : ',msg);
	$('#adModal').val('');

	/* 게시물 상세보기 이미지 */
	var adMainImg = '';
	adMainImg += '<br> <img id="adDetailImg" class="img-thumbnail" alt="no image" style="width: 100%; height: 100%;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adBoard.adBoardImg+'"><br>';
	$('#adMainImg').html(adMainImg);
	/* 게시물 상세정보 */
	
	var adDetailContent = '';
	adDetailContent += '<br> <div style="float: right;">';
	adDetailContent += '<a href='+msg.adGoods[0].adGoodsLink+' target="_blank"><img id="adGoods1Img" class="img-thumbnail" alt="no image" style="width: 100%; height: 100%;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adGoods[0].adGoodsImg+'"></a><br><br>';
	/*if(msg.adGoods[1] == null){
		adDetailContent += '<img id="adGoods2Img" class="img-thumbnail" alt="no image" style="width: 100%; height: 100%;" onError="this.src=\'resources/files/images/defaut.jpg\';" src=""><br>';	
	}*/
	if(msg.adGoods[1] != null){
	adDetailContent += '<a href='+msg.adGoods[1].adGoodsLink+' target="_blank"><img id="adGoods2Img" class="img-thumbnail" alt="no image" style="width: 100%; height: 100%;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adGoods[1].adGoodsImg+'"></a><br><br>';
	}
	adDetailContent += '광고 설명 : ' +msg.adBoard.adBoardContent+'<br><br><br>';
	$('#adDetailContent').html(adDetailContent);
	adDetailContent += '</div>';
	$('#adDetailContent').html(adDetailContent);
	}

