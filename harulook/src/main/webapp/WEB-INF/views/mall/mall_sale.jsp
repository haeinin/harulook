<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<title>Beautiful Closet</title>
<style>
body{
	font-family: 'Jeju Gothic',	sans-serif;
}
.nav-tabs li a {
	color: #777;
}

.navbar {
	font-family: Montserrat, sans-serif;
	margin-bottom: 0;
	background-color: #2d2d30;
	border: 0;
	font-size: 11px !important;
	letter-spacing: 4px;
	opacity: 0.9;
}

.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

.navbar-nav li a:hover {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
}

.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

.dropdown-menu li a {
	color: #000 !important;
}

.dropdown-menu li a:hover {
	background-color: red !important;
}
.container {
	padding: 80px 100px;
	margin-top: 100px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<<a class="navbar-brand" href="${pageContext.request.contextPath}/mallMain">Beautiful Closet</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#myPage">HOME</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">CATEGORY <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">TOP</a></li>
						<li><a href="#">BOTTOM</a></li>
						<li><a href="#">ONE-PIECE</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/mallOrderList">MY PAGE</a></li>
				<li><a href="#contact">CONTACT</a></li>

				<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
			</ul>
		</div>
	</div>
	</nav>
<div class="container">
구매감사합니다!<br><br>

 <table class="table">
        <thead>
            <tr>
                <th>상품명</th>
                <th>상품갯수</th>
                <th>총금액</th>
                <th>구매날짜</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    
                    <td>${getDto.mallProName}</td>
                    <td>${getDto.mallSaleAmount}</td>
                    <td>${getDto.mallSaleTotal}</td>
                    <td>${getDto.mallSaleDate}</td>
                    

                </tr>
        </tbody>
        </table>
        </div>
</body>
</html>