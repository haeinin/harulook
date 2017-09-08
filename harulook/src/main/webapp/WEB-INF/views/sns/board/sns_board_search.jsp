<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 색상 카테고리 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(function(){
	var toggleRed = false;
	$('#circleRed').click(function(){
		
		if(toggleRed == false) {
			$('input:checkbox[id="searchColorRed"]').prop('checked',true);
			toggleRed = true;
			$('#circleRed').attr('class','fa fa-check-circle');
			console.log('toggleRed : ',toggleRed);
		} else if(toggleRed == true) {
			$('input:checkbox[id="searchColorRed"]').prop('checked',false);
			toggleRed = false;
			$('#circleRed').attr('class','fa fa-circle');
			console.log('toggleRed : ',toggleRed);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleOrange = false;
	$('#circleOrange').click(function(){
		
		if(toggleOrange == false) {
			$('input:checkbox[id="searchColorOrange"]').prop('checked',true);
			toggleOrange = true;
			$('#circleOrange').attr('class','fa fa-check-circle');
			console.log('toggleOrange : ',toggleOrange);
		} else if(toggleOrange == true) {
			$('input:checkbox[id="searchColorOrange"]').prop('checked',false);
			toggleOrange = false;
			$('#circleOrange').attr('class','fa fa-circle');
			console.log('toggleOrange : ',toggleOrange);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleYellow = false;
	$('#circleYellow').click(function(){
		
		if(toggleYellow == false) {
			$('input:checkbox[id="searchColorYellow"]').prop('checked',true);
			toggleYellow = true;
			$('#circleYellow').attr('class','fa fa-check-circle');
			console.log('toggleYellow : ',toggleYellow);
		} else if(toggleYellow == true) {
			$('input:checkbox[id="searchColorYellow"]').prop('checked',false);
			toggleYellow = false;
			$('#circleYellow').attr('class','fa fa-circle');
			console.log('toggleYellow : ',toggleYellow);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleGreen = false;
	$('#circleGreen').click(function(){
		
		if(toggleGreen == false) {
			$('input:checkbox[id="searchColorGreen"]').prop('checked',true);
			toggleGreen = true;
			$('#circleGreen').attr('class','fa fa-check-circle');
			console.log('toggleGreen : ',toggleGreen);
		} else if(toggleGreen == true) {
			$('input:checkbox[id="searchColorGreen"]').prop('checked',false);
			toggleGreen = false;
			$('#circleGreen').attr('class','fa fa-circle');
			console.log('toggleGreen : ',toggleGreen);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleBlue = false;
	$('#circleBlue').click(function(){
		
		if(toggleBlue == false) {
			$('input:checkbox[id="searchColorBlue"]').prop('checked',true);
			toggleBlue = true;
			$('#circleBlue').attr('class','fa fa-check-circle');
			console.log('toggleBlue : ',toggleBlue);
		} else if(toggleBlue == true) {
			$('input:checkbox[id="searchColorBlue"]').prop('checked',false);
			toggleBlue = false;
			$('#circleBlue').attr('class','fa fa-circle');
			console.log('toggleBlue : ',toggleBlue);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleNavy = false;
	$('#circleNavy').click(function(){
		
		if(toggleNavy == false) {
			$('input:checkbox[id="searchColorNavy"]').prop('checked',true);
			toggleNavy = true;
			$('#circleNavy').attr('class','fa fa-check-circle');
			console.log('toggleNavy : ',toggleNavy);
		} else if(toggleNavy == true) {
			$('input:checkbox[id="searchColorNavy"]').prop('checked',false);
			toggleNavy = false;
			$('#circleNavy').attr('class','fa fa-circle');
			console.log('toggleNavy : ',toggleNavy);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var togglePurple = false;
	$('#circlePurple').click(function(){
		
		if(togglePurple == false) {
			$('input:checkbox[id="searchColorPurple"]').prop('checked',true);
			togglePurple = true;
			$('#circlePurple').attr('class','fa fa-check-circle');
			console.log('togglePurple : ',togglePurple);
		} else if(togglePurple == true) {
			$('input:checkbox[id="searchColorPurple"]').prop('checked',false);
			togglePurple = false;
			$('#circlePurple').attr('class','fa fa-circle');
			console.log('togglePurple : ',togglePurple);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleBlack = false;
	$('#circleBlack').click(function(){
		
		if(toggleBlack == false) {
			$('input:checkbox[id="searchColorBlack"]').prop('checked',true);
			toggleBlack = true;
			$('#circleBlack').attr('class','fa fa-check-circle');
			console.log('toggleBlack : ',toggleBlack);
		} else if(toggleBlack == true) {
			$('input:checkbox[id="searchColorBlack"]').prop('checked',false);
			toggleBlack = false;
			$('#circleBlack').attr('class','fa fa-circle');
			console.log('toggleBlack : ',toggleBlack);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleGrey = false;
	$('#circleGrey').click(function(){
		
		if(toggleGrey == false) {
			$('input:checkbox[id="searchColorGrey"]').prop('checked',true);
			toggleGrey = true;
			$('#circleGrey').attr('class','fa fa-check-circle');
			console.log('toggleGrey : ',toggleGrey);
		} else if(toggleGrey == true) {
			$('input:checkbox[id="searchColorGrey"]').prop('checked',false);
			toggleGrey = false;
			$('#circleGrey').attr('class','fa fa-circle');
			console.log('toggleGrey : ',toggleGrey);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleWhite = false;
	$('#circleWhite').click(function(){
		
		if(toggleWhite == false) {
			$('input:checkbox[id="searchColorWhite"]').prop('checked',true);
			toggleWhite = true;
			$('#circleWhite').attr('class','fa fa-check-circle');
			console.log('toggleWhite : ',toggleWhite);
		} else if(toggleWhite == true) {
			$('input:checkbox[id="searchColorWhite"]').prop('checked',false);
			toggleWhite = false;
			$('#circleWhite').attr('class','fa fa-circle');
			console.log('toggleWhite : ',toggleWhite);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleBrown = false;
	$('#circleBrown').click(function(){
		
		if(toggleBrown == false) {
			$('input:checkbox[id="searchColorBrown"]').prop('checked',true);
			toggleBrown = true;
			$('#circleBrown').attr('class','fa fa-check-circle');
			console.log('toggleBrown : ',toggleBrown);
		} else if(toggleBrown == true) {
			$('input:checkbox[id="searchColorBrown"]').prop('checked',false);
			toggleBrown = false;
			$('#circleBrown').attr('class','fa fa-circle');
			console.log('toggleBrown : ',toggleBrown);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var toggleBeige = false;
	$('#circleBeige').click(function(){
		
		if(toggleBeige == false) {
			$('input:checkbox[id="searchColorBeige"]').prop('checked',true);
			toggleBeige = true;
			$('#circleBeige').attr('class','fa fa-check-circle');
			console.log('toggleBeige : ',toggleBeige);
		} else if(toggleBeige == true) {
			$('input:checkbox[id="searchColorBeige"]').prop('checked',false);
			toggleBeige = false;
			$('#circleBeige').attr('class','fa fa-circle');
			console.log('toggleBeige : ',toggleBeige);
		}
		boardSearch();
		popBoardSearch();
	});
	
	var togglePink = false;
	$('#circlePink').click(function(){
		
		if(togglePink == false) {
			$('input:checkbox[id="searchColorPink"]').prop('checked',true);
			togglePink = true;
			$('#circlePink').attr('class','fa fa-check-circle');
			console.log('togglePink : ',togglePink);
		} else if(togglePink == true) {
			$('input:checkbox[id="searchColorPink"]').prop('checked',false);
			togglePink = false;
			$('#circlePink').attr('class','fa fa-circle');
			console.log('togglePink : ',togglePink);
		}
		boardSearch();
		popBoardSearch();
	});

});
</script>
</head>
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-9">
			<!-- sns 게시물 검색 항목 -->	    
			<h5><a href="#demo" data-toggle="collapse" style="color: black;">게시물 필터 <i class="fa fa-bars"></i></a></h5>
			<div id="demo" class="collapse">
				<div class="searchGroup">
					<label for="snsBoardWeather">날씨 :</label>
					<select class="searchCategory" name="snsBoardWeather" id="snsBoardWeather">
						<option></option>
						<option>맑음</option>
						<option>구름조금</option>
						<option>흐림</option>
						<option>비</option>
						<option>눈</option>
					</select>
				    
				    <label for="snsBoardTall">키 :</label>
				    <select class="searchCategory" name="snsBoardTall" id="snsBoardTall">
				    	<option></option>
				    	<option>큰키</option>
				    	<option>보통키</option>
				    	<option>작은키</option>
				    </select>
				    
				    <label for="snsBoardSize">체형 :</label>
				    <select class="searchCategory" name="snsBoardSize" id="snsBoardSize">
				    	<option></option>
				    	<option>마른</option>
				    	<option>보통</option>
				    	<option>뚱뚱</option>
				    </select>
				
				    <label for="snsBoardLoc">지역 :</label>
				    <select class="searchCategory" name="snsBoardLoc" id="snsBoardLoc">
				    	<option></option>
				    	<option>서울</option>
				    	<option>경기</option>
				    	<option>강원</option>
				    	<option>충남</option>
				    	<option>충북</option>
				    	<option>전북</option>
				    	<option>전남</option>
				    	<option>경북</option>
				    	<option>경남</option>
				    	<option>제주</option>
				    	<option>세종</option>
				    </select>
				
				    <label for="snsBoardGender">성별 :</label>
				    <input class="searchCategory" name="snsBoardGender" id="snsGenderMale" type="radio" value="여">여
				    <input class="searchCategory" name="snsBoardGender" id="snsGenderFemale" type="radio" value="남">남
			
				    <label for="snsBoardAge">나이 :</label>
				    <select class="searchCategory" name="snsBoardAge" id="snsBoardAge">
				    	<option></option>
				    	<option>10</option>
				    	<option>20</option>
				    	<option>30</option>
				    	<option>40</option>
				    	<option>50</option>
				    </select>
				</div>
				<div class="form-group">
					<label for="searchSnsBoardStyle">스타일 :</label>		
					<input class="searchCategory" type="checkbox" id="searchStyleClassic" name="styleValue" value="style_01">클래식
					<input class="searchCategory" type="checkbox" id="searchStyleCasual" name="styleValue" value="style_02">캐쥬얼
					<input class="searchCategory" type="checkbox" id="searchStyleVintage" name="styleValue" value="style_03">빈티지
					<input class="searchCategory" type="checkbox" id="searchStyleStreet" name="styleValue" value="style_04">스트리트
					<input class="searchCategory" type="checkbox" id="searchStyleDandy" name="styleValue" value="style_05">댄디
					<input class="searchCategory" type="checkbox" id="searchStyleLuxury" name="styleValue" value="style_06">럭셔리
					<input class="searchCategory" type="checkbox" id="searchStyleLovely" name="styleValue" value="style_07">러블리
					<input class="searchCategory" type="checkbox" id="searchStyleLomantic" name="styleValue" value="style_08">로맨틱
					<input class="searchCategory" type="checkbox" id="searchStyleSimple" name="styleValue" value="style_09">심플
					<input class="searchCategory" type="checkbox" id="searchStyleActive" name="styleValue" value="style_10">액티브
				</div>
				<div class="form-group">
			      	<label for="searchSnsBoardColor">색상 :</label>
			      	<div id="searchSnsBoardColor">
				     	<a href="#"><i id="circleRed" class="fa fa-circle" style="font-size: 24px; color: red;"></i></a>
				     	<a href="#"><i id="circleOrange" class="fa fa-circle" style="font-size: 24px; color: orange;"></i></a>
				     	<a href="#"><i id="circleYellow" class="fa fa-circle" style="font-size: 24px; color: yellow;"></i></a>
				     	<a href="#"><i id="circleGreen" class="fa fa-circle" style="font-size: 24px; color: green;"></i></a>
				     	<a href="#"><i id="circleBlue" class="fa fa-circle" style="font-size: 24px; color: blue;"></i></a>
				     	<a href="#"><i id="circleNavy" class="fa fa-circle" style="font-size: 24px; color: navy;"></i></a>
				     	<a href="#"><i id="circlePurple" class="fa fa-circle" style="font-size: 24px; color: purple;"></i></a>
				     	<a href="#"><i id="circleBlack" class="fa fa-circle" style="font-size: 24px; color: black;"></i></a>
				     	<a href="#"><i id="circleGrey" class="fa fa-circle" style="font-size: 24px; color: grey;"></i></a>
				     	<a href="#"><i id="circleWhite" class="fa fa-circle" style="font-size: 24px; color: white; background-color: black; border-radius: 47%; width: 22px;"></i></a>
				     	<a href="#"><i id="circleBrown" class="fa fa-circle" style="font-size: 24px; color: brown;"></i></a>
				     	<a href="#"><i id="circleBeige" class="fa fa-circle" style="font-size: 24px; color: beige; background-color: black; border-radius: 47%; width: 22px;"></i></a>
				     	<a href="#"><i id="circlePink" class="fa fa-circle" style="font-size: 24px; color: pink;"></i></a>
			     	</div>
			     	<div style="display: none;">
				    	<input class="searchCategory" type="checkbox" id="searchColorRed" name="colorValue" value="color_01">빨강
				    	<input class="searchCategory" type="checkbox" id="searchColorOrange" name="colorValue" value="color_02">주황
				      	<input class="searchCategory" type="checkbox" id="searchColorYellow" name="colorValue" value="color_03">노랑
				      	<input class="searchCategory" type="checkbox" id="searchColorGreen" name="colorValue" value="color_04">초록
				      	<input class="searchCategory" type="checkbox" id="searchColorBlue" name="colorValue" value="color_05">파랑
				      	<input class="searchCategory" type="checkbox" id="searchColorNavy" name="colorValue" value="color_06">남색
				      	<input class="searchCategory" type="checkbox" id="searchColorPurple" name="colorValue" value="color_07">보라
				      	<input class="searchCategory" type="checkbox" id="searchColorBlack" name="colorValue" value="color_08">검정
				      	<input class="searchCategory" type="checkbox" id="searchColorGrey" name="colorValue" value="color_09">회색
				    	<input class="searchCategory" type="checkbox" id="searchColorWhite" name="colorValue" value="color_10">흰색
				    	<input class="searchCategory" type="checkbox" id="searchColorBrown" name="colorValue" value="color_11">갈색
				    	<input class="searchCategory" type="checkbox" id="searchColorBeige" name="colorValue" value="color_12">베이지
				      	<input class="searchCategory" type="checkbox" id="searchColorPink" name="colorValue" value="color_13">핑크     
			      	</div>  	
			    </div>
			    <div class="form-group">
			      	<label class="searchCategory" for="searchSnsBoardSituation">상황 :</label>
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_01">학교
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_02">출근
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_03">파티
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_04">여행
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_05">운동
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_06">나들이
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_07">하객    	
			    </div>
			    <div class="form-group">
			    	<label class="searchCategory" for="userId">아이디 :</label>
			    	<input type="text" class="searchCategory" id="userId" name="userId">
			    	<input class="btn btn-default" type="button" value="검색">
			    	<c:if test="${sessionScope.level == '일반회원'}">
			    		<button class="btn btn-default" type="button" id="recommendationBtn">맞춤 추천</button>
			    	</c:if>
			    	<button class="btn btn-default" type="button" id="initBtn">초기화</button>

			    </div>
			</div>
			<!-- sns 게시물 검색 항목 -->
		</div>
	</div>
</html>