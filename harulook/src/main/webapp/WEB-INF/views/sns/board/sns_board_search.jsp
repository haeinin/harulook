<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/boardSearchList" method="post">
	<div class="form-group">
	    <label for="snsBoardWeather">snsBoardWeather :</label>
	    <select name="snsBoardWeather" id="snsBoardWeather">
	    	<option></option>
	    	<option>맑음</option>
	    	<option>구름조금</option>
	    	<option>흐림</option>
	    	<option>비</option>
	    	<option>눈</option>
	    </select>
	</div>
	<div class="form-group">
	    <label for="snsBoardTall">snsBoardTall :</label>
	    <select name="snsBoardTall" id="snsBoardTall">
	    	<option></option>
	    	<option>큰키</option>
	    	<option>보통키</option>
	    	<option>작은키</option>
	    </select>
	</div>
	<div class="form-group">
	    <label for="snsBoardSize">snsBoardSize :</label>
	    <select name="snsBoardSize" id="snsBoardSize">
	    	<option></option>
	    	<option>마른</option>
	    	<option>보통</option>
	    	<option>뚱뚱</option>
	    </select>
	</div>
	<div class="form-group">
	    <label for="snsBoardLoc">snsBoardLoc :</label>
	    <select name="snsBoardLoc" id="snsBoardLoc">
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
	<div class="form-group">
	    <label for="snsBoardGender">snsBoardGender :</label>
	    <input name="snsBoardGender" id="snsBoardGender" type="radio" value="남">남
	    <input name="snsBoardGender" id="snsBoardGender" type="radio" value="여">여
	</div>
	<div class="form-group">
	    <label for="snsBoardAge">snsBoardAge :</label>
	    <select name="snsBoardAge" id="snsBoardAge">
	    	<option></option>
	    	<option>10</option>
	    	<option>20</option>
	    	<option>30</option>
	    	<option>40</option>
	    	<option>50</option>
	    </select>
	</div>
	<div class="form-group">
		<label for="searchSnsBoardStyle">snsBoardStyle :</label>
	  	<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="액티브">액티브
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="심플">심플
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="로맨틱">로맨틱
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="러블리">러블리
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="럭셔리">럭셔리
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="댄디">댄디
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="스트리트">스트리트
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="빈티지">빈티지
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="캐쥬얼">캐쥬얼
		<input type="checkbox" id="searchSnsBoardStyle" name="searchSnsBoardStyle" value="클래식">클래식
	</div>
	<div class="form-group">
       	<label for="searchSnsBoardColor">snsBoardColor :</label>
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="빨강">빨강
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="주황">주황
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="노랑">노랑
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="초록">초록
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="파랑">파랑
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="네이비">네이비
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="보라">보라
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="핑크">핑크
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="브라운">브라운
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="베이지">베이지
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="검정">검정
       	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="그레이">그레이
     	<input type="checkbox" id="searchSnsBoardColor" name="searchSnsBoardColor" value="흰색">흰색
     </div>
     <div class="form-group">
       	<label for="searchSnsBoardSituation">snsBoardSituation :</label>
       	<input type="checkbox" id="searchSnsBoardSituation" name="searchSnsBoardSituation" value="하객">하객
       	<input type="checkbox" id="searchSnsBoardSituation" name="searchSnsBoardSituation" value="나들이">나들이
       	<input type="checkbox" id="searchSnsBoardSituation" name="searchSnsBoardSituation" value="운동">운동
       	<input type="checkbox" id="searchSnsBoardSituation" name="searchSnsBoardSituation" value="여행">여행
       	<input type="checkbox" id="searchSnsBoardSituation" name="searchSnsBoardSituation" value="파티">파티
       	<input type="checkbox" id="searchSnsBoardSituation" name="searchSnsBoardSituation" value="출근">출근
     </div>
     <input type="submit" value="검색">
</form>
</body>
</html>