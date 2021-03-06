<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>광고등록</title>
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
 <!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<!-- 드롭다운과충돌 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function(){
    	/*처음에 광고 한개만 빼고 모두 숨김 */
    	$('#ad-1tempselectalert').hide();
    	var i = 1;
    	var ok;
	    	$('#ad-2').hide();
	    /* 등록버튼을 눌렀을 경우 i에 담겨있는 게시물의 값을 adBoardCount를 아이디로 가지는 input에 옮긴다 
	    그리고 서브밋을 한다. */
	    	$('#ok').click(function(){
	    		$('#adBoardCount').val(i);
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
	    			}if($('#ad-2adGoods1Img').val==''){
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
    				}if($('#ad-2adBoardContent').val()!='' && $('#ad-2tempselect').val()!='' && $('#ad-2adBoardImg').val()!='' && $('#ad-2adGoods1Img').val()!=''){
	    				$('#insert').submit();
	    			}
	    		}
	    			
	    		
	    		
	                	
	    	});
	    /***********************/
	    /* 사진 올리는 버튼이 바뀔경우 readURL메서드를 실행시켜 사진을 미리보기 시켜줌 */
           $('#ad-1adBoardImg').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);

            });
           $('#ad-1adGoods1Img').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
                ad1GoodsCount = 1;
                console.log('ad-1 광고 갯수 : ' + ad1GoodsCount);
            	$('#ad1GoodsCount').val(ad1GoodsCount);

            });
           $('#ad-1adGoods2Img').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
                if($('#ad-1adGoods2Img').val()==""){
                	ad1GoodsCount=1;
                	console.log('ad-1 광고 갯수 : ' + ad1GoodsCount)
                	$('#ad1GoodsCount').val(ad1GoodsCount);

                }else{
            	ad1GoodsCount = 2;
                console.log('ad-1 광고 갯수 : ' + ad1GoodsCount);
            	$('#ad1GoodsCount').val(ad1GoodsCount);
                }
            });
           $('#ad-2adBoardImg').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
            });
           $('#ad-2adGoods1Img').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
            	ad2GoodsCount = 1;
                console.log('ad-2광고 갯수 : ' + ad2GoodsCount);
                $('#ad2GoodsCount').val(ad2GoodsCount);
            });
           $('#ad-2adGoods2Img').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
                if($('#ad-2adGoods2Img').val()==""){
                	ad1GoodsCount=1;
                	console.log('ad-2 광고 갯수 : ' + ad1GoodsCount)
                	$('#ad2GoodsCount').val(ad2GoodsCount);

                }else{
            	ad2GoodsCount = 2;
                console.log('ad-2 광고 갯수 : ' + ad2GoodsCount);
            	$('#ad2GoodsCount').val(ad2GoodsCount);
                }
            });
           
           /* 추가버튼을 눌렀을때 온도별 광고 한개씩 늘어나게 해주는 기능 */
 			$('#adAdd').click(function(){
 				i++;

 				console.log('게시물의 갯수 :' + i);
 				
            	switch(i){
            	case 1:
            		$('#ad-1').show();
            		$('#adAdd').show();
            	case 2 :
            		$('#ad-2').show();
            		$('#adAdd').hide();
            	}
            });
           /*****************************************/
           /* 온도선택에서 온도를 골랐을때 숨겨진 input상자에다가 최저온도 최고온도를 셋팅 */
 			$('#ad-1tempselect').on('change',function(){
 				if($('#ad-1tempselect').val()=='temp-5') {
 					$('#ad-1adBoardTempMax').val('-5');
 					$('#ad-1adBoardTempMin').val('-100');
 					}else if($('#ad-1tempselect').val()=='temp-55') {
					$('#ad-1adBoardTempMax').val('5');
					$('#ad-1adBoardTempMin').val('-5');	
 					}else if($('#ad-1tempselect').val()=='temp515') {
					$('#ad-1adBoardTempMax').val('15');
					$('#ad-1adBoardTempMin').val('5');	
 					}else if($('#ad-1tempselect').val()=='temp1524') {
					$('#ad-1adBoardTempMax').val('24');
					$('#ad-1adBoardTempMin').val('15');	
 					}else if($('#ad-1tempselect').val()=='temp2430') {
					$('#ad-1adBoardTempMax').val('30');
					$('#ad-1adBoardTempMin').val('24');	
 					}else if($('#ad-1tempselect').val()=='temp30') {
					$('#ad-1adBoardTempMax').val('1000');
					$('#ad-1adBoardTempMin').val('30');	
 					}
 					console.log('최고온도1: ' + $('#ad-1adBoardTempMax').val());
 					console.log('최저온도 : ' + $('#ad-1adBoardTempMin').val());
 			});

 			/* 	case 'temp-55':
					
			    case 'temp515':
					
 				case 'temp1524':
					
 				case 'temp2430':
					
 				case 'temp30':
					
 				}
					
 			}); */
 			$('#ad-2tempselect').change(function(){
 				switch($(this).val()){
 				case 'temp-5':
 					$('#ad-2adBoardTempMax').val(-5);
 					$('#ad-2adBoardTempMin').val(-100);
 				case 'temp-55':
					$('#ad-2adBoardTempMax').val(5);
					$('#ad-2adBoardTempMin').val(-5);
			    case 'temp515':
					$('#ad-2adBoardTempMax').val(15);
					$('#ad-2adBoardTempMin').val(5);
 				case 'temp1524':
					$('#ad-2adBoardTempMax').val(24);
					$('#ad-2adBoardTempMin').val(15);
 				case 'temp2430':
					$('#ad-2adBoardTempMax').val(30);
					$('#ad-2adBoardTempMin').val(24);
 				case 'temp30':
					$('#ad-2adBoardTempMax').val(1000);
					$('#ad-2adBoardTempMin').val(30);
 				}
 				console.log('최고온도1: ' + $('#ad-2adBoardTempMax').val());
					console.log('최저온도 : ' + $('#ad-2adBoardTempMin').val());
 			});
 			/***************************************************/
 			/* 취소 버튼을 눌렀을때 광고 숨김 및 내용 삭제 */
            $('#ad-1cancel').click(function(){
            	$('#ad-1').hide();
            	$('.ad-1').val("");
            	$('#adAdd').show();
            	i--;
            	console.log('게시물의 수  : ' + i);
            });
       		$('#ad-2cancel').click(function(){
               	$('#ad-2').hide();
               	$('.ad-2').val("");
            	$('#adAdd').show();
               	i--;
               	console.log('게시물의 수  : ' + i);
            });
       		/******************************/
            		
        });

        function readURL(input ,id) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
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
	<!-- 바디 인클루드 -->
	</div>
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
    	<div class="col-xs-1"></div>
	    <div class="col-xs-7">
			<h2>광고 게시물 등록하기</h2>
			계약 번호 : ${sessionScope.adContractNo}
			<br>
			<form id='insert' action="./insertAdBoard" enctype="multipart/form-data" method="post">
			<div id='ad-1' class="well">
			온도 : 온도선택
			<select id="ad-1tempselect">
				<option></option>
				<option value="temp-5">-5도 이하</option>
				<option value="temp-55">-5도~5도</option>
				<option value="temp515">5도~15도</option>
				<option value="temp1524">15도~24도</option>
				<option value="temp2430">24도~30도</option>
				<option value="temp30">30도 이상</option>
			</select><span id="ad-1tempselectalert" class="alert-danger">온도가 입력해주세요</span><br>
			<br>
			대표이미지 등록<br><br>
					<img id="ad-1adBoardImgView" src="#" alt="your image?" class="ad-1 img-thumbnail"/>
			        <input type='file' id="ad-1adBoardImg" class="ad-1" name="adBoardImage"/><br>
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지<br>
					<img id="ad-1adGoods1ImgView" src="#" alt="your image"  class="ad-1 img-thumbnail"/>
			        <input type='file' id="ad-1adGoods1Img" class="ad-1 form-control" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" id="ad-1adGoods1Link" class="ad-1 form-control" name="adGoodsLink"><br><br>
			상세제품2 이미지<br>
					<img id="ad-1adGoods2ImgView" src="#" alt="your image"  class="ad-1 img-thumbnail"/>
			        <input type='file' id="ad-1adGoods2Img" class="ad-1" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" id="ad-1adGoods2Link" class="ad-1 form-control" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-1adBoardTempMax">
					<input type="hidden"  name="adBoardTempMin" id="ad-1adBoardTempMin">
					<input type="hidden" value="" name='adGoodsCount' id='ad1GoodsCount'>
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-1adBoardContent" name="adBoardContent" class="ad-1"><br><br>
					<button id="ad-1cancel" type="button">취소</button>
			</div>
			<div id='ad-2' class='well'>
			<br>
			온도 : 온도선택
			<select name="temp" id="ad-2tempselect">
				<option></option>
				<option value="temp-5">-5도 이하</option>
				<option value="temp-55">-5도~5도</option>
				<option value="temp515">5도~15도</option>
				<option value="temp1524">15도~24도</option>
				<option value="temp2430">24도~30도</option>
				<option value="temp30">30도 이상</option>
			</select><br>
			<br>
			대표이미지 등록<br>
					<img id="ad-2adBoardImgView" src="#" alt="your image" width="100px" height="100px" class="ad-2 img-thumbnail"/>
			        <input type='file' id="ad-2adBoardImg" class="ad-2" name="adBoardImage"/><br>
			
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지
					<img id="ad-2adGoods1ImgView" src="#" alt="your image" width="100px" height="100px" class="ad-2 img-thumbnail"/>
			        <input type='file' id="ad-2adGoods1Img" class="ad-2" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" id="ad-2adGoods1Link" class="ad-2" name="adGoodsLink"><br><br>
					
			상세제품2 이미지
					<img id="ad-2adGoods2ImgView" src="#" alt="your image" width="100px" height="100px" class="ad-2 img-thumbnail"/>
			        <input type='file' id="ad-2adGoods2Img" class="ad-2" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" id="ad-1adGoods2Link" class="ad-2" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-2adBoardTempMax">
					<input type="hidden"  name="adBoardTempMin" id="ad-2adBoardTempMin">
					<input type="hidden" value="" name='adGoodsCount' id='ad2GoodsCount'>
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-2adBoardContent" name="adBoardContent" class="ad-2"><br><br>
					<button id="ad-2cancel" type="button" >취소</button>
			</div>
			<br><br>
			<button id="adAdd" type="button">추가</button>
			<br>
			<input type="hidden" id="adBoardCount" name="adBoardCount">
			<input type="button" id="ok" value="등록">
			</form>
			</div>
			
	    <div class="col-xs-1"></div>
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
       	</div>
    <!-- 하단 인클루드 -->
    <c:import url="../../module/footer.jsp"></c:import> 
</body>
</html>