<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 색상 카테고리 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/imgareaselect-default.css" />
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.imgareaselect.pack.js"></script>
<title>~하루룩~</title>
<script type="text/javascript">

/* 색상별 토글 버튼  */
function toggleColor(color) { //color: 선택한 색상
	
	// 해당되는 색상 체크박스가 체크되지 않았을 때
	if($('#searchColor'+color+'').is(':checked') == false) { 
		$('input:checkbox[id="searchColor'+color+'"]').prop('checked',true);	// 체크박스 체크
		$('#circle'+color+'').attr('class','fa fa-check-circle cursor-click');				// 색상 버튼 체크 상태 그림으로 
		console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
		
	// 해당되는 색상 체크박스가 이미 체크되었을 때
	} else if($('#searchColor'+color+'').is(':checked') == true) {
		$('input:checkbox[id="searchColor'+color+'"]').prop('checked',false);	// 체크박스 체크 해제
		$('#circle'+color+'').attr('class','fa fa-circle cursor-click');						// 색상 버튼 체크 해제 상태 그림으로 
		console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
	}
} 


function readURL(input, id) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$("#" + id).attr('src', e.target.result);
			$('#preview img').attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
	}
}

// 선택한 영역 이미지 자르기
/* function preview(img, selection) {
    if (!selection.width || !selection.height)
        return;
    
	var squareWidth;
    
    if($('#snsBoardImgView').width()< $('#snsBoardImgView').height()) {
    	squareWidth = $('#snsBoardImgView').width();
    } else {
    	squareWidth = $('#snsBoardImgView').height();
    }
    
    $('.frame').css({
    	width: squareWidth+'px',
    	height: squareWidth+'px'
    })
    
    $('#preview').css({
    	width: squareWidth+'px',
    	height: squareWidth+'px'
    })
    
    var scaleX = squareWidth / selection.width;
    var scaleY = squareWidth / selection.height;
    

    $('#preview img').css({
        width: Math.round(scaleX * $('#snsBoardImgView').width()),
        height: Math.round(scaleY * $('#snsBoardImgView').height()),
        marginLeft: -Math.round(scaleX * selection.x1),
        marginTop: -Math.round(scaleY * selection.y1)
    });

    $('#x1').val(selection.x1);
    $('#y1').val(selection.y1);
    $('#x2').val(selection.x2);
    $('#y2').val(selection.y2);
    $('#w').val(selection.width);
    $('#h').val(selection.height);    
} */

$(function(){
/* 	
	var squareWidth;
    
    if($('#snsBoardImgView').width()< $('#snsBoardImgView').height()) {
    	squareWidth = $('#snsBoardImgView').width();
    	console.log(' squareWidth : ',squareWidth,'px');
    } else {
    	squareWidth = $('#snsBoardImgView').height();
    	console.log(' squareWidth : ',squareWidth,'px');
    }
    
    $('#preview img').css({
    	width: squareWidth+'px',
    	height: squareWidth+'px'
    })
     */
     
	//이미지 파일 입력 여부 검사
	$('#snsBoardImg').change(function(){
		if($('#snsBoardImg').val() == '') { 
			$('#imgFail').show();
			$('#snsBoardImg').focus();
		return false;
		}else{
			$('#imgFail').hide();
			var id = $(this).attr('id');
			id = id + "View";
			console.log(id);
		//	console.log(' squareWidth : ',squareWidth,'px');
			readURL(this, id);
		}
	});
	
	//내용 입력 여부 검사
	$('#snsBoardContent').change(function(){
		if($('#snsBoardContent').val() == '') { 
			$('#contentFail').show();
			$('#snsBoardContent').focus();
		return false;
		}else{
			$('#contentFail').hide();
		}
	});
	
	//날씨 입력 여부 검사
	$('#snsBoardWeather').change(function(){
		
		if($('#snsBoardWeather').val() == '') { 
			$('#weatherFail').show();
			$('#snsBoardWeather').focus();
		return false;
		}else{
			$('#weatherFail').hide();
		}
	});
	
	//지역 입력 여부 검사
	$('#snsBoardLoc').change(function(){
		
		if($('#snsBoardLoc').val() == '') { 
			$('#locFail').show();
			$('#snsBoardLoc').focus();
		return false;
		}else{
			$('#locFail').hide();
		}
	});
	
	// 게시물 등록버튼 클릭
	$('#addButton').click(function(){	
		
		if(!$('#snsBoardImg').val()){	//사진 업로드 안했을때
			alert('사진을 올려주세요.');
			$('#snsBoardImg').focus();
			return false;
		}else if(!$('#snsBoardWeather').val()){	//날씨 입력 안했을때
			alert('날씨를 입력해주세요');
			$('#snsBoardWeather').focus();
			return false;
		}else if(!$('#snsBoardLoc').val()){	//지역
			alert('지역을 입력해주세요');
			$('#snsBoardLoc').focus();
			return false;
		}
/* 		else if($('#x1').val()== '-'){	
			alert('업로드할 이미지 영역을 선택해주세요.');
			$('#snsBoardImgView').focus();
			return false;
		} */
		else{
			$('#insertForm').submit();
		}
		
		
    });
	
	/* 사진 올리는 버튼이 바뀔경우 readURL메서드를 실행시켜 사진을 미리보기 시켜줌 */
	$('#snsBoardImg').on('change', function() {
		
	});

	// 빨간색 버튼 클릭
	$('#circleRed').click(function(){
		toggleColor('Red');
	});
	
	// 주황색 버튼 클릭
	$('#circleOrange').click(function(){
		toggleColor('Orange');
	});
	
	// 노란색 버튼 클릭
	$('#circleYellow').click(function(){
		toggleColor('Yellow');
	});
	
	// 초록색 버튼 클릭
	$('#circleGreen').click(function(){
		toggleColor('Green');
	});
	
	// 파란색 버튼 클릭
	$('#circleBlue').click(function(){
		toggleColor('Blue');
	});
	
	// 남색 버튼 클릭
	$('#circleNavy').click(function(){
		toggleColor('Navy');
	});
	
	// 보라색 버튼 클릭
	$('#circlePurple').click(function(){
		toggleColor('Purple');
	});
	
	// 검정색 버튼 클릭
	$('#circleBlack').click(function(){
		toggleColor('Black');
	});
	
	// 회색 버튼 클릭
	$('#circleGrey').click(function(){
		toggleColor('Grey');
	});
	
	// 흰색 버튼 클릭
	$('#circleWhite').click(function(){
		toggleColor('White');
	});
	
	// 갈색 버튼 클릭
	$('#circleBrown').click(function(){
		toggleColor('Brown');
	});
	
	// 베이지색 버튼 클릭
	$('#circleBeige').click(function(){
		toggleColor('Beige');
	});
	
	// 분홍색 버튼 클릭
	$('#circlePink').click(function(){
		toggleColor('Pink');
	});
	
	// 초기화 버튼 클릭
	$('#resetBtn').click(function(){
		$('#circleRed').attr('class','fa fa-circle');
		$('#circleOrange').attr('class','fa fa-circle');
		$('#circleYellow').attr('class','fa fa-circle');
		$('#circleGreen').attr('class','fa fa-circle');
		$('#circleBlue').attr('class','fa fa-circle');
		$('#circleNavy').attr('class','fa fa-circle');
		$('#circlePurple').attr('class','fa fa-circle');
		$('#circleBlack').attr('class','fa fa-circle');
		$('#circleGrey').attr('class','fa fa-circle');
		$('#circleWhite').attr('class','fa fa-circle');
		$('#circleBrown').attr('class','fa fa-circle');
		$('#circleBeige').attr('class','fa fa-circle');
		$('#circlePink').attr('class','fa fa-circle');
	});
	
/* 	$('#snsBoardImgView').imgAreaSelect({ 
		aspectRatio: '1:1', 
		handles: true,
        fadeSpeed: 200, 
        onSelectChange: preview, 
        x1: 0, y1: 0, x2: squareWidth, y2: squareWidth
    }); */
});
</script>
</head>
<body>
	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
		
	<!-- 바디 인클루드 -->
    <div class="row">
    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
    	<div class="col-xs-1"></div>
	    <div id="div1" class="col-xs-8">
	    	<div class="col-xs-12">
			<form class="form-horizontal" id="insertForm" action="${pageContext.request.contextPath}/boardInsert" method="post" enctype="multipart/form-data">
		        <input class="form-control" name="userId" id="userId" type="hidden" value="${sessionScope.id}"/>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="uploadFile">사진 </label>
			        <div class="col-xs-7">
			            <img id="snsBoardImgView" class="img-responsive" src="#" alt="your image" />
<!-- 			            <div class="frame" style="margin: 0 1em; width: 100px; height: 100px;">
					      <div id="preview" style="width: 100px; height: 100px; overflow: hidden;">
					        <img id="previewImg" src="" style="width: 100px; height: 100px;" />
					      </div>
					    </div> -->
			            <input class="form-control" name="uploadFile" id="snsBoardImg" type="file"/>
			            <span id="imgFail" >사진을 올려주세요.</span>
		            </div>
		        </div>
		        
			    <input type="hidden" id="x1" name="imgX1" value="-" />
			    <input type="hidden" id="y1" name="imgY1" value="-" />
			    <input type="hidden" id="w" name="ImgWidth" value="-"/>
			    <input type="hidden" id="h" name="ImgHeight" value="-" />
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardContent">내용 </label>
		            <div class="col-xs-7">
			            <textarea class="form-control" name="snsBoardContent" id="snsBoardContent" rows="4" cols="50"></textarea>
			            <span id="contentFail" >내용을 입력해주세요.</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardLoc">지역 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardLoc" id="snsBoardLoc">
			            	<option>${sessionScope.apiAdd}</option>
			            	<option>서울</option>
			            	<option>부산</option>
			            	<option>울산</option>
			            	<option>대구</option>
			            	<option>인천</option>
			            	<option>대전</option>
			            	<option>광주</option>
			            	<option>제주</option>
			            	<option>세종</option>
			            	<option>경기</option>
			            	<option>강원</option>
			            	<option>충북</option>
			            	<option>충남</option>
			            	<option>경북</option>
			            	<option>경남</option>
			            	<option>전북</option>
			            	<option>전남</option>
			            </select>
			            <span id="locFail" >지역을 선택해주세요.</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardWeather">날씨 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardWeather" id="snsBoardWeather">
			            	<option>${sessionScope.sessionWeather}</option>
			            	<option>맑음</option>
			            	<option>구름조금</option>
			            	<option>흐림</option>
			            	<option>비</option>
			            	<option>눈</option>
			            </select>
		            	<span id="weatherFail" >현재 날씨를 선택해주세요.</span>
	            	</div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardTall">키 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardTall" id="snsBoardTall">
			            	<option></option>
			            	<option>큰키</option>
			            	<option>보통키</option>
			            	<option>작은키</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardSize">체형 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardSize" id="snsBoardSize">
			            	<option></option>
			            	<option>마른</option>
			            	<option>보통</option>
			            	<option>뚱뚱</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardGender">성별 </label>
		            <div class="col-xs-7">
			            <input name="snsBoardGender" id="snsBoardGender" type="radio" value="남">남
			            <input name="snsBoardGender" id="snsBoardGender" type="radio" value="여">여
			        </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardAge">연령대 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardAge" id="snsBoardAge">
			            	<option></option>
			            	<option>10</option>
			            	<option>20</option>
			            	<option>30</option>
			            	<option>40</option>
			            	<option>50</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
					<label class="col-xs-2 control-label" for="searchSnsBoardStyle">스타일 </label>
					<div class="col-xs-7">
					<table>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_01">클래식</td>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_02">캐쥬얼</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_03">빈티지</td>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_04">스트리트</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_05">댄디</td>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_06">럭셔리</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_07">러블리</td>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_08">로맨틱</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_09">심플</td>
							<td><input type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_10">액티브</td>
						</tr>
					</table>
					</div>
				</div>
				<div class="form-group">
			       	<label class="col-xs-2 control-label" for="searchSnsBoardColor">색상 </label>
			       	<div class="col-xs-7">
				       	<i id="circleRed" class="fa fa-circle cursor-click" title="빨강" style="font-size: 24px; color: red; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleOrange" class="fa fa-circle cursor-click" title="주황" style="font-size: 24px; color: orange; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleYellow" class="fa fa-circle cursor-click" title="노랑" style="font-size: 24px; color: yellow; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleGreen" class="fa fa-circle cursor-click" title="초록" style="font-size: 24px; color: green; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleBlue" class="fa fa-circle cursor-click" title="파랑" style="font-size: 24px; color: deepskyblue; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleNavy" class="fa fa-circle cursor-click" title="남색(네이비)" style="font-size: 28px; color: navy;"></i>
				     	<i id="circlePurple" class="fa fa-circle cursor-click" title="보라" style="font-size: 28px; color: purple;"></i>
				     	<i id="circleBlack" class="fa fa-circle cursor-click" title="검정" style="font-size: 28px; color: black;"></i>
				     	<i id="circleGrey" class="fa fa-circle cursor-click" title="회색" style="font-size: 24px; color: grey; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleWhite" class="fa fa-circle cursor-click" title="흰색" style="font-size: 24px; color: white; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleBrown" class="fa fa-circle cursor-click" title="갈색" style="font-size: 24px; color: brown; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleBeige" class="fa fa-circle cursor-click" title="베이지" style="font-size: 24px; color: beige; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circlePink" class="fa fa-circle cursor-click" title="분홍" style="font-size: 24px; color: pink; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	
				     	<div style="display:none;">
					       	<input type="checkbox" id="searchColorRed" name="colorValue" value="color_01">빨강
							<input type="checkbox" id="searchColorOrange" name="colorValue" value="color_02">주황
							<input type="checkbox" id="searchColorYellow" name="colorValue" value="color_03">노랑
							<input type="checkbox" id="searchColorGreen" name="colorValue" value="color_04">초록
							<input type="checkbox" id="searchColorBlue" name="colorValue" value="color_05">파랑
							<input type="checkbox" id="searchColorNavy" name="colorValue" value="color_06">남색
							<input type="checkbox" id="searchColorPurple" name="colorValue" value="color_07">보라
							<input type="checkbox" id="searchColorBlack" name="colorValue" value="color_08">검정
							<input type="checkbox" id="searchColorGrey" name="colorValue" value="color_09">회색
							<input type="checkbox" id="searchColorWhite" name="colorValue" value="color_10">흰색
							<input type="checkbox" id="searchColorBrown" name="colorValue" value="color_11">갈색
							<input type="checkbox" id="searchColorBeige" name="colorValue" value="color_12">베이지
							<input type="checkbox" id="searchColorPink" name="colorValue" value="color_13">핑크
				     	</div>
			     	</div>
			     </div>
			     <div class="form-group">
			       	<label class="col-xs-2 control-label" for="searchSnsBoardSituation">상황 </label>
			       	<div class="col-xs-7">
			       	<table>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_01">학교</td>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_02">출근</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_03">파티</td>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_04">여행</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_05">운동</td>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_06">나들이</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_07">하객</td>
						</tr>
					</table>
					</div>
			     </div>
			    <br>
			    <div style="text-align: center;">
		            <input class="btn btn-default" id="addButton" type="submit" value="글입력"/>
		            <input id="resetBtn" class="btn btn-default" type="reset" value="초기화"/>
		            <a class="btn btn-default" href="${pageContext.request.contextPath}/home">홈으로</a>
		            <br>
		        </div>
		    </form>
		    </div>
	    </div>	
	    
		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
    </div>
    
    <div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
	
</body>
</html>