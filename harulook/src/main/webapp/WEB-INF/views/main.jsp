<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>4조 프로젝트 메인화면</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
	$(document).ready(function(){
		$("#member1").click(function(){	//이해인
			$("#myModal1").modal();
	    });
		$("#member2").click(function(){	//황인준
			$("#myModal2").modal();
	    });
		$("#member3").click(function(){	//박종빈
			$("#myModal3").modal();
	    });
		$("#member4").click(function(){	//김민구
			$("#myModal4").modal();
	    });
		
		$("#projectbutton1").click(function(){	//프로젝트소개
			$("#project1").modal();
	    });
		$("#projectbutton2").click(function(){	//프로젝트환경
			$("#project2").modal();
	    });
	 });

</script>

	<style>
	.bg-1 { 
	    background-color: #1abc9c;
	    color: #ffffff;
	}
	.bg-2 { 
	    background-color: #474e5d;
	    color: #ffffff;
	}
	.bg-3 { 
	    background-color: #ffffff;
	    color: #555555;
	}
	.container-fluid {
	    padding-top: 70px;
	    padding-bottom: 70px;
	}
	</style>
  
	<style>
	table, th, td {
	    border: 1px solid black;
	    border-collapse: collapse;
	}
	th, td {
	    padding: 5px;
	    text-align: left;
	}
	</style>
</head>
<body>

<div class="container-fluid bg-1 text-center">
  <h1>하루룩</h1>
  <a href="http://haruloook.cafe24.com/home">포트폴리오 보러가기</a>
  <h3>하나미치</h3>
  
</div>

<div class="container-fluid bg-2 text-center">
  <h3>포트폴리오 소개</h3>
  <a href="https://github.com/haeinin/harulook.git">깃허브 보러가기</a>
  	<div>
		<input class="btn btn-default" id="projectbutton1" type="button" value="프로젝트소개"/>
	</div>
	<div>
		<input class="btn btn-default" id="projectbutton2" type="button" value="개발환경"/>
	</div>
</div>

<div class="container-fluid bg-3 text-center">    
  <h3>조 원</h3><br>
  <div class="row">
    <div class="col-sm-3">
      <p>이해인</p>
      <p>블로그주소</p>
      <p>깃허브주소</p>
      <div>
		<input class="btn btn-default" id="member1" type="button" value="역할보기"/>
   	  </div>	
    </div>
    <div class="col-sm-3"> 
      <p>황인준</p>
      <p>블로그주소</p>
      <p>깃허브주소</p>
      <div>
		<input class="btn btn-default" id="member2" type="button" value="역할보기"/>
   	  </div>
    </div>
    <div class="col-sm-3"> 
      <p>박종빈</p>
      <p>블로그주소</p>
      <p>깃허브주소</p>
      <div>
		<input class="btn btn-default" id="member3" type="button" value="역할보기"/>
   	  </div>
    </div>
    <div class="col-sm-3"> 
      <p>김민구</p>
      <p>블로그주소</p>
      <p>깃허브주소</p>
      <div>
		<input class="btn btn-default" id="member4" type="button" value="역할보기"/>
   	  </div>
    </div>
  </div>
</div>

<!-- 마이페이지 Modal 프로젝트 소개 -->
  <div class="modal fade" id="project1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	 
        <div class="modal-body" style="padding:40px 50px;">
          	<table style="width:80%">
			  <caption>프로젝트소개</caption>
			  <tr>
			    <th>프로젝트 주제</th>
			  </tr>
			  <tr>
			    <td>ㅁㄴㅇㄻㄴㅇㄹ</td>
			  </tr>
			  <tr>
			    <th>프로젝트 목표</th>
			  </tr>
			  <tr>
			    <td>ㅁㄴㅇㄻㄴㅇㄹ</td>
			  </tr>
			
			</table>
		</div>
      </div>
    </div>
  </div> 
  
  <!-- 마이페이지 Modal 개발환경 -->
  <div class="modal fade" id="project2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	 
        <div class="modal-body" style="padding:40px 50px;">
          	<table style="width:80%">
			  <caption>개발환경</caption>
			  <tr>
			  	<td>OS</td>
			    <td>Windows 7</td>
			  </tr>
			  <tr>
			  	<td>웹브라우저</td>
			    <td>Crome</td>
			  </tr>
			  <tr>
			  	<td>WAS</td>
			    <td>apache-tomcat-8.0.38</td>
			  </tr>
			  <tr>
			  	<td>DB</td>
			    <td>MySQL 5.7</td>
			  </tr>
			  <tr>
			  	<td>DB관리툴</td>
			    <td>HeidiSQL 9.4.0</td>
			  </tr>
			  <tr>
			  	<td>버전관리,협업 툴</td>
			    <td>GitHub</td>
			  </tr>
			  <tr>
			  	<td>java</td>
			    <td>java 1.8</td>
			  </tr>
			  <tr>
			  	<td>프레임워크</td>
			    <td>springframework 4.3.9, spring-webmvc 4.3.9,</td>
			  </tr>
			  <tr>
			  	<td>프레임워크</td>
			    <td>Maven, mybatis 3.3.1, mybatis-spring 1.2.2, bootstrap</td>
			  </tr>
			  <tr>
			  	<td>API</td>
			    <td>보류</td>
			  </tr>
			</table>
		</div>
      </div>
    </div>
  </div> 

<!-- 마이페이지 Modal 이해인 -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	 <!-- 역할 분담 -->
        <div class="modal-body" style="padding:40px 50px;">
          	<table style="width:80%">
			  <caption>이해인</caption>
			  <tr>
			    <th>1.제휴계약관리</th>
			  </tr>
			  <tr>
			    <td>제휴 계약 신청 폼</td>
			  </tr>
			  <tr>
			    <td>제휴 계약 수정</td>
			  </tr>
			  <tr>
			    <td>제휴 계약 목록 보기</td>
			  </tr>
			  <tr>
			    <td>제휴 계약 상세보기</td>
			  </tr>
			  <tr>
			    <td>제휴 계약 상세보기</td>
			  </tr>
			  <tr>
			    <th>2.제휴결제관리</th>
			  </tr>
			  <tr>
			    <td>제휴 결제 예정금액 조회</td>
			  </tr>
			  <tr>
			    <td>제휴 결제 화면</td>
			  </tr>
			  <tr>
			    <td>제휴 결제 내역조회</td>
			  </tr>
			  <tr>
			    <th>3.제휴쇼핑몰</th>
			  </tr>
			  <tr>
			    <td>상품 목록 보기</td>
			  </tr>
			  <tr>
			    <td>상품 상세 보기</td>
			  </tr>
			  <tr>
			    <th>4.명예의 전당 관리</th>
			  </tr>
			  <tr>
			    <td>명예의 전당 목록 보기</td>
			  </tr>
			  <tr>
			    <td>명예의 전당 상품 발송 내역</td>
			  </tr>
			</table>
		</div>
      </div>
    </div>
  </div> 
<!-- 마이페이지 Modal 황인준 -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	 <!-- 역할 분담 -->
       <div class="modal-body" style="padding:40px 50px;">
          	<table style="width:80%">
			  <caption>황인준</caption>
			  <tr>
			    <th>1.sns게시물관리</th>
			  </tr>
			  <tr>
			    <td>게시물 작성 폼</td>
			  </tr>
			  <tr>
			    <td>게시물 수정 폼</td>
			  </tr>
			  <tr>
			    <td>게시물 상세보기</td>
			  </tr>
			  <tr>
			    <td>게시물 목록보기</td>
			  </tr>
			  <tr>
			    <td>게시물 검색 폼</td>
			  </tr>
			  <tr>
			    <th>2.sns댓글관리</th>
			  </tr>
			  <tr>
			    <td>댓글 등록</td>
			  </tr>
			  <tr>
			    <td>댓글 목록보기</td>
			  </tr>
			  <tr>
			    <th>2.sns추천관리</th>
			  </tr>
			  <tr>
			    <td>추천 등록</td>
			  </tr>
			  <tr>
			    <td>추천인 목록</td>
			  </tr>
			</table>
		</div>
      </div>
    </div>
  </div> 
  <!-- 마이페이지 Modal 박종빈 -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	 <!-- 역할 분담 -->
        <div class="modal-body" style="padding:40px 50px;">
          	<table style="width:80%">
			  <caption>박종빈</caption>
			  <tr>
			    <th>1.광고계약관리</th>
			  </tr>
			  <tr>
			    <td>광고 계약 신청 폼</td>
			  </tr>
			  <tr>
			    <td>사업자 회원 광고 계약 목록 보기</td>
			  </tr>
			  <tr>
			    <td>관리자 회원 광고 계약 목록 보기</td>
			  </tr>
			  <tr>
			    <td>광고 계약 상세 보기</td>
			  </tr>
			  <tr>
			    <th>2.광고결제관리</th>
			  </tr>
			  <tr>
			    <td>광고 결제 화면</td>
			  </tr>
			  <tr>
			    <td>광고 결제내역 보기</td>
			  </tr>
			  <tr>
			    <th>3.광고환불관리</th>
			  </tr>
			  <tr>
			    <td>광고 환불 신청 폼</td>
			  </tr>
			  <tr>
			    <td>광고 환불 결제 화면</td>
			  </tr>
			  <tr>
			    <td>광고 환불 목록 보기</td>
			  </tr>
			  <tr>
			    <th>4.광고게시물관리</th>
			  </tr>
			  <tr>
			    <td>광고 게시물 등록</td>
			  </tr>
			  <tr>
			    <td>광고 게시물 수정</td>
			  </tr>
			  <tr>
			    <td>광고 게시물 목록 보기</td>
			  </tr>
			  <tr>
			    <td>광고 게시물 상세 보기</td>
			  </tr>
			</table>
		</div>
      </div>
    </div>
  </div> 
  <!-- 마이페이지 Modal 김민구 -->
  <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	 <!-- 역할 분담 -->
        <div class="modal-body" style="padding:40px 50px;">
          	<table style="width:80%">
			  <caption>김민구</caption>
			  <tr>
			    <th>1.회원관리</th>
			  </tr>
			  <tr>
			    <td>일반회원가입</td>
			  </tr>
			  <tr>
			    <td>사업자회원가입</td>
			  </tr>
			  <tr>
			    <td>관리자회원가입</td>
			  </tr>
			  <tr>
			    <td>사업자회원수정</td>
			  </tr>
			  <tr>
			    <td>사업자회원정보보기</td>
			  </tr>
			  <tr>
			    <td>일반회원 목록보기</td>
			  </tr>
			  <tr>
			    <td>사업자 회원 목록보기</td>
			  </tr>
			  <tr>
			    <td>관리자 회원 목록보기</td>
			  </tr>
			  <tr>
			    <td>전체회원 목록보기</td>
			  </tr>
			  <tr>
			    <td>회원 검색 폼</td>
			  </tr>
			  <tr>
			    <th>2.로그인관리</th>
			  </tr>
			  <tr>
			    <td>로그인</td>
			  </tr>
			  <tr>
			    <td>아이디찾기</td>
			  </tr>
			  <tr>
			    <td>비밀번호찾기</td>
			  </tr>
			  <tr>
			    <th>3.포인트관리</th>
			  </tr>
			  <tr>
			    <td>포인트 내역조회</td>
			  </tr>
			  <tr>
			    <td>포인트 상품 목록 보기</td>
			  </tr>
			  <tr>
			    <td>포인트 교환 신청</td>
			  </tr>
			  <tr>
			    <td>포인트 교환 내역</td>
			  </tr>
			  <tr>
			    <th>4.팔로우관리</th>
			  </tr>
			  <tr>
			    <td>팔로우 목록 보기</td>
			  </tr>
			  <tr>
			    <td>팔로잉 목록 보기</td>
			  </tr>
			  <tr>
			    <th>5.방문자관리</th>
			  </tr>
			  <tr>
			    <td>기간별 방문자 목록 보기</td>
			  </tr>
			</table>
		 </div>
      </div>
    </div>
  </div> 
</body>
</html>
