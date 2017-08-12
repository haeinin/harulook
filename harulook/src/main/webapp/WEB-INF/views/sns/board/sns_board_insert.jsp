<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
게시물 입력 화면
	<div class="container">
	<form id="insertForm" action="${pageContext.request.contextPath}/boardInsert" method="post">
        <div class="form-group">
            <label for="userId">userId :</label>
            <input class="form-control" name="userId" id="userId" type="text"/>
        </div>
        <div class="form-group">
            <label for="snsBoardImg">snsBoardImg :</label>
            <input class="form-control" name="snsBoardImg" id="snsBoardImg" type="text"/>
        </div>
        <div class="form-group">
            <label for="snsBoardContent">snsBoardContent :</label>
            <input class="form-control" name="snsBoardContent" id="snsBoardContent" type="text"/>
        </div>
        <div class="form-group">
            <label for="snsBoardWeather">snsBoardWeather :</label>
            <select class="form-control" name="snsBoardWeather" id="snsBoardWeather">
            	<option>맑음</option>
            	<option>구름조금</option>
            	<option>흐림</option>
            	<option>비</option>
            	<option>눈</option>
            </select>
        </div>
        <div class="form-group">
            <label for="snsBoardTall">snsBoardTall :</label>
            <select class="form-control" name="snsBoardTall" id="snsBoardTall">
            	<option>큰키</option>
            	<option>보통키</option>
            	<option>작은키</option>
            </select>
        </div>
        <div class="form-group">
            <label for="snsBoardSize">snsBoardSize :</label>
            <select class="form-control" name="snsBoardSize" id="snsBoardSize">
            	<option>마른</option>
            	<option>보통</option>
            	<option>뚱뚱</option>
            </select>
        </div>
        <div class="form-group">
            <label for="snsBoardLoc">snsBoardLoc :</label>
            <select class="form-control" name="snsBoardLoc" id="snsBoardLoc">
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
            <select class="form-control" name="snsBoardAge" id="snsBoardAge">
            	<option>10</option>
            	<option>20</option>
            	<option>30</option>
            	<option>40</option>
            	<option>50</option>
            </select>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="submit" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
        </div>
    </form>
    </div>
</body>
</html>