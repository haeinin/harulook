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
게시물 상세보기 화면
<div class="container">
     <table class="table">
         <tbody>
             <tr>
                <td>sns_board_no :</td>
                <td>${board.snsBoardNo}</td>
               </tr>
            <tr>
                   <td>user_id :</td>
                   <td>${board.userId}</td>
            </tr>
            <tr>
                   <td>sns_board_img :</td>
                   <td>${board.snsBoardImg}</td>
            </tr>
            <tr>
                   <td>sns_board_content :</td>
                   <td>${board.snsBoardContent}</td>
            </tr>
            <tr>
                   <td>sns_board_weather :</td>
                   <td>${board.snsBoardWeather}</td>
            </tr>
            <tr>
                   <td>sns_board_tall :</td>
                   <td>${board.snsBoardTall}</td>
            </tr>
            <tr>
                   <td>sns_board_size :</td>
                   <td>${board.snsBoardSize}</td>
            </tr>
            <tr>
                   <td>sns_board_loc :</td>
                   <td>${board.snsBoardLoc}</td>
            </tr>
            <tr>
                   <td>sns_board_date :</td>
                   <td>${board.snsBoardDate}</td>
            </tr>
            <tr>
                   <td>sns_board_gender :</td>
                   <td>${board.snsBoardGender}</td>
            </tr>
            <tr>
                   <td>sns_board_age :</td>
                   <td>${board.snsBoardAge}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/boardUpdate?boardNo=${board.snsBoardNo}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/boardDelete?boardNo=${board.snsBoardNo}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">글목록</a>
</div>
</body>
</html>