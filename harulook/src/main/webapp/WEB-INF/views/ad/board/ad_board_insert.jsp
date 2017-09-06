<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script>
    $(document).ready(function(){
    	/*처음에 광고 한개만 빼고 모두 숨김 */
    	var i = 1;
	    	$('#ad-2').hide();
	    	$('#ad-3').hide();
	    	$('#ad-4').hide();
	    	$('#ad-5').hide();
	    	$('#ad-6').hide();
	    /* 등록버튼을 눌렀을 경우 i에 담겨있는 게시물의 값을 adBoardCount를 아이디로 가지는 input에 옮긴다 
	    그리고 서브밋을 한다. */
	    	$('#ok').click(function(){
	    		$('#adBoardCount').val(i);
	    		$('#insert').submit();
	    		
	    		
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
                $('#ad1GoodsCount').val(ad1GoodsCount);
                console.log('ad-1 광고 갯수 : ' + ad1GoodsCount);
                
            });
           $('#ad-1adGoods2Img').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
                ad1GoodsCount = 2;
                $('#ad1GoodsCount').val(ad1GoodsCount);
                console.log('ad-1 광고 갯수 : ' + ad1GoodsCount);
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
                $('#ad2GoodsCount').val(ad2GoodsCount);
                console.log('ad-2 광고 갯수 : ' + ad2GoodsCount);
            });
           $('#ad-2adGoods2Img').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "View";
        	   console.log(id);
                readURL(this , id);
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
            		break;
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
 			});
 			/***************************************************/
 			/* 취소 버튼을 눌렀을때 광고 숨김 및 내용 삭제 */
            $('#ad-1cancel').click(function(){
            	$('#ad-1').hide();
            	$('.ad-1').val("");
            	i--;
            	console.log('게시물의 수  : ' + i);
            });
       		$('#ad-2cancel').click(function(){
               	$('#ad-2').hide();
               	$('.ad-2').val("");
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
	<c:import url="../../module/header.jsp"></c:import>	
	<!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
	    <div id="div1" class="col-xs-9">
	    
			<div id="container">
			<h2>광고 게시물 등록하기</h2>
			계약 번호 : ${sessionScope.adContractNo}
			<br>
			
			<form id='insert' action="./insertAdBoard" enctype="multipart/form-data" method="post">
			<div id='ad-1'>
			온도 : 온도선택
			<select id="ad-1tempselect">
				<option></option>
				<option value="temp-5">-5도 이하</option>
				<option value="temp-55">-5도~5도</option>
				<option value="temp515">5도~15도</option>
				<option value="temp1524">15도~24도</option>
				<option value="temp2430">24도~30도</option>
				<option value="temp30">30도 이상</option>
			</select><br>
			<br>
			대표이미지 등록<br><br>
					<img id="ad-1adBoardImgView" src="#" alt="your image?" width="50px" height="50px" class="ad-1"/>
			        <input type='file' id="ad-1adBoardImg" class="ad-1" name="adBoardImage"/><br>
			<br><br>
			상세상품이미지 등록a<br><br>
			
			상세제품1 이미지<br>
					<img id="ad-1adGoods1ImgView" src="#" alt="your image" width="50px" height="50px" class="ad-1"/>
			        <input type='file' id="ad-1adGoods1Img" class="ad-1" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" id="ad-1adGoods1Link" class="ad-1" name="adGoodsLink"><br><br>
					
			상세제품2 이미지<br>
					<img id="ad-1adGoods2ImgView" src="#" alt="your image" width="50px" height="50px" class="ad-1"/>
			        <input type='file' id="ad-1adGoods2Img" class="ad-1" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" id="ad-1adGoods2Link" class="ad-1" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-1adBoardTempMax">
					<input type="hidden"  name="adBoardTempMin" id="ad-1adBoardTempMin">
					<input type="hidden" value="" name='adGoodsCount' id='ad1GoodsCount'>
					<br>
			게시물 설명<br><br>
					<input type="text" id="temp-5adBoardContent" name="adBoardContent" class="ad-1"><br><br>
					<button id="ad-1cancel">취소</button>
			</div>
			<div id='ad-2'>
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
					<img id="ad-2adBoardImgView" src="#" alt="your image" width="100px" height="100px" class="ad-2"/>
			        <input type='file' id="ad-2adBoardImg" class="ad-2" name="adBoardImage"/><br>
			
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지
					<img id="ad-2adGoods1ImgView" src="#" alt="your image" width="100px" height="100px" class="ad-2"/>
			        <input type='file' id="ad-2adGoods1Img" class="ad-2" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" id="ad-2adGoods1Link" class="ad-2" name="adGoodsLink"><br><br>
					
			상세제품2 이미지
					<img id="ad-2adGoods2ImgView" src="#" alt="your image" width="100px" height="100px" class="ad-2"/>
			        <input type='file' id="ad-2adGoods2Img" class="ad-2" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" class="ad-2" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-2adBoardTempMax">
					<input type="hidden"  name="adBoardTempMin" id="ad-2adBoardTempMin">
					<input type="hidden" value="" name='adGoodsCount' id='ad2GoodsCount'>
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-2adBoardContent" name="adBoardContent" class="ad-2"><br><br>
					<button id="ad-2cancel">취소</button>
			</div>
			<div id='ad-3'>
			온도 : 온도선택
			<select name="temp" id="ad-3tempselect">
				<option></option>
				<option value="temp-5">-5도 이하</option>
				<option value="temp-55">-5도~5도</option>
				<option value="temp515">5도~15도</option>
				<option value="temp1524">15도~24도</option>
				<option value="temp2430">24도~30도</option>
				<option value="temp30">30도 이상</option>
			</select><br>
			<br>
			대표이미지 등록
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-3"/>
			        <input type='file' id="ad-3adBoardImage" class="ad-3" name="adBoardImage"/><br>
			
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-3"/>
			        <input type='file' id="ad-3adGoods1Image" class="ad-3" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" class="ad-3" name="adGoodsLink"><br><br>
					
			상세제품2 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-3"/>
			        <input type='file' id="ad-3adGoods1Link" class="ad-3" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" class="ad-3" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-3adBoardTempMax">
					<input type="hidden"  name="adBoardTempMin" id="ad-3adBoardTempMin">
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-3adBoardContent" name="adBoardContent" class="ad-3"><br><br>
					<button id="ad-3cancel">취소</button>
			</div>
			<div id='ad-4'>
			온도 : 온도선택
			<select name="temp" id="ad-4tempselect">
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
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-4"/>
			        <input type='file' id="ad-4adBoardImage" class="ad-4" name="adBoardImage" name="adBoardImage"/><br>
			
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-4"/>
			        <input type='file' id="ad-4adGoods1Image" class="ad-4" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" id="ad-4adGoods1Link" class="ad-4" name="adGoodsLink"><br><br>
					
			상세제품2 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-4"/>
			        <input type='file' id="ad-4adGoods2Image" class="ad-4" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" id="ad-4adGoods2Link" class="ad-4" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-4adBoardTempMax">
					<input type="hidden"  name="adBoardTempMin" id="ad-4adBoardTempMin">
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-4adBoardContent" name="adBoardContent" class="ad-4"><br><br>
					<button id="ad1524cancel">취소</button>
			</div>
			<div id='ad-5'>
			온도 : 온도선택
			<select name="temp" id="ad-5tempselect">
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
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-5"/>
			        <input type='file' id="imgInp" class="ad-5" name="adBoardImage" name="adBoardImage"/><br>
			
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-5"/>
			        <input type='file' id="imgInp" class="ad-5" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" class="ad-5" name="adGoodsLink"><br><br>
					
			상세제품2 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-5"/>
			        <input type='file' id="imgInp" class="ad-5" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" class="ad-5" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-5adBoardTempMax">
					<input type="hidden" name="adBoardTempMin" id="ad-5adBoardTempMin">
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-5adBoardContent" name="adBoardContent" class="ad-5"><br><br>
					<button id="ad-5cancel" class="ad-5">취소</button>
			</div>
			<div id='ad-6'>
			온도 : 온도선택
			<select name="temp" id="ad-6tempselect">
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
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="ad-6" class="ad-6"/>
			        <input type='file' id="imgInp" class="ad-6" name="adBoardImage" name="adBoardImage"/><br>
			
			<br><br>
			상세상품이미지 등록<br><br>
			
			상세제품1 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px"/>
			        <input type='file' id="imgInp" class="ad-6" name="adGoodsImage"/><br><br>
			상세제품1에 해당하는 링크<br><br>
					<input type="text" class="ad-6" name="adGoodsLink"><br><br>
					
			상세제품2 이미지
					<img id="uploadimage" src="#" alt="your image" width="100px" height="100px"/>
			        <input type='file' id="imgInp" class="ad-6" name="adGoodsImage"/><br><br>
			상세제품2에 해당하는 링크<br><br>
					<input type="text" class="ad-6" name="adGoodsLink"><br><br>
					<input type="hidden"  name="adBoardTempMax" id="ad-6adBoardTempMax" class="ad-6">
					<input type="hidden"  name="adBoardTempMin" id="ad-6adBoardTempMin" class="ad-6">
					<br>
			게시물 설명<br><br>
					<input type="text" id="ad-6adBoardContent" name="adBoardContent" class="ad-6"><br><br>
					<button id="ad-6cancel" class="ad-6">취소</button>
			</div>
			<br><br>
			<button id="adAdd" type="button">추가</button>
			<br>
			<input type="hidden" id="adBoardCount" name="adBoardCount">
			<input type="button" id="ok" value="등록">
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