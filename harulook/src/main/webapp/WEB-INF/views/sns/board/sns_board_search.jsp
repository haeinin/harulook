<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>