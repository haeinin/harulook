/* 게시물 클릭시 게시물회원과 팔로우상태 확인  */
function followCheck(msg) {
	
	var requestFollow = $.ajax({
		  url: "./followCheck", //호출 경로
		  method: "POST",	//전송방식
		  data:  { 'followId' : msg.board.userId } , //전송해줄값
		  dataType: "text" //결과값 타입 (리턴)
	});		//친구등록 성공여부에 따라서 버튼 체인지나 쇼 하이드 필요할듯
	requestFollow.done(function( msg ) {
		msg = msg.trim();
		console.log(msg);	//친구 등록 체크
		if($('#levelCheck').val() == '일반회원'){
			if(!msg){	//등록되지않은 친구
				followInsertButton
				$('#followInsertButton').show();
				$('#followCheckOverlap').hide();
			}else{	//등록되어있는 친구
				$('#followInsertButton').hide();
				$('#followCheckOverlap').show();
			}
		}else{	//로그인접속자가 일반회원이 아닌경우
			$('#Blank').show();	
			$('#followInsertButton').hide();
			$('#followCheckOverlap').hide();
		}
	});
	
	//친구등록버튼
	$('#followInsertButton').click(function(){
		var request = $.ajax({
			  url: "./followInsert", //호출 경로
			  method: "POST",	//전송방식
			  data:  { 'followId' : msg.board.userId } , //전송해줄값
			  dataType: "text", //결과값 타입 (리턴)
			  success : function(msg) {
				  $('#followInsertButton').hide();
				  $('#followCheckOverlap').show();
				  alert('친구등록완료');
			  }
		});		
	});
	
}