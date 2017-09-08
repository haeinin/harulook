/* 게시물 상세보기  */
function adBoardDetail(msg) {
	
	console.log('boardDatil : ',msg);
	
	var imgWidth = $('#adMainImgArea').width();
	console.log('snsDetailImgArea width : '+imgWidth); 
	$('#adMainImg').width(imgWidth);
	
	/* 게시물 상세보기 이미지 */
	var adMainImg = '';
	adMainImg += '최고온도 : ' +msg.adBoard[0].adBoardTempMax + ' 최저온도 : ' + msg.adBoard[0].adBoardTempMin;
	adMainImg += '<img id="adMainImg" alt="no image" style="width: 500px; height: 500px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adBoard[0].adBoardImage+'"><br>';
	$('#adMainImg').html(adMainImg);
	/* 게시물 상세정보 */
	
	var adDetailContent = '';
	adDetailContent += '<div style="float: right;">';
	adDetailContent += '<a href='+msg.goods[0].adGoodsLink+'><img id="adGoods1Img" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.goods[0].adGoodsImage+'"></a><br><br>';
	adDetailContent += '<a href='+msg.goods[1].adGoodsLink+'><img id="adGoods2Img" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.goods[1].adGoodsImage+'"></a><br>';
	adDetailContent += '광고 설명 : ' +msg.adBoard[0].adBoardContent+'<br><br><br>';
	$('#adDetailContent').html(adDetailContent);
	if(msg.adBoard[1] == null){ 
	adDetailContent += '<a class="btn btn-info" href="./adBoardUpdate?adContractNo='+msg.adBoard[0].adContractNo+'">수정</a>'
	adDetailContent += '</div>';
	$('#adDetailContent').html(adDetailContent);
	}else{
	if(msg.adBoard[1] != null){
	adMainImg += '<br><br><br>';
	adMainImg += '최고온도 : ' +msg.adBoard[1].adBoardTempMax + ' 최저온도 : ' + msg.adBoard[1].adBoardTempMin;
	adMainImg += '<img id="adMainImg" alt="no image" style="width: 500px; height: 500px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adBoard[1].adBoardImage+'"><br>';
	$('#adMainImg').html(adMainImg);
	adDetailContent += '<div style="float: right;">';
	adDetailContent += '<a href='+msg.goods[2].adGoodsLink+'><img id="adGoods1Img" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.goods[2].adGoodsImage+'"></a><br>';
	if(msg.goods[3] != null){
		adDetailContent += '<a href='+msg.goods[3].adGoodsLink+'><img id="adGoods2Img" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.goods[3].adGoodsImage+'"></a><br><br>';
	}	
	adDetailContent += '광고 설명 : ' +msg.adBoard[1].adBoardContent+'<br>';
	adDetailContent += '<a class="btn btn-info" href="./adBoardUpdate?adContractNo='+msg.adBoard[0].adContractNo+'">수정</a>'
	adDetailContent += '</div>';
	$('#adDetailContent').html(adDetailContent);
	}
	}
}

