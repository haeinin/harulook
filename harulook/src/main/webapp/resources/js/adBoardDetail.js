/* 게시물 상세보기  */
function adBoardDetail(msg) {
	
	console.log('boardDatil : ',msg);
	$('#adModal').val();
	var imgWidth = $('#adMainImgArea').width();
	console.log('snsDetailImgArea width : '+imgWidth); 
	$('#adMainImg').width(imgWidth);

	/* 게시물 상세보기 이미지 */
	var adMainImg = '';
	adMainImg += '<img id="adMainImg" alt="no image" style="width: 500px; height: 500px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adBoard.adBoardImg+'"><br>';
	$('#adMainImg').html(adMainImg);
	/* 게시물 상세정보 */
	
	var adDetailContent = '';
	adDetailContent += '<div style="float: right;">';
	adDetailContent += '<a href='+msg.adGoods[0].adGoodsLink+'><img id="adGoods1Img" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adGoods[0].adGoodsImg+'"></a><br><br>';
	if(msg.adGoods[1] != null){
	adDetailContent += '<a href='+msg.adGoods[1].adGoodsLink+'><img id="adGoods2Img" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adGoods[1].adGoodsImg+'"></a><br>';
	}
	adDetailContent += '광고 설명 : ' +msg.adBoard.adBoardContent+'<br><br><br>';
	$('#adDetailContent').html(adDetailContent);
	adDetailContent += '</div>';
	$('#adDetailContent').html(adDetailContent);
	}

