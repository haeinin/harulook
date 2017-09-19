<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>광고수정</title>
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<!-- jquery를 사용하기위한 CDN주소 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script>
	$(document).ready(function() {
		/*입력과는 다르게 처음에 광고 모두 표시 */
		console.log('${goodscount[0]}');
		console.log('${goodscount[1]}');
		var i = ${adboardcount};
		if (i==1) {
			$('#ad-2').hide();
		}else if(i==2){
			$('#ad-2').show();
			$('#adAdd').hide();
		}

		$('#adAdd').click(function() {
			$('#ad-2').show();
		})

		/***********************/
		/* 사진 올리는 버튼이 바뀔경우 readURL메서드를 실행시켜 사진을 미리보기 시켜줌 */
		$('#ad-1adBoardImg').on('change', function() {
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
			readURL(this, id);
		});
		$('#ad-1adGoods1Img').on('change', function() {
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
			readURL(this, id);
			ad1GoodsCount = 1;
			$('#ad1GoodsCount').val(ad1GoodsCount);
			console.log('ad-1 광고 갯수 : ' + ad1GoodsCount);
		});
		$('#ad-1adGoods2Img').on('change', function() {
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
			readURL(this, id);
			ad1GoodsCount = 2;
			$('#ad1GoodsCount').val(ad1GoodsCount);
			console.log('ad-1 광고 갯수 : ' + ad1GoodsCount);
		});
		$('#ad-2adBoardImg').on('change', function() {
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
			readURL(this, id);
		});
		$('#ad-2adGoods1Img').on('change', function() {
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
			readURL(this, id);
			ad2GoodsCount = 1;
			$('#ad2GoodsCount').val(ad2GoodsCount);
			console.log('ad-2 광고 갯수 : ' + ad2GoodsCount);
		});
		$('#ad-2adGoods2Img').on('change', function() {
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
			readURL(this, id);
			ad2GoodsCount = 2;
			$('#ad2GoodsCount').val(ad2GoodsCount);
			console.log('ad-2 광고 갯수 : ' + ad2GoodsCount);
		});

		/* 추가버튼을 눌렀을때 온도별 광고 한개씩 늘어나게 해주는 기능 */
		 $('#adAdd').click(function(){
			i++;
			console.log('게시물의 갯수 :' + i);
			
		switch(i){
		case 1:
			$('#ad-1').show();
			break;
		case 2 :
			$('#ad-2').show();
			$('#adAdd').hide();
			break;
		}
		 });
		/*****************************************/
		$('.cancel').click(function(){
			i--;
			console.log('광고게시물 갯수 : ' + i);
		})
		/* 등록버튼을 눌렀을 경우 i에 담겨있는 게시물의 값을 adBoardCount를 아이디로 가지는 input에 옮긴다  그리고 서브밋을 한다. */
		$('#ok').click(function() {
			$('#adBoardCount').val(i);

			/* 온도선택에서 온도를 골랐을때 숨겨진 input상자에다가 최저온도 최고온도를 셋팅 */

			if ($('#ad-1tempselect').val() == 'temp-5') {
				$('#ad-1adBoardTempMax').val('-5');
				$('#ad-1adBoardTempMin').val('-100');
			} else if ($('#ad-1tempselect').val() == 'temp-55') {
				$('#ad-1adBoardTempMax').val('5');
				$('#ad-1adBoardTempMin').val('-5');
			} else if ($('#ad-1tempselect').val() == 'temp515') {
				$('#ad-1adBoardTempMax').val('15');
				$('#ad-1adBoardTempMin').val('5');
			} else if ($('#ad-1tempselect').val() == 'temp1524') {
				$('#ad-1adBoardTempMax').val('24');
				$('#ad-1adBoardTempMin').val('15');
			} else if ($('#ad-1tempselect').val() == 'temp2430') {
				$('#ad-1adBoardTempMax').val('30');
				$('#ad-1adBoardTempMin').val('24');
			} else if ($('#ad-1tempselect').val() == 'temp30') {
				$('#ad-1adBoardTempMax').val('1000');
				$('#ad-1adBoardTempMin').val('30');
				console.log('최고온도1: ' + $('#ad-1adBoardTempMax').val());
				console.log('최저온도 : ' + $('#ad-1adBoardTempMin').val());
			}

			if ($('#ad-2tempselect').val() == 'temp-5') {
				$('#ad-2adBoardTempMax').val('-5');
				$('#ad-2adBoardTempMin').val('-100');
			} else if ($('#ad-2tempselect').val() == 'temp-55') {
				$('#ad-2adBoardTempMax').val('5');
				$('#ad-2adBoardTempMin').val('-5');
			} else if ($('#ad-2tempselect').val() == 'temp515') {
				$('#ad-2adBoardTempMax').val('15');
				$('#ad-2adBoardTempMin').val('5');
			} else if ($('#ad-2tempselect').val() == 'temp1524') {
				$('#ad-2adBoardTempMax').val('24');
				$('#ad-2adBoardTempMin').val('15');
			} else if ($('#ad-2tempselect').val() == 'temp2430') {
				$('#ad-2adBoardTempMax').val('30');
				$('#ad-2adBoardTempMin').val('24');
			} else if ($('#ad-2tempselect').val() == 'temp30') {
				$('#ad-2adBoardTempMax').val('1000');
				$('#ad-2adBoardTempMin').val('30');
			}
			console.log('최고온도1: ' + $('#ad-2adBoardTempMax').val());
			console.log('최저온도 : ' + $('#ad-2adBoardTempMin').val());
	    		if($('#ad-1adBoardContent').val()==''){
	    			alert('첫번째 게시물의 설명을 입력해주세요');
	    			$('#ad-1adBoardContent').focus();
	    		}
	    		if($('#ad-1tempselect').val()==''){
	    			alert('첫번째 게시물의 온도를 설정하세요.');
	    			$('#ad-1tempselect').focus();
	    			$('#ad-1tempselectalert').show();
	    		}
	    		if($('#ad-1adBoardImg').val()==''){
	    			alert('첫번째 게시물의 메인사진을 입력해주세요.');
	    			$('#ad-1adBoardImg').focus();
	    		}
	    		if($('#ad-1adGoods1Img').val()==''){
	    			alert('첫번째 게시물의 첫번째 상품의 사진을 입력해주세요.');
	    			$('#ad-1adGoods1Img').focus();
	    		}if($('#ad-1adGoods1Img').val()!=''){	    			
	    			if($('#ad-1adGoods1Link').val()==''){
	    			alert('첫번째 게시물의 첫번째 상품의 링크를 입력해주세요.');
	    			$('#ad-1adGoods1Link').focus();
	    				}
	    		}if($('#ad-1adGoods2Img').val()!=''){
	    			if($('#ad-1adGoods2Link').val()==''){
	    				alert('첫번째 게시물의 두번째 상품의 링크를 입력해주세요.');
	    				$('#ad-1adGoods2Link').focus();
	    			}
	    		}
	    		if(i==1){
	    			if($('#ad-1adBoardContent').val()!='' && $('#ad-1tempselect').val()!='' && $('#ad-1adBoardImg').val()!='' && $('#ad-1adGoods1Img').val()!=''){
	    				$('#insert').submit();
	    			}
	    		}
	    		if(i==2){
	    			if($('#ad-2tempselect').val()==''){
	    				alert('두번째 게시물의 온도를 설정하세요.');
	    				$('#ad-2tempselect').focus();
	    			}if($('#ad-2adBoardImg').val()==''){
	    				alert('두번째 게시물의 메인 사진을 입력해주세요.');
	    				$('#ad-2adBoardImg').focus();
	    			}if($('#ad-2adGoods1Img').val()==''){
	    				alert('두번째 게시물의 첫번째 상품의 사진을 입력해주세요.');
	    				$('#ad-2adGoods1Img').focus();
	    			}if($('#ad-2adGoods1Img').val()!==''){
    					if($('#ad-2adGoods1Link').val()==''){
    						alert('두번째 게시물의 첫번째 상품의 링크를 입력해주세요.');
    						$('#ad-2adGoods1Link').focus();
    					}
    				}if($('#ad-2adGoods2Img').val()!=''){
    					if($('#ad-2adGoods2Link').val()==''){
    						alert('두번째 게시물의 두번째 상품의 링크를 입력해주세요.');
    						$('#ad-2adGoods2Link').focus();
    					}
    				}
    				
	    		}
	    		if($('#ad-2adBoardContent').val()!='' && $('#ad-2tempselect').val()!='' && $('#ad-2adBoardImg').val()!='' && $('#ad-2adGoods1Img').val()!=''){
    				$('#insert').submit();
    			}
	    	});
		/***************************************************/
		/* 취소 버튼을 눌렀을때 광고 숨김 및 내용 삭제 */
		$('#ad-1cancel').click(function() {
			$('#ad-1').hide();
			$('.ad-1').val("");
		});
		$('#ad-2cancel').click(function() {
			$('#ad-2').hide();
			$('.ad-2').val("");
		});
		$('#ad-3cancel').click(function() {
			$('#ad-3').hide();
			$('.ad-3').val("");
		});
		$('#ad-4cancel').click(function() {
			$('#ad-4').hide();
			$('.ad-4').val("");
		});
		$('#ad-5cancel').click(function() {
			$('#ad-5').hide();
			$('.ad-5').val("");
		});
		$('#ad-6cancel').click(function() {
			$('#ad-6').hide();
			$('.ad-6').val("");
		});
		/******************************/

	});

	function readURL(input, id) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$("#" + id).attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<!-- 해더인클루드 -->
	<div class="row">
	<c:import url="../../module/header.jsp"></c:import>
	</div>
	<!-- 바디 인클루드 -->
	<div class="row">
		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
    	<div class="col-xs-1"></div>
		<div id="div1" class="col-xs-7">

			<div id="container">
				<h2>광고 게시물 수정하기</h2>
				계약 번호 : ${sessionScope.adContractNo} <br>
				게시물 수 :	${adboardcount} <br>
				하이 : ${adboardlist[1].adBoardTempMin}

				<form id='insert' action="./adBoardUpdate" enctype="multipart/form-data" method="post">
					<div id='ad-1' class="well">
						온도 : 온도선택
						<select id="ad-1tempselect" class="ad-1">
							<c:if test="${adboardlist[0].adBoardTempMin==-100}">
								<option value="temp-5">-5도 이하</option>
							</c:if>
							<c:if test="${adboardlist[0].adBoardTempMin==-5}">
								<option value="temp-55">-5도~5도</option>
							</c:if>
							<c:if test="${adboardlist[0].adBoardTempMin==5}">
								<option value="temp515">5도~15도</option>
							</c:if>
							<c:if test="${adboardlist[0].adBoardTempMin==15}">
								<option value="temp1524">15도~24도</option>
							</c:if>
							<c:if test="${adboardlist[0].adBoardTempMin==24}">
								<option value="temp2430">24도~30도</option>
							</c:if>
							<c:if test="${adboardlist[0].adBoardTempMin==30}">
								<option value="temp30">30도 이상</option>
							</c:if>
							<option></option>
							<option value="temp-5">-5도 이하</option>
							<option value="temp-55">-5도~5도</option>
							<option value="temp515">5도~15도</option>
							<option value="temp1524">15도~24도</option>
							<option value="temp2430">24도~30도</option>
							<option value="temp30">30도 이상</option>
						</select><br> <br> 대표이미지 등록<br>
						<br> <img id="ad-1adBoardImgView" src="${adboardlist[0].adBoardImg}" alt="your image" width="300px" class="ad-1 img-responsive" />
							 <input type='file' id="ad-1adBoardImg" class="ad-1" name="adBoardImage" value="${adboardlist[0].adBoardImg}" /><br>
						<br>
						<br> 상세상품이미지 등록<br>
						<br> 상세제품1 이미지<br> 
							 <img id="ad-1adGoods1ImgView" src="${adgoods[0].adGoodsImg}" alt="your image" width="300px" class="ad-1 img-responsive" />
					    	 <input type='file' id="ad-1adGoods1Img" class="ad-1" name="adGoodsImage" value="${adgoods[0].adGoodsImg}"/><br>
						<br> 상세제품1에 해당하는 링크<br>
						<br> <input type="text" id="ad-1adGoods1Link" class="ad-1" name="adGoodsLink" value="${adgoods[0].adGoodsLink}"><br>
						<br> 상세제품2 이미지<br>
							 <img id="ad-1adGoods2ImgView" src="${adgoods[1].adGoodsImg}" alt="your image" width="300px" class="ad-1 img-responsive" />
							 <input type='file' id="ad-1adGoods2Img" class="ad-1" name="adGoodsImage" value="${adgoods[1].adGoodsImg}"/><br>
						<br> 상세제품2에 해당하는 링크<br>
						<br> <input type="text" id="ad-1adGoods2Link" class="ad-1" name="adGoodsLink" value="${adgoods[1].adGoodsLink}"><br>
						<br> <input type="hidden" name="adBoardTempMax" id="ad-1adBoardTempMax" value="${adboardlist[0].adBoardTempMax}">
							 <input type="hidden" name="adBoardTempMin" id="ad-1adBoardTempMin" value="${adboardlist[0].adBoardTempMin}"> 
							 <input	type="hidden" name='adGoodsCount' id='ad1GoodsCount' value="${goodscount[0]}">
							 <input type="hidden" value="${adgoods[0].adGoodsNo}" name="adGoodsNo">
							 <input	type="hidden" value="${adgoods[1].adGoodsNo}" name="adGoodsNo">
							 <input type="hidden" value="${adboardlist[0].adBoardNo}" name="adBoardNo">
							 <input type="hidden" value="${adboardlist[1].adBoardNo}" name="adBoardNo"> <br>
						게시물 설명<br>
						<br> <input type="text" id="temp-5adBoardContent"
							name="adBoardContent" class="ad-1"
							value="${adboardlist[0].adBoardContent}"><br>
						<br>
						<button type="button" id="ad-1cancel" class="cancel">취소</button>
					</div>
					<div id='ad-2' class="well">
						<br> 온도 : 온도선택 <select name="temp" id="ad-2tempselect" class="ad-2">
						<c:if test="${adboardlist[1].adBoardTempMin==-100}">
							<option value="temp-5">-5도 이하</option>
						</c:if>
						<c:if test="${adboardlist[1].adBoardTempMin==5}">
							<option value="temp-55">-5도~5도</option>
						</c:if>
						<c:if test="${adboardlist[1].adBoardTempMin==5}">
							<option value="temp515">5도~15도</option>
						</c:if>
						<c:if test="${adboardlist[1].adBoardTempMin==15}">
							<option value="temp1524">15도~24도</option>
						</c:if>
						<c:if test="${adboardlist[1].adBoardTempMin==24}">
							<option value="temp2430">24도~30도</option>
						</c:if>
						<c:if test="${adboardlist[1].adBoardTempMin==30}">
							<option value="temp30">30도 이상</option>
						</c:if>
							<option></option>
							<option value="temp-5">-5도 이하</option>
							<option value="temp-55">-5도~5도</option>
							<option value="temp515">5도~15도</option>
							<option value="temp1524">15도~24도</option>
							<option value="temp2430">24도~30도</option>
							<option value="temp30">30도 이상</option>
						</select><br> <br> 대표이미지 수정<br> <img id="ad-2adBoardImgView"
							src="${adboardlist[1].adBoardImg}" alt="your image" width="300PX"
							class="ad-2 img-responsive" /> <input type='file' id="ad-2adBoardImg"
							class="ad-2" name="adBoardImage" /><br> <br>
						<br> 상세상품이미지 등록<br>
						<br> 상세제품1 이미지 <br>
						 	<img id="ad-2adGoods1ImgView" src="${adgoods[2].adGoodsImg}" alt="your image" width="300px" class="ad-2 img-responsive" />
							<input type='file' id="ad-2adGoods1Img" class="ad-2" name="adGoodsImage" value="${adgoods[2].adGoodsImg}" /><br>
						<br> 상세제품1에 해당하는 링크<br>
						<br> <input type="text" id="ad-2adGoods1Link" class="ad-2" name="adGoodsLink" value="${adgoods[2].adGoodsLink }"><br>
						<br> 상세제품2 이미지 <img id="ad-2adGoods2ImgView" src="${adgoods[3].adGoodsImg}" alt="your image" width="300px" class="ad-2 img-responsive" />
							<input type='file' id="ad-2adGoods2Img" class="ad-2" name="adGoodsImage" value="${adgoods[3].adGoodsImg}" /><br>
						<br> 상세제품2에 해당하는 링크<br>
						<br> <input type="text" class="ad-2" name="adGoodsLink" value="${adgoods[3].adGoodsLink}"><br>
						<br> <input type="hidden" name="adBoardTempMax" id="ad-2adBoardTempMax" value="${adboardlist[1].adBoardTempMax}">
							 <input type="hidden" name="adBoardTempMin" id="ad-2adBoardTempMin" value="${adboardlist[1].adBoardTempMin}">
							 <input type="hidden" value="" name='adGoodsCount' id='ad2GoodsCount' value="${goodscount[1]}">
							 <input type="hidden" value="${adgoods[2].adGoodsNo}" name="adGoodsNo">
							 <input	type="hidden" value="${adgoods[3].adGoodsNo}" name="adGoodsNo">
							 <input type="hidden" value="${adboardlist[2].adBoardNo}" name="adBoardNo">
							 <input type="hidden" value="${adboardlist[3].adBoardNo}" name="adBoardNo"> <br>
						게시물 설명<br>
						<br> <input type="text" id="ad-2adBoardContent" name="adBoardContent" class="ad-2" value="${adboardlist[1].adBoardContent}"><br>
						<br> <button type="button" id="ad-2cancel" class="cancel">취소</button>
					</div>
					<button id="adAdd" type="button">추가</button>
					<br> <input type="hidden" id="adBoardCount"	name="adBoardCount" value="${adboardcount}"> <input
						type="button" id="ok" value="등록">
				</form>

			</div>
		</div>

		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
	</div>
	<!-- 하단 인클루드 -->
	<c:import url="../../module/footer.jsp"></c:import>
</body>
</html>