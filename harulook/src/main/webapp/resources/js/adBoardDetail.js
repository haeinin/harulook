/* 게시물 상세보기  */
function adBoardDetail(msg) {
	
	console.log('boardDatil : ',msg);
	
	var imgWidth = $('#snsDetailImgArea').width();
	console.log('snsDetailImgArea width : '+imgWidth); 
	$('#detailImg').width(imgWidth);
	
	/* 게시물 상세보기 이미지 */
	var snsDetailImg = '';
	snsDetailImg += '<img id="detailImg" alt="no image" style="width: 500px; height: 500px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.adBoard[0].adBoardImage+'">';
	
	
	$('#snsDetailImg').html(snsDetailImg);
	/* 게시물 상세정보 */
	var snsDetailContent = '';
	snsDetailContent += '<div style="float: right;">';
	snsDetailContent += '<a href='+msg.goods[1].adGoodsLink+'><img id="detailImg" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.goods[0].adGoodsImage+'"></a><br>';
	snsDetailContent += '<a href='+msg.goods[1].adGoodsLink+'><img id="detailImg" alt="no image" style="width: 250px; height: 250px;" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+msg.goods[1].adGoodsImage+'"></a><br><br>';
	snsDetailContent += '광고 설명 : ' +msg.adBoard[0].adBoardContent+'';
	snsDetailContent += '</div>';

	$('#snsDetailContent').html(snsDetailContent);
}

