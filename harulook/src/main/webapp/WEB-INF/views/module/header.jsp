<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
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
<!-- 주소 api --> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script> 
<!-- 유효성검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/cartoony_weather.css" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		$('#loginbutton').click(function(){	//로그인버튼
			$('#login').submit();
        });
		
		$('#logout').click(function(){	//로그아웃버튼
			$('#logoutadd').submit();
        });
		
		$("#mypage").click(function(){	//마이페이지보기
			$("#myModal").modal();
        });

		$('#userlistbutton').click(function(){	//일반회원리스트 버튼
			$('#member_user_list').submit();
        });
		
		$('#businesslistbutton').click(function(){	//사업자회원리스트 버튼
			$('#member_business_list').submit();
        });
		
		$('#managerlistbutton').click(function(){	//관리자회원리스트 버튼
			$('#member_manager_list').submit();
        });
		
		var d = new Date();
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		if(month < 10) {
			month = '0'+month;
		}
		console.log(month);
		var day = d.getDate();
		if(day < 10) {
			day = '0'+day;
		}
		var date = year+month+day+'';
		console.log(date);
		var hour = d.getHours();
		var minute = d.getMinutes(); 
		if(minute < 40) {
			if(hour > 0) {
				hour = hour - 1;
			} else {
				hour = 23;
			}
		}
		if(hour < 10) {
			hour = '0'+hour;
		}
		hour = hour+'00';
		console.log(hour);
		
		var allData = { "date": date, "hour": hour };
		
		var weatherRequest = $.ajax({
			url : './currentWeather',
			method : 'get',
			data : allData,
			datatype : 'json',
			success : function(data){
				console.log(data);
				$('#tempur').text('현재 기온 : '+data.temp1hour+'℃');
				
				switch(data.sky) {
				case '1' : 
					$('#weaterIcon').attr('class','sunny');
					break;
				case '2' : 
					$('#weaterIcon').attr('class','partly_cloudy');
					$('#sun').attr('class','partly_cloudy__sun');
					$('#cloud').attr('class','partly_cloudy__cloud');
					break;
				case '3' :
					$('#weaterIcon').attr('class','cloudy');
					break;
				case '4' :
					$('#weaterIcon').attr('class','rainy');
					$('#cloud').attr('class','rainy__cloud');
					break;
				default :
					$('#weaterIcon').attr('class','');
					break;
				
				}
				
				switch(data.rainStat) {
				case '1' :
					$('#rain').attr('class','rainy__rain');
					break;
				case '2' :
					$('#rain').attr('class','thundery__rain');
					break;
				default :
					$('#rain').removeAttr('class');
					break;
				}
				
			},
			error : function(){
				alert('fail');
			}
		});
	 });
</script>
</head>
<body>

<!-- 현재 날씨  -->
<div class="weather_body" >
	<div id="weaterIcon">
		<div id="sun"></div>
		<div id="cloud"></div>
		<div id="rain"></div>
	</div> 
</div>
<div id="tempur"></div>
<!-- 세션에 있는 아이디 권한 받기 -->
아이디 : <c:out value='${sessionScope.id}'/><br>
권한 : <c:out value='${sessionScope.level}'/><br>
닉네임 : <c:out value='${sessionScope.nick}'/><br>

	<c:if test="${sessionScope.level == null}">
		<a>	로그인이 안됬을때</a>
		<!-- 로그인버튼 -->
		<form id="login" action="${pageContext.request.contextPath}/loginForm" method="get">
  		<div>
			<input class="btn btn-default" id="loginbutton" type="button" value="로그인하기"/>
		</div>	
	</form>
	</c:if><br>
	<c:if test="${sessionScope.level != null}">
		<!-- 마이페이지 -->
		<form id="logoutadd" action="${pageContext.request.contextPath}/logout" method="post">
	  		<div>
				<input class="btn btn-default" id="mypage" type="button" value="마이페이지"/>
			</div>	
		</form>
		<!-- 로그아웃 -->
		<form id="logoutadd" action="${pageContext.request.contextPath}/logout" method="post">
	  		<div>
	  			<input class="btn btn-default" id="logout" type="button" value="로그아웃"/>
	  	 	</div>	
		</form>		
	</c:if>
	
	
	
	


	<!-- 마이페이지 Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
     	<!-- 모달 공통내용 -->
     	<div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>마이페이지</h4>
          <a>닉네임 : ${sessionScope.nick}</a><br>
		  <a>권한 : ${sessionScope.level}</a><br>
		  <!-- 내정보수정하기버튼 -->
		  <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myModifiedFrom" method="post">
	  		<div>
	  			<input class="btn btn-default" id="myModified" type="button" value="내 정보 수정 하기"/>
	  	 	</div>	
		  </form>	
        </div>
        <!-- 모달 회원별 내용 -->
        <div class="modal-body" style="padding:40px 50px;">
          	<c:if test="${sessionScope.level == '관리자'}">
				<a>관리자로 로그인</a><br>
				<!-- 사업자용 버튼 -->
					<!-- 일반회원검색 -->
				  <form id="member_user_list" action="${pageContext.request.contextPath}/member_user_list" method="get">
			  		<div>
			  			<input class="btn btn-default" id="userlistbutton" type="button" value="일반회원검색"/>
			  	 	</div>	
				  </form>	
				  
				  	<!-- 사업자검색 -->
				  <form id="member_business_list" action="${pageContext.request.contextPath}/member_business_list" method="get">
			  		<div>
			  			<input class="btn btn-default" id="businesslistbutton" type="button" value="사업자검색"/>
			  	 	</div>	
				  </form>
				  
				  	<!-- 관리자검색 -->
				  <form id="member_manager_list" action="${pageContext.request.contextPath}/member_manager_list" method="get">
			  		<div>
			  			<input class="btn btn-default" id="managerlistbutton" type="button" value="관리자검색"/>
			  	 	</div>	
				  </form>
				  
				  	<!-- 광고 검색 및 승인 -->
				  <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myModifiedFrom" method="post">
			  		<div>
			  			<input class="btn btn-default" id="myModified" type="button" value="광거 검색 및 승인"/>
			  	 	</div>	
				  </form>
				  
				  	<!-- 사이트 접속자수 검색 -->
				   <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myModifiedFrom" method="post">
			  		<div>
			  			<input class="btn btn-default" id="myModified" type="button" value="사이트 접속자수 검색"/>
			  	 	</div>	
				  </form>
			</c:if>
			<c:if test="${sessionScope.level == '사업자'}">
				<a>사업자로 로그인</a><br>
				<!-- 사업자용 버튼 -->
					<!-- 내 광고 보기 -->
				  <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myModifiedFrom" method="post">
			  		<div>
			  			<input class="btn btn-default" id="myModified" type="button" value="내 광고 보기"/>
			  	 	</div>	
				  </form>	
				  
				  <!-- 사이트 접속자수 보기 -->
				  <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myModifiedFrom" method="post">
			  		<div>
			  			<input class="btn btn-default" id="myModified" type="button" value="사이트 접속자수 보기"/>
			  	 	</div>	
				  </form>	
			</c:if>
			<c:if test="${sessionScope.level == '일반회원'}">
				<a>일반회원 로그인</a><br>
				<!-- 일반회원용 버튼 -->
					<!-- 내 게시물 보기 -->
				  <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myBoardList" method="post">
			  		<div>
			  			<input type="hidden" name="userId" value="${sessionScope.id}">
			  			<input class="btn btn-default" id="myModified" type="submit" value="내 게시물 보기"/>
			  	 	</div>	
				  </form>
				  
				  	<!-- 내 친구 보기 -->
				  <form id="myModifiedFrom" action="${pageContext.request.contextPath}/myModifiedFrom" method="post">
			  		<div>
			  			<input class="btn btn-default" id="myModified" type="button" value="내 친구 보기"/>
			  	 	</div>	
				  </form>		
			</c:if>
        </div>
      </div>
    </div>
  </div> 

</body>
</html>