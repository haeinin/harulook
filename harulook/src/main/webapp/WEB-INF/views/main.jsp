<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
    <title>4조 하나미치</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

    <!-- Custom fonts for this template -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="resources/css/agency.min.css" type="text/css">
    
     <!-- Bootstrap core JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    
    <!-- Bootstrap core JavaScript -->
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
 
    <script src="resources/js/agency.min.js"></script>

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg  navbar-fixed-top" id="mainNav">
	  <div class="container">
	    <div class="navbar-header">
	      <a class="navbar-brand js-scroll-trigger" href="#page-top">hanamichi</a>
	    </div>
	    <div class="collapse navbar-collapse">
	      <ul class="nav navbar-nav navbar-right">
	        <li class="nav-item">
	          <a class="nav-link js-scroll-trigger" href="#link">Portfolio</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link js-scroll-trigger" href="#about">About</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link js-scroll-trigger" href="#team">Team</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome!<br> It's Nice To Meet You</div>
          <div class="intro-heading">4조 하나미치</div>
          <a class="btn btn-xl js-scroll-trigger" href="#link">더 알아보기</a>
        </div>
      </div>
    </header>

    <!-- Services -->
    <section id="link">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">Portfolio</h2>
            <h3 class="section-subheading explain">날씨기반 패션 SNS '하루룩'입니다</h3>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <a href="https://github.com/haeinin/harulook">
              <i class="fa fa-git fa-stack-1x fa-inverse"></i></a>
            </span>
            <h4 class="service-heading">하루룩 GitHub</h4>
            <p class="explain">클릭하면 harulook/master로 이동합니다</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <a href="./home"><i class="fa fa-umbrella fa-stack-1x fa-inverse"></i></a>
            </span>
            <h4 class="service-heading">하루룩 바로가기</h4>
            <p class="explain">하루룩 홈페이지 입니다</p>
          </div>
           <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-sticky-note-o fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">하루룩 개발문서</h4>
            <p class="explain">프로젝트 완료 보고서를 다운로드하여<br>개발상세내용을 볼 수 있습니다</p>
          </div>
      </div>
      </div>
    </section>
     <!-- About -->
    <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">About Project</h2>
            <h3 class="section-subheading explain">프로젝트 소개입니다</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <ul class="timeline">
            <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="resources/about1.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>프로젝트명</h4>
                    <h4 class="subheading">'하루룩'</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="explain" style="font-size:15px">
                    기상 데이터를 활용한 스타일 공유 SNS '하루룩'은
                    <br>'하루'와 스타일을 뜻하는 'look'의 합성어입니다
                    <br>인스타그램을 본 떠 날씨라는 옷을 입혔습니다
                    </p>
                  </div>
                </div>
              </li>
            <li class="timeline-inverted">
                <div class="timeline-image">
                   <img class="rounded-circle img-fluid" src="resources/about2.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                  <h4>  </h4>
                    <h4 >프로젝트목적</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="explain">
                    지역과 날씨를 기반으로 데일리룩을 공유하고 
                    <br>그에 맞는 패션 & 아이템 추천광고를 통해 
                    <br>수익을 창출할 수 있습니다.
                    </p>
                    </div>
                </div>
              </li>
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="resources/about3.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                  	<h4>  </h4>
                    <h4>프로젝트기능</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="explain">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="resources/about4.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>개발환경</h4>
                  </div>
                  <div class="timeline-body">
                  <p class="explain">
                    [ OS ] Windows 7
                    <br>[ Browser ] Crome
					<br>[ WAS ] Apache Tomcat 8.0.35
					</p>
                  
                  <a data-toggle="collapse" data-target="#demo">more....</a>
                  <div id="demo" class="collapse">
                  <p class="explain">
					<br>[Language] 
					<br>Java Script,JQuery,Java,Ajax,JSP,Json,JSTL
					<br>[FrameWork]
					<br>springframework 4.3.9, MyBatis, bootstrapspring-webmvc 4.3.9,Maven, mybatis 3.4.1, <br>mybatis-spring 1.2.2
					<br>[API]
                    </p>
                  </div>
                    
                    </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <h4><br>harulook</h4>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

 
    <!-- Team -->
    <section class="bg-light" id="team">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">Our Team</h2>
            <h3 class="section-subheading explain">하나미치 조원과 역할분담입니다<br>조원들의 블로그와 github도 소개합니다</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <div class="team-member">
              <!-- <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt=""> -->
              <h4>이해인</h4>
              <p class="text-muted">
              <br>제휴계약/결제 관리
              <br>제휴 쇼핑몰
              <br>명예의전당 관리</p>
              <br>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="http://sun-p.tistory.com/" target="_blank">
                    <i class="fa fa-user-o"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-github"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <!-- <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt=""> -->
              <h4>황인준</h4>
              <p class="text-muted">
              <br>SNS게시물 관리
              <br>SNS추천&댓글 관리
              <br>날씨API</p>
              <br>
              <ul class="list-inline social-buttons">
               <li class="list-inline-item">
                  <a href="http://blog.naver.com/acddde9" target="_blank">
                    <i class="fa fa-user-o"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-github"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <!-- <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt=""> -->
              <h4>김민구</h4>
              <p class="text-muted">
              <br>회원 / 로그인 관리
              <br>포인트/팔로우/방문자 관리</p>
              <br>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="http://blog.naver.com/alsrn880311" target="_blank">
                    <i class="fa fa-user-o"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-github"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member">
              <!-- <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt=""> -->
              <h4>박종빈</h4>
              <p class="text-muted">
              <br>광고계약/결제/환불 관리
              <br>광고 게시물 관리
              </p>
              <br>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="http://blog.naver.com/qkr456whd" target="_blank">
                    <i class="fa fa-user-o"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-github"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
           
          </div>
        </div>
      </div>
    </section>

   
    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; haruloook 2017</span>
          </div>
          <div class="col-md-4">
            <!-- <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
            </ul> -->
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    



   
  </body>

 
    
</html>
