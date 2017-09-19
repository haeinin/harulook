<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
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
<div class="col-side"></div>
<div class="col-center"> 
<h1>500</h1>
<h2>죄송합니다. 요청하신 페이지를 불러 올 수 없습니다.</h2>
<p>내부 서버 오류가 발생하여 페이지를 불러 올 수 없습니다.</p>

<br><br><br>
<a class="btn btn-default" href="${pageContext.request.contextPath}/home">홈으로</a>
</div>
</html>