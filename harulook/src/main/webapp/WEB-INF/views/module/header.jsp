<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 버튼 위치 조정 -->
<style type="text/css">
/* 로그인버튼 */
#loginbutton {
	position: relative;
	top : 15px;
}

/* 마이페이지 드롭다운*/
#mypageDropdown {
	position: relative;
}

/* 타이틀 */
#titleHaruloook {
	position: relative;
	top : -5px;
}

/* 로그아웃 */
#logout {
	position: relative;
}
/* 게시물등록하기 */
#snsInsertButton {
	position: fixed;
}
/* 홈으로 */
#logo {
	position: relative;
}
/* 해더위치조정 */
#head {
	position: relative;
	height: 80px;
	margin-bottom: 50px;
	background-color: #f4f8f9;
	border-bottom: 1px solid lightgrey;
}
</style>
<!-- 드롭박스 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- 유효성검사 -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> -->

<link rel="stylesheet"
	href="<c:url value="resources/css/cartoony-weather.css?ver=1" />"
	type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="<c:url value="resources/css/cartoony-weather.css" />" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat' rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="resources/css/style.css?ver=1">
<!-- w3아이콘  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="resources/js/modernizr.js"></script>

<script>

//<!--
//
// LCC DFS 좌표변환을 위한 기초 자료
//
var RE = 6371.00877; // 지구 반경(km)
var GRID = 5.0; // 격자 간격(km)
var SLAT1 = 30.0; // 투영 위도1(degree)
var SLAT2 = 60.0; // 투영 위도2(degree)
var OLON = 126.0; // 기준점 경도(degree)
var OLAT = 38.0; // 기준점 위도(degree)
var XO = 43; // 기준점 X좌표(GRID)
var YO = 136; // 기1준점 Y좌표(GRID)
//
// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
//


function dfs_xy_conv(code, v1, v2) {
    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;

    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;

    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);
    var rs = {};
    if (code == "toXY") {
        rs['lat'] = v1;
        rs['lng'] = v2;
        var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        var theta = v2 * DEGRAD - olon;
        if (theta > Math.PI) theta -= 2.0 * Math.PI;
        if (theta < -Math.PI) theta += 2.0 * Math.PI;
        theta *= sn;
        rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
        console.log(rs['x']);
        rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
        console.log(rs['y']);
    }
    else {
        rs['x'] = v1;
        rs['y'] = v2;
        var xn = v1 - XO;
        var yn = ro - v2 + YO;
        ra = Math.sqrt(xn * xn + yn * yn);
        if (sn < 0.0) - ra;
        var alat = Math.pow((re * sf / ra), (1.0 / sn));
        alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

        if (Math.abs(xn) <= 0.0) {
            theta = 0.0;
        }
        else {
            if (Math.abs(yn) <= 0.0) {
                theta = Math.PI * 0.5;
                if (xn < 0.0) - theta;
            }
            else theta = Math.atan2(xn, yn);
        }
        var alon = theta / sn + olon;
        rs['lat'] = alat * RADDEG;
        rs['lng'] = alon * RADDEG;
    }
    console.log("rs : ",rs);
    return rs;
}

/**************** 날씨 초단기 실황 api 실행 ***************/
function currentWeather(allData) {
	var weatherRequest = $.ajax({
		url : './currentWeather',
		method : 'get',
		data : allData,
		datatype : 'json'
	});
	weatherRequest.done(function(data) {
		console.log(data);
		$('#tempur').text('현재 기온 : '+data.temp1hour+'℃');	// 현재 기온 표시
		var sessionWeather = '';
		var sessionSky = '';
		var sessionRain = '';
		
		// 하늘 상태 
		if(data.thunder == '1') {    // 낙뢰가 있는 경우
		    $('#weaterIcon').attr('class','thundery');
		    $('#cloud').attr('class','thundery__cloud');    //먹구름
		}else {
		    switch(data.sky) {
		    case '1' :     // 맑음
		        $('#weaterIcon').attr('class','sunny');
		        break;
		    case '2' :     // 구름 조금
		        $('#weaterIcon').attr('class','partly_cloudy');
		        $('#sun').attr('class','partly_cloudy__sun');
		        $('#cloud').attr('class','partly_cloudy__cloud');
		        break;
		    case '3' :    // 구름 많음
		        $('#weaterIcon').attr('class','cloudy');
		        break;
		    case '4' :    // 흐림
		        $('#weaterIcon').attr('class','rainy');
		        $('#cloud').attr('class','rainy__cloud');
		        break;
		    default :
		        $('#weaterIcon').attr('class','');
		        break;
		    }
		}
		 
		// 강수형태 - 비나 눈
		switch(data.rainStat) {    
		case '1' :    // 비
		    if(data.precipitation > 5) { // 강수량이 5 이상일 때, 폭우 
		        $('#rain').attr('class','thundery__rain');
		    } else {
		        $('#rain').attr('class','rainy__rain');
		    }
		    break;
		case '3' :    // 눈 (가져온 날씨 css에 눈 그림이 없어서 폭우 그림으로 대체. 눈 그림은 추후에 추가 예정)
		    $('#rain').attr('class','thundery__rain');
		    break;
		default :    //없음
		    $('#rain').removeAttr('class');
		    break;
		}
	});
}
//-->		

$(document).ready(function(){
	
	$('#loginbutton').click(function(){	//로그인버튼
		$('#login').submit();
       });
	
	$('#logout').click(function(){	//로그아웃버튼
		$('#logoutadd').submit();
       });
	
	$('#mypage').click(function(){	//마이페이지보기
		var request = $.ajax({	//일반회원의 포인트를 받아오기 
			  url: "./myPagePoint", //호출 경로
			  method: "POST",	//전송방식
			  dataType: "text" //결과값 타입 (리턴)
		});  
		request.done(function( msg ) {
			msg = msg.trim();
			console.log(msg);	//아이디찾기
			$('#myPointMsg').html('나의 보유 포인트 = ' + msg);
			sessionStorage.setItem('myPointSession', msg);
		});	
		$('#myModal').modal();	//마이페이지모달
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
	
	$('#managerInsertbutton').click(function(){	//관리자회원리스트 버튼
		$('#newManagerInsert').submit();
       });
	
	$('#userUpdateButton').click(function(){	//일반회원수정하기
		$('#userUpdate').submit();
       });
	
	$('#businessUpdateButton').click(function(){	//사업자 관리자 회원 수정하기
		$('#businessUpdate').submit();
       });
	
	$('#guestListButton').click(function(){	//방문자 접속자수 보기
		$('#guestListForm').submit();
       });
	
	$('#followListButton').click(function(){	//팔로우 리스트 보기
		$('#followList').submit();
       });
	
	$('#followMeListButton').click(function(){	//나를 등록한 팔로우 리스트 보기
		$('#followMeList').submit();
       });
	
	$('#myPointButton').click(function(){	//나의 포인트 보기
		$('#myPoint').submit();
       });
	
	$('#adcontractlistButton').click(function(){	//내 광고 보기
		$('#adcontractlistForm').submit();
       });
	
	$('#adcontractlistButtonManager').click(function(){	//사업자가 광고 리스트 보기
		$('#adcontractlistFormManager').submit();
       });
	
	$('#partnerContractListButton').click(function(){	//내 제휴 보기
		$('#partnerContractListForm').submit();
       });
	
	$('#snsInsertButton').click(function(){	//sns게시물등록하기
		$('#snsInsertForm').submit();
       });
	
	$('#followCheckButton').click(function(){	//팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식팔로우등록 테스트양식
		$('#followCheck').submit();
       });
	$('#adContractListButton').click(function(){
		$('#adContract').submit();
	})
	
	$('#reFundButton').click(function(){	//환불보기
		$('#reFundForm').submit();
	})
	
	$('#partnerButton').click(function(){	//제휴 관리 및 승인
		$('#partnerForm').submit();
	})
	
	
	/* 오늘 날짜를 날씨 api의 입력 양식에 맞게 변환 */
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
	/********************************/
	
	/* 현재 시간을 날씨api 입력 양식에 맞게 변환 */
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
	/********************************/
	
	var position = sessionStorage.getItem('influx');
	var nx = '60';
	var ny = '127';
	
	var allData = { 'date': date, 'hour': hour, 'nx': nx, 'ny': ny};	// api에 입력할 데이터 
	console.log(nx, ny);
	
	console.log('allData : ',allData); 
	currentWeather(allData);	// 실시간 날씨 api 받아오는 ajax	
	
	/* 현재 접속한 아이피로 위치 받아오는 이벤트 */
	navigator.geolocation.getCurrentPosition(function(position){
	
		var lat = position.coords.latitude;	// 현재 접속 위치의 위도
		var lng = position.coords.longitude; 	// 현재 접속 위치의 경도
		
		var rs = dfs_xy_conv("toXY",lat,lng); // 위도경도 값을 xy격자 값으로 변환
		
		allData = { 'date': date, 'hour': hour, 'nx': rs.x, 'ny': rs.y};	// api에 입력할 데이터 
		
		console.log('allData : ',allData);
		currentWeather(allData);	// 실시간 날씨 api 받아오는 ajax
		});
});
</script>

</head>
<body>
		<div id="head" class="row">
			<div class="col-xs-3 ">

			<!-- 현재 날씨  -->
			<div class="weather_body">
				<div id="weaterIcon">
					<div id="sun"></div>
					<div id="cloud"></div>
					<div id="rain"></div>
				</div>
			</div>

			<h2 style="margin-left: 20px;" id="tempur" class="tempur"></h2>
			<h2 style="margin-left: 20px;" class="tempur"> 접속 지역 : ${sessionScope.apiAdd}</h2>

			<!-- 세션에 있는 아이디 권한 받기 -->
			<%-- 아이디 : <c:out value='${sessionScope.id}'/><br> --%>
			<%-- 권한 : <c:out value='${sessionScope.level}'/><br> --%>
			<%-- 닉네임 : <c:out value='${sessionScope.nick}'/><br> --%>
			</div>
			
			<div class="col-xs-6">
			<div id="titleHaruloook" class="name fancy-font">
				<h1>
					<a href="${pageContext.request.contextPath}/home" style="color: black;"><i class="fa fa-umbrella" style="font-size:48px;color:black"></i>&nbsp haruloook
					</a>
				</h1>
			</div>
				<!-- <img src="./resources/logo.jpg" width="180px" height="50px"
					class="img-rounded" alt="Cinque Terre"> -->
			</div>

		<div class="col-xs-3">
			<c:if test="${sessionScope.level == null}">
				<!-- 로그인버튼 -->
				<form id="login" style="float:left;"
					action="${pageContext.request.contextPath}/loginForm" method="get">
					<div class="btn">
						<input class="btn btn-default" id="loginbutton" type="button"
							value="로그인하기" />
					</div>
				</form>
			</c:if>
			<br>
				
				
			<c:if test="${sessionScope.level != null}">
			<div id="mypageDropdown">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" style="float:left;" type="button" data-toggle="dropdown">마이페이지
					<span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li><a>닉네임 : ${sessionScope.nick}</a>
						 	<a>권한 : ${sessionScope.level}</a></li>
						<li><c:if test="${sessionScope.level == '관리자'}">
							
							<!-- 관리자용 버튼 -->
							<!-- 내정보수정하기버튼 -->
							<form id="businessUpdate"
								action="${pageContext.request.contextPath}/businessUpdate?userId=${sessionScope.id}"
								method="post">
								<div>
									<input class="btn btn-default" id="businessUpdateButton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="내 정보 수정 하기" />
								</div>
							</form>

							<!-- 새관리자 등록하기 -->
							<form id="newManagerInsert"
								action="${pageContext.request.contextPath}/member_manager_insert"
								method="get">
								<div>
									<input class="btn btn-default" id="managerInsertbutton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="새관리자등록하기" />
								</div>
							</form>

							<!-- 일반회원검색 -->
							<form id="member_user_list"
								action="${pageContext.request.contextPath}/allUserList?level=일반회원"
								method="post">
								<div>
									<input class="btn btn-default" id="userlistbutton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="일반회원 리스트" />
								</div>
							</form>

							<!-- 사업자검색 -->
							<form id="member_business_list"
								action="${pageContext.request.contextPath}/allUserList?level=사업자"
								method="post">
								<div>
									<input class="btn btn-default" id="businesslistbutton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="사업자 리스트" />
								</div>
							</form>

							<!-- 관리자검색 -->
							<form id="member_manager_list"
								action="${pageContext.request.contextPath}/allUserList?level=관리자"
								method="post">
								<div>
									<input class="btn btn-default" id="managerlistbutton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="관리자 리스트" />
								</div>
							</form>

							<!-- 광고 검색 및 승인 -->
							<form id="adcontractlistFormManager"
								action="${pageContext.request.contextPath}/adContractList"
								method="get">
								<div>
									<input class="btn btn-default" id="adcontractlistButtonManager"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="광거 검색 및 승인" />
								</div>
							</form>
							
							<!-- 환불 보기-->
							<form id="reFundForm"
								action="${pageContext.request.contextPath}/selectRefund"
								method="get">
								<div>
									<input class="btn btn-default" id="reFundButton" type="button"
										 style="WIDTH: 130pt; HEIGHT: 25pt" value="환불 관리" />
								</div>
							</form>
							
							<!-- 제휴 관리 및 승인 -->
							<form id="partnerForm"
								action="${pageContext.request.contextPath}/partnerContractAllList"
								method="get">
								<div>
									<input class="btn btn-default" id="partnerButton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="제휴 관리 및 승인" />
								</div>
							</form>
							
							<!-- 사이트 접속자수 검색 -->
							<form id="guestListForm"
								action="${pageContext.request.contextPath}/guestList"
								method="get">
								<div>
									<input class="btn btn-default" id="guestListButton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="사이트 접속자수 검색" />
								</div>
							</form>
						</c:if>
						
						<c:if test="${sessionScope.level == '사업자'}">
							<!-- 사업자용 버튼 -->
							<!-- 내정보수정하기버튼 -->
							<form id="businessUpdate"
								action="${pageContext.request.contextPath}/businessUpdate?userId=${sessionScope.id}"
								method="post">
								<div>
									<input class="btn btn-default" id="businessUpdateButton"
										type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="내 정보 수정 하기" />
								</div>
							</form>

							<!-- 내 광고 보기 -->

							<form id="adContract"
								action="${pageContext.request.contextPath}/adContractList"
								method="get">

								<form id="adcontractlistForm"
									action="${pageContext.request.contextPath}/adContractList"
									method="get">

									<div>
										<input class="btn btn-default" id="adContractListButton"
											type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="내 광고 보기" />

									</div>
								</form>

								<!-- 내 제휴 보기 -->

								<form id="partnerContractListForm"
									action="${pageContext.request.contextPath}/partnerHome"
									method="get">

									<div>
										<input class="btn btn-default" id="partnerContractListButton"
											type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="내 제휴 보기" />
									</div>
								</form>
								
								<!-- 내 환불 보기-->
								<form id="reFundForm"
									action="${pageContext.request.contextPath}/selectRefund"
									method="get">
									<div>
										<input class="btn btn-default" id="reFundButton" type="button"
											 style="WIDTH: 130pt; HEIGHT: 25pt" value="나의 환불 관리" />
									</div>
								</form>

								<!-- 사이트 접속자수 검색 -->
								<form id="guestListForm"
									action="${pageContext.request.contextPath}/guestList"
									method="get">
									<div>
										<input class="btn btn-default" id="guestListButton"
											type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="사이트 접속자수 검색" />
									</div>
								</form>
							</c:if>
	
							<c:if test="${sessionScope.level == '일반회원'}">
								<!-- 일반회원용 버튼 -->
	
								<!-- 보유포인트-->
								<span id="myPointMsg"></span>
								<br>
	
								<!-- 포인트 보러 가기 -->
								<form id="myPoint"
									action="${pageContext.request.contextPath}/myPoint" method="get">
									<div>
										<input class="btn btn-default" id="myPointButton" type="button"
											 style="WIDTH: 130pt; HEIGHT: 25pt" value="내 포인트 쓰러가기" />
									</div>
								</form>
	
								<!-- 내정보수정하기버튼 -->
								<form id="userUpdate"
									action="${pageContext.request.contextPath}/userUpdate?userId=${sessionScope.id}"
									method="post">
									<div>
										<input class="btn btn-default" id="userUpdateButton"
											type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="내 정보 수정 하기" />
									</div>
								</form>
	
								<!-- 내 게시물 보기 -->
								<a class="btn btn-default" id="myModifiedFrom"
									href="./boardTagSearch?snsBoardAge=&snsBoardLoc=&snsBoardSize=&snsBoardTall=&snsBoardWeather=&userId=${sessionScope.id}">내
									게시물 보기</a>
	
								<!-- 내 친구 보기 -->
								<form id="followList"
									action="${pageContext.request.contextPath}/followList"
									method="get">
									<div>
										<input class="btn btn-default" id="followListButton"
											type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="팔로우 리스트" />
									</div>
								</form>
	
								<!-- 나를 등록한 친구목록 -->
								<form id="followMeList"
									action="${pageContext.request.contextPath}/followMeList"
									method="get">
									<div>
										<input class="btn btn-default" id="followMeListButton"
											type="button" style="WIDTH: 130pt; HEIGHT: 25pt" value="팔로워 리스트" />
									</div>
								</form>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
							<!-- 로그아웃 -->
							<form id="logoutadd" style="float:left;"
								action="${pageContext.request.contextPath}/logout" method="post">
								<input class="btn btn-default" id="logout" type="button"
									value="로그아웃" />
							</form>
			</c:if>
				
		</div>

			<%-- <c:if test="${sessionScope.level != null}">
				
			<!-- 마이페이지 드롭다운 -->
			
			</c:if> --%>

		</div>
</body>
</html>