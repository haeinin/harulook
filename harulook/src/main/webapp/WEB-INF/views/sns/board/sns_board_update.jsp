<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
게시물 수정 화면
<div class="container">
	<form id="UdpateForm" action="${pageContext.request.contextPath}/boardUpdate" method="post">
		<table class="table">
			<tbody>
            	<tr>
             		<td>sns_board_no :</td>
	                <td>
						<input class="form-control" name="snsBoardNo" id="snsBoardNo" type="text" value="${board.snsBoardNo}" readonly="readonly"/>
					</td>
	            </tr>
            	<tr>
					<td>sns_board_content :</td>
					<td>
						<input class="form-control" name="snsBoardContent" id="snsBoardContent" type="text" value="${board.snsBoardContent}"/>
					</td>
            	</tr>
            	<tr>
					<td>sns_board_weather :</td>
                  	<td>
						<input class="form-control" name="snsBoardWeather" id="snsBoardWeather" type="text" value="${board.snsBoardWeather}"/>
					</td>
	            </tr>
	            <tr>
					<td>sns_board_tall :</td>
					<td>
						<input class="form-control" name="snsBoardTall" id="snsBoardTall" type="text" value="${board.snsBoardTall}"/>
					</td>
	            </tr>
	            <tr>
					<td>sns_board_size :</td>
					<td>
						<input class="form-control" name="snsBoardSize" id="snsBoardSize" type="text" value="${board.snsBoardSize}"/>
					</td>
	            </tr>
	            <tr>
					<td>sns_board_loc :</td>
					<td>
						<input class="form-control" name="snsBoardLoc" id="snsBoardLoc" type="text" value="${board.snsBoardLoc}"/>
					</td>
	            </tr>
	            <tr>
					<td>sns_board_gender :</td>
					<td>
						<input class="form-control" name="snsBoardGender" id="snsBoardGender" type="text" value="${board.snsBoardGender}"/>
					</td>
	            </tr>
	            <tr>
					<td>sns_board_age :</td>
					<td>
						<input class="form-control" name="snsBoardAge" id="snsBoardAge" type="text" value="${board.snsBoardAge}"/>
					</td>
	            </tr>
	        </tbody>
	    </table>
    	<input class="btn btn-default" type="submit" value="수정">
    	<a class="btn btn-default" href="${pageContext.request.contextPath}/boardDetail?boardNo=${board.snsBoardNo}">취소</a>
    	<a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
    </form>
</div>
</body>
</html>