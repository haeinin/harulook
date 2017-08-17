<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Beautiful Closet</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 100px;
      margin-top : 100px;
  }
  .carousel-inner img {
  
      width: 100%; /* Set width to 100% */
      margin: auto;
      
  }
  .carousel-caption h3 {
      color: #3d3d3d !important;
      font-size: 22px;
  }
  .carousel-caption p {
      color: #3d3d3d !important;
      font-size: 22px;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
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
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Beautiful Closet</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">HOME</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">CATEGORY
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">TOP</a></li>
            <li><a href="#">BOTTOM</a></li>
            <li><a href="#">ONE-PIECE</a></li> 
          </ul>
        </li>
        <li><a href="#">BUY</a></li>
        <li><a href="#contact">CONTACT</a></li>
        
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
	<!-- 슬라이드 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="resources/slide_1.jpg" alt="New Items" width="1200"
					height="700">
				<div class="carousel-caption">
					<h3>New ITEM</h3>
					<p>신상 아이템을 소개합니다</p>
				</div>
			</div>

			<div class="item">
				<img src="resources/slide_2.jpg" alt="Weekly Best Items" width=1200
					height="700">
				<div class="carousel-caption">
					<h3>Weekly BEST</h3>
					<p>이번주 베스트 아이템!</p>
				</div>
			</div>
		</div>

	<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 상품이미지 -->
<div class="container">
  <h2>BEST ITEM</h2>
  <p>뷰티풀 클로젯의 베스트 상품입니다♥</p>
  
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/mallDetail?mallProNo=mall_pro_01" target="_top">
          <img src="resources/mall_pro_1.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>상품이름</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/mallDetail?mallProNo=mall_pro_02" target="_top">
          <img src="resources/mall_pro_2.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>상품이름</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/mallDetail?mallProNo=mall_pro_03" target="_top">
          <img src="resources/mall_pro_3.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>상품이름</p>
          </div>
        </a>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/mallDetail?mallProNo=mall_pro_04" target="_top">
          <img src="resources/mall_pro_4.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>상품이름</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/mallDetail?mallProNo=mall_pro_05" target="_top">
          <img src="resources/mall_pro_5.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>상품이름</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/mallDetail?mallProNo=mall_pro_06" target="_top">
          <img src="resources/mall_pro_6.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>상품이름</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>

  
<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">Contact</h3>
  <p class="text-center"><em>HELLO!</em></p>

  <div class="row">
    <div class="col-md-4">
      <p>Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>JeonJu</p>
      <p><span class="glyphicon glyphicon-phone"></span>063-717-1008</p>
      <p><span class="glyphicon glyphicon-envelope"></span>https://github.com/haeinin/harulook.git</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
  <br>
  

  
</div>

<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>Beautiful Closet is virtual shopping site</p>
</footer>



</body>
</html>
