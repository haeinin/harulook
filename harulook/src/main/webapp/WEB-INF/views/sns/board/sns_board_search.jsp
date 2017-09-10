<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 색상 카테고리 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<c:set value="${sessionScope.CcTall}" var="CcTall"></c:set>
<c:set value="${sessionScope.CcSize}" var="CcSize"></c:set>
<c:set value="${sessionScope.CcGender}" var="CcGender"></c:set>
<c:set value="${sessionScope.CcAge}" var="CcAge"></c:set>
<c:set value="${sessionScope.CcuserColor}" var="CcuserColor"></c:set>
<c:set value="${sessionScope.CcuserStyle}" var="CcuserStyle"></c:set>
<c:set value="${sessionScope.apiAdd}" var="apiAdd"></c:set>
<c:set value="${sessionScope.sessionWeather}" var="sessionWeather"></c:set>
<script type="text/javascript">

var currentPage = 1; // 현재 페이지 선언 및 초기화

/* 색상별 토글 버튼  */
function toggleColor(color) { //color: 선택한 색상
	
	// 해당되는 색상 체크박스가 체크되지 않았을 때
	if($('#searchColor'+color+'').is(':checked') == false) { 
		$('input:checkbox[id="searchColor'+color+'"]').prop('checked',true);	// 체크박스 체크
		$('#circle'+color+'').attr('class','fa fa-check-circle');				// 색상 버튼 체크 상태 그림으로 
		console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
		
	// 해당되는 색상 체크박스가 이미 체크되었을 때
	} else if($('#searchColor'+color+'').is(':checked') == true) {
		$('input:checkbox[id="searchColor'+color+'"]').prop('checked',false);	// 체크박스 체크 해제
		$('#circle'+color+'').attr('class','fa fa-circle');						// 색상 버튼 체크 해제 상태 그림으로 
		console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
	}
	currentPage = 1;	// 현재 페이지 1로 초기화
	console.log('currentPage : ',currentPage);
	boardSearch();		// 최신 게시물 검색 함수 호출
	popBoardSearch();	// 인기 게시물 검색 함수 호출
} 

$(function(){

	console.log('currentPage : ',currentPage);
	
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

	var userTall = '<c:out value="${CcTall}"/>';
	var userSize = '<c:out value="${CcSize}"/>';
	var userGender = '<c:out value="${CcGender}"/>';
	var userAge = '<c:out value="${CcAge}"/>';
	var userColor = '<c:out value="${CcuserColor}"/>';
	var userStyle = '<c:out value="${CcuserStyle}"/>';
	var apiAdd = '<c:out value="${apiAdd}"/>';
	var sessionWeather = '<c:out value="${sessionWeather}"/>';
	console.log('sessionWeather : ',sessionWeather);

	/* 검색 초기화 버튼 클릭 */
	$('#initBtn').click(function(){
		$('#userId').val('');
		$('#snsBoardWeather').val('');
		$('#snsBoardTall').val('');
		$('#snsBoardSize').val('');
		$('#snsBoardLoc').val('');
		$('#snsBoardAge').val('');
		$('#snsGenderMale').prop('checked',false);
		$('#snsGenderFemale').prop('checked',false);
		$('input:checkbox[name="styleValue"]').prop('checked', false);
		$('input:checkbox[name="colorValue"]').prop('checked',false);
		$('input:checkbox[name="situationValue"]').prop('checked',false);
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
		currentPage = 1;
		boardSearch();
		popBoardSearch();
	});
	
	
	/* 맞춤 추천 버튼 클릭 */
	$('#recommendationBtn').click(function(){
		console.log('userTall : ',userTall);
		console.log('userSize : ',userSize);
		console.log('userGender : ',userGender);
		console.log('userAge : ',userAge);
		console.log('userColor : ',userColor);
		console.log('userStyle : ',userStyle);
		
		
		/* 체크박스 초기화 */
		$('input:checkbox[name="styleValue"]').prop('checked', false);
		$('input:checkbox[name="colorValue"]').prop('checked',false);
		$('input:checkbox[name="situationValue"]').prop('checked',false);
		
		/* 색상 버튼 초기화 */
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
		
		/* 세션에 셋팅된 사용자 정보를 필터에 적용 */
		$('#snsBoardWeather').val(sessionWeather);	// 현재 날씨
		$('#snsBoardLoc').val(apiAdd);				// 접속 지역
		$('#snsBoardTall').val(userTall);			// 키
		$('#snsBoardSize').val(userSize);			// 체형
		
		console.log('sessionWeather : ',sessionWeather);
		
		// 성별 - 라디오 버튼이라 조건문으로 처리
		if(userGender == '여') {
			$('#snsGenderMale').prop('checked',true);
		} else {
			$('#snsGenderFemale').prop('checked',true);
		}
		$('#snsBoardAge').val(userAge);				// 연령대
		
		/* 사용자 스타일 체크 판별 */
		if(userStyle.indexOf('클래식') != -1) {
			$('input:checkbox[id="searchStyleClassic"]').prop("checked", true);
		}
		if(userStyle.indexOf('캐쥬얼') != -1) {
			$('input:checkbox[id="searchStyleCasual"]').prop("checked", true);
		}
		if(userStyle.indexOf('빈티지') != -1) {
			$('input:checkbox[id="searchStyleVintage"]').prop("checked", true);
		} 
		if(userStyle.indexOf('스트릿') != -1) {
			$('input:checkbox[id="searchStyleStreet"]').prop("checked", true);
		}
		if(userStyle.indexOf('댄디') != -1) {
			$('input:checkbox[id="searchStyleDandy"]').prop("checked", true);
		} 
		if(userStyle.indexOf('럭셔리') != -1) {
			$('input:checkbox[id="searchStyleLuxury"]').prop("checked", true);
		}
		if(userStyle.indexOf('러블리') != -1) {
			$('input:checkbox[id="searchStyleLovely"]').prop("checked", true);
		} 
		if(userStyle.indexOf('로맨틱') != -1) {
			$('input:checkbox[id="searchStyleLomantic"]').prop("checked", true);
		}
		if(userStyle.indexOf('심플') != -1) {
			$('input:checkbox[id="searchStyleSimple"]').prop("checked", true);
		} 
		if(userStyle.indexOf('액티브') != -1) {
			$('input:checkbox[id="searchStyleActive"]').prop("checked", true);
		}
		
		/* 사용자 색상 체크 판별 */
		if(userColor.indexOf('빨강') != -1) {
			$('input:checkbox[id="searchColorRed"]').prop("checked", true);
			$('#circleRed').attr('class','fa fa-check-circle');
		} 
		if(userColor.indexOf('주황') != -1) {
			$('input:checkbox[id="searchColorOrange"]').prop("checked", true);
			$('#circleOrange').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('노랑') != -1) {
			$('input:checkbox[id="searchColorYellow"]').prop("checked", true);
			$('#circleYellow').attr('class','fa fa-check-circle');
		} 
		if(userColor.indexOf('초록') != -1) {
			$('input:checkbox[id="searchColorGreen"]').prop("checked", true);
			$('#circleGreen').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('파랑') != -1) {
			$('input:checkbox[id="searchColorBlue"]').prop("checked", true);
			$('#circleBlue').attr('class','fa fa-check-circle');
		} 
		if(userColor.indexOf('남색') != -1) {
			$('input:checkbox[id="searchColorNavy"]').prop("checked", true);
			$('#circleNavy').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('보라') != -1) {
			$('input:checkbox[id="searchColorPurple"]').prop("checked", true);
			$('#circlePurple').attr('class','fa fa-check-circle');
		} 
		if(userColor.indexOf('검정') != -1) {
			$('input:checkbox[id="searchColorBlack"]').prop("checked", true);
			$('#circleBlack').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('회색') != -1) {
			$('input:checkbox[id="searchColorGrey"]').prop("checked", true);
			$('#circleGrey').attr('class','fa fa-check-circle');
		} 
		if(userColor.indexOf('흰색') != -1) {
			$('input:checkbox[id="searchColorWhite"]').prop("checked", true);
			$('#circleWhite').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('갈색') != -1) {
			$('input:checkbox[id="searchColorBrown"]').prop("checked", true);
			$('#circleBrown').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('베이지') != -1) {
			$('input:checkbox[id="searchColorBeige"]').prop("checked", true);
			$('#circleBeige').attr('class','fa fa-check-circle');
		}
		if(userColor.indexOf('핑크') != -1) {
			$('input:checkbox[id="searchColorPink"]').prop("checked", true);
			$('#circlePink').attr('class','fa fa-check-circle');
		}
		currentPage = 1;
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
				</div>
				<div class="searchGroup">
					
				    
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
			      	<label>색상 :</label>
			     	<a href="#"><i id="circleRed" class="fa fa-circle" style="font-size: 24px; color: red; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleOrange" class="fa fa-circle" style="font-size: 24px; color: orange; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleYellow" class="fa fa-circle" style="font-size: 24px; color: yellow; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleGreen" class="fa fa-circle" style="font-size: 24px; color: green; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleBlue" class="fa fa-circle" style="font-size: 24px; color: deepskyblue; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleNavy" class="fa fa-circle" style="font-size: 28px; color: navy;"></i></a>
			     	<a href="#"><i id="circlePurple" class="fa fa-circle" style="font-size: 28px; color: purple;"></i></a>
			     	<a href="#"><i id="circleBlack" class="fa fa-circle" style="font-size: 28px; color: black;"></i></a>
			     	<a href="#"><i id="circleGrey" class="fa fa-circle" style="font-size: 24px; color: grey; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleWhite" class="fa fa-circle" style="font-size: 24px; color: white; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleBrown" class="fa fa-circle" style="font-size: 24px; color: brown; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circleBeige" class="fa fa-circle" style="font-size: 24px; color: beige; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	<a href="#"><i id="circlePink" class="fa fa-circle" style="font-size: 24px; color: pink; background-color: black; border-radius: 47%; width: 22px;"></i></a>
			     	
			     	<!-- 색상 체크박스는 보이지 않게 설정 -->
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
			    	<input type="text" class="searchCategory" id="userId" name="userId" value="${board.userId}">
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