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
	    	$('#temp-5').hide();
	    	$('#temp-55').hide();
	    	$('#temp515').hide();
	    	$('#temp1524').hide();
	    	$('#temp2430').hide();
	    	$('#temp30').hide();	
           $('#temp-5adBoard').on('change', function(){
        	   var id = $(this).attr('id');
        	   id = id + "File";
        	   console.log(id);
                readURL(this , id);
            });
 			$('#selectTemp').click(function(){
            	switch($('#tempselect').val()){
            	case 'temp-5':
            		$('#temp-5').show();
            		break;
            	case 'temp-55' :
            		$('#temp-55').show();
            		break;
            	case 'temp515' :
            		$('#temp515').show();
            		break;
            	case 'temp1524' :
            		$('#temp1524').show();
            		break;
            	case 'temp2430' :
            		$('#temp2430').show();
            		break;
            	case 'temp30' :
            		$('#temp30').show();
            		break;
            		
            	}
            	
            })
            $('#temp-5cancel').click(function(){
            	$('#temp-5').hide();
            	$('.temp-5').val("");
            });
       		$('#temp-55cancel').click(function(){
               	$('#temp-55').hide();
               	$('.temp-55').val("");
            });
       		$('#temp515cancel').click(function(){
               	$('#temp515').hide();
               	$('.temp515').val("");
            });
       		$('#temp1524cancel').click(function(){
               	$('#temp1524').hide();
               	$('.temp1524').val("");
            });
       		$('#temp2430cancel').click(function(){
               	$('#temp2430').hide();
               	$('.temp2430').val("");
            });
       		$('#temp30cancel').click(function(){
               	$('#temp30').hide();
               	$('.temp30').val("");
            });
            		
        });

        function readURL(input ,id) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $("#" + id + "File").attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>
<div id="container">
<h2>광고 게시물 등록하기a</h2>

<br>
온도선택
<select name="temp" id="tempselect">
	<option value="temp-5">-5도 이하</option>
	<option value="temp-55">-5도~5도</option>
	<option value="temp515">5도~15도</option>
	<option value="temp1524">15도~24도</option>
	<option value="temp2430">24도~30도</option>
	<option value="temp30">30도 이상</option>
</select>
<button id="selectTemp">선택</button>
<form>
<div id='temp-5'>
온도 : -5도 미만<br>
<br><br>
대표이미지 등록<br><br>
		<img id="temp-5adBoardFile" src="#" alt="your image?" width="50px" height="50px" class="temp-5"/>
        <input type='file' id="temp-5adBoard" class="temp-5" name="adBoardImage" value="temp-5adBoardFile" /><br>
<br><br>
상세상품이미지 등록<br><br>

상세제품1 이미지<br>
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp-5"/>
        <input type='file' id="temp-5adGoods1Image" class="temp-5" name="adGoods1Image"/><br><br>
상세제품1에 해당하는 링크<br><br>
		<input type="text" id="temp-5adGoods1Link" class="temp-5" name="adGoods1Link"><br><br>
		
상세제품2 이미지<br>
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp-5"/>
        <input type='file' id="imgInp" class="temp-5" name="adGoods2Image"/><br><br>
상세제품2에 해당하는 링크<br><br>
		<input type="text" id="temp-5adGoods2Link" class="temp-5" name="adGoods Link"><br><br>
		<input type="hidden" value="-5" name="adBoardTempMax" id="temp-5adBoardTempMax">
		<input type="hidden" value="" name="acBoardTempMin" id="temp-5adBoardTempMin">
		<br>
게시물 설명<br><br>
		<input type="text" id="temp-5adBoardContent" name="adBoardContent" class="temp-5"><br><br>
		<button id="temp-5cancel">취소</button>
</div>
<div id='temp-55'>
<br>
온도 : -5도 이상 5도 미만<br>
대표이미지 등록<br>
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp-55"/>
        <input type='file' id="temp-55adBoardImage" class="temp-55" name="adBoardImage"/><br>

<br><br>
상세상품이미지 등록<br><br>

상세제품1 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp-55"/>
        <input type='file' id="temp-55adGoods1Image" class="temp-55" name="adGoods1Image"/><br><br>
상세제품1에 해당하는 링크<br><br>
		<input type="text" id="temp-55adGoods1Link" class="temp-55" name="adGoods1Link"><br><br>
		
상세제품2 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp-55"/>
        <input type='file' id="temp-55adGoods2Image" class="temp-55" name="adGoods2Image"/><br><br>
상세제품2에 해당하는 링크<br><br>
		<input type="text" class="temp-55" name="adGoodsLink"><br><br>
		<input type="hidden" value="5" name="adBoardTempMax" id="temp-55adBoardTempMax">
		<input type="hidden" value="-5" name="acBoardTempMin" id="temp-55adBoardTempMin">
		<br>
게시물 설명<br><br>
		<input type="text" id="temp-55adBoardContent" name="adBoardContent" class="temp-55"><br><br>
		<button id="temp-55cancel">취소</button>
</div>
<div id='temp515'>
온도 : 5도 이상 15도 미만<br>
<br><br>
대표이미지 등록
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp515"/>
        <input type='file' id="temp515adBoardImage" class="temp515" name="adBoardImage"/><br>

<br><br>
상세상품이미지 등록<br><br>

상세제품1 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp515"/>
        <input type='file' id="temp515adGoods1Image" class="temp515" name="adGoods1Image"/><br><br>
상세제품1에 해당하는 링크<br><br>
		<input type="text" class="temp515" name="adGoods1Link"><br><br>
		
상세제품2 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp515"/>
        <input type='file' id="temp515adGoods1Link" class="temp515" name="adGoods2Image"/><br><br>
상세제품2에 해당하는 링크<br><br>
		<input type="text" class="temp515" name="adGoodsLink"><br><br>
		<input type="hidden" value="15" name="adBoardTempMax" id="temp515adBoardTempMax">
		<input type="hidden" value="5" name="acBoardTempMin" id="temp515adBoardTempMin">
		<br>
게시물 설명<br><br>
		<input type="text" id="temp515adBoardContent" name="adBoardContent" class="temp515"><br><br>
		<button id="temp515cancel">취소</button>
</div>
<div id='temp1524'>
온도 : 15도 이상 24도 미만<br>
<br><br>
대표이미지 등록<br>
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp1524"/>
        <input type='file' id="temp1524adBoardImage" class="temp1524" name="adBoardImage" name="adBoardImage"/><br>

<br><br>
상세상품이미지 등록<br><br>

상세제품1 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp1524"/>
        <input type='file' id="temp1524adGoods1Image" class="temp1524" name="adGoods1Image"/><br><br>
상세제품1에 해당하는 링크<br><br>
		<input type="text" id="temp1524adGoods1Link" class="temp1524" name="adGoods1Link"><br><br>
		
상세제품2 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp1524"/>
        <input type='file' id="temp1524adGoods2Image" class="temp1524" name="adGoods2Image"/><br><br>
상세제품2에 해당하는 링크<br><br>
		<input type="text" id="temp1524adGoods2Link" class="temp1524" name="adGoodsLink"><br><br>
		<input type="hidden" value="24" name="adBoardTempMax" id="temp1524adBoardTempMax">
		<input type="hidden" value="15" name="acBoardTempMin" id="temp1524adBoardTempMin">
		<br>
게시물 설명<br><br>
		<input type="text" id="temp1524adBoardContent" name="adBoardContent" class="temp1524"><br><br>
		<button id="temp1524cancel">취소</button>
</div>
<div id='temp2430'>
온도 : 24도 이상 30도 미만<br>
<br><br>
대표이미지 등록<br>
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp2430"/>
        <input type='file' id="imgInp" class="temp2430" name="adBoardImage" name="adBoardImage"/><br>

<br><br>
상세상품이미지 등록<br><br>

상세제품1 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp2430"/>
        <input type='file' id="imgInp" class="temp2430" name="adGoods1Image"/><br><br>
상세제품1에 해당하는 링크<br><br>
		<input type="text" class="temp2430" name="adGoods1Link"><br><br>
		
상세제품2 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp2430"/>
        <input type='file' id="imgInp" class="temp2430" name="adGoods2Image"/><br><br>
상세제품2에 해당하는 링크<br><br>
		<input type="text" class="temp2430" name="adGoodsLink"><br><br>
		<input type="hidden" value="30" name="adBoardTempMax" id="temp2430adBoardTempMax">
		<input type="hidden" value="24" name="acBoardTempMin" id="temp2430adBoardTempMin">
		<br>
게시물 설명<br><br>
		<input type="text" id="temp2430adBoardContent" name="adBoardContent" class="temp2430"><br><br>
		<button id="temp2430cancel" class="temp2430">취소</button>
</div>
<div id='temp30'>
온도 : 30도 이상<br>
<br><br>
대표이미지 등록<br>
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px" class="temp30" class="temp30"/>
        <input type='file' id="imgInp" class="temp30" name="adBoardImage" name="adBoardImage"/><br>

<br><br>
상세상품이미지 등록<br><br>

상세제품1 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px"/>
        <input type='file' id="imgInp" class="temp30" name="adGoods1Image"/><br><br>
상세제품1에 해당하는 링크<br><br>
		<input type="text" class="temp30" name="adGoods1Link"><br><br>
		
상세제품2 이미지
		<img id="uploadimage" src="#" alt="your image" width="100px" height="100px"/>
        <input type='file' id="imgInp" class="temp30" name="adGoods2Image"/><br><br>
상세제품2에 해당하는 링크<br><br>
		<input type="text" class="temp30" name="adGoodsLink"><br><br>
		<input type="hidden" value="30" name="adBoardTempMax" id="temp30adBoardTempMax" class="temp30">
		<input type="hidden" value="" name="acBoardTempMin" id="temp30adBoardTempMin" class="temp30">
		<br>
게시물 설명<br><br>
		<input type="text" id="temp30adBoardContent" name="adBoardContent" class="temp30"><br><br>
		<button id="temp30cancel" class="temp30">취소</button>
</div>
</form>
</div>
</body>
</html>