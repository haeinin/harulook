<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

img{
width:300px;
height:auto;
}
h1{
font-size:100px;
color:#47C83E;
}
h2{

color:#5CD1E5;
}
body{

font-family: 'Noto Sans KR' , serif;
font-size:18px; 
}
div{
float:left;
padding: 15px;

}
.col-side{
width:20%;
}
.col-center{
width:50%;
text-align:center;
}

</style>
</head>
<body>

<div class="col-side"></div>
<div class="col-center">

<h1>404 Error</h1>
<img src="resources/leony2.png">
<h2>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</h2>
<p>존재하지 않는 주소를 입력하셨거나,</p>
<p>요청하신 페이지의 주소가 변경,삭제되어 찾을 수 없습니다.</p>
<br><br><br>
<a class="btn btn-default" href="${pageContext.request.contextPath}/home">홈으로</a>
</div>

</body>
</html>