<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>~하루룩~</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">

    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        width: 350px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
      #latlng {
        width: 225px;
      }
    </style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<link href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="resources/css/style.css?ver=2">

<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="resources/js/modernizr.js"></script>
<!-- 아이피받아오기 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>

<!-- 지오코딩다음 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41149e966427f3ed0a2d1b8fe3bcf837&libraries=services"></script>  



<script type="text/javascript">

	$(document).ready(function(){
		/* 받아온 아이피 */
		console.log(ip());
		
		/* var ipimsi = "123.123.123.123"; */

		var addr;
		var x = 37.532353;
		var y = 126.993660;
		
		/* 세션 입력 */
		sessionStorage.setItem('influx', 'haruloook');	//제휴사이트에 값 넘기기위함
		var position = sessionStorage.getItem('influx');
		console.log(position + " == 세션position");
		
		/* 현재내위치좌표 */
		navigator.geolocation.getCurrentPosition(function(position){
		    console.log('latitude: ', position.coords.latitude);
		    console.log('longitude: ', position.coords.longitude);
		    addr = position.coords.latitude;	////////////////////////나중에 주소(도)로 바꿔서 넘겨야함
		    //인트로 받은 좌표값을 문자열로 변환
		    var xC = position.coords.latitude;
		    var yC = position.coords.longitude;
		    xC += "";
		    yC += "";
		    //xy좌표가 너무 길어 문자열로 변환수 자르고 다시 인트로 변환
		    x = xC.substr(0, 9);
		    y = yC.substr(0, 10);
		    x = x*1;
		    y = y*1;
		    
		    /* 다음주소 api */
		    var geocoder = new daum.maps.services.Geocoder();
			
			var coord = new daum.maps.LatLng(x, y);
			var callback = function(result, status) {
			    if (status === daum.maps.services.Status.OK) {
			        console.log('주소 ' + result[0].address.address_name);
			        var a = result[0].address.address_name;
			        var apiAdd = a.substr(0, 2);
			        console.log('광역시와도 : ' + apiAdd);
			        
			        var request = $.ajax({	//아이디와 지역 입력
						  url: "./guestAdd", //호출 경로
						  method: "POST",	//전송방식
						  data: { 'ip' : ip(), 'apiAdd' : apiAdd }, //전송해줄값	///////////////////////////////////////////////////아이피 수정시 ipimsi수정
						  dataType: "text" //결과값 타입 (리턴)
					});
				
					$('#snsInsertButton').click(function(){	//sns게시물등록하기
						$('#snsInsertForm').submit();
			        });
			     }
		    /* 다음주소 api */    
			};

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);	
	    });	
		
		
		console.log('x 자른좌표 :  ' + x);
	    console.log('y 자른좌표 :  ' + y);	
	    //서버오류로 다음api가 실행 안될때 받는 임시 서울 주소
		/* 다음주소 api */
	    var geocoder = new daum.maps.services.Geocoder();
		
		var coord = new daum.maps.LatLng(x, y);
		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        console.log('주소 ' + result[0].address.address_name);
		        var a = result[0].address.address_name;
		        var apiAdd = a.substr(0, 2);
		        console.log('광역시와도 : ' + apiAdd);
		        
		        var request = $.ajax({	//아이디와 지역 입력
					  url: "./guestAdd", //호출 경로
					  method: "POST",	//전송방식
					  data: { 'ip' : ip(), 'apiAdd' : apiAdd }, //전송해줄값  ///////////////////////////////////////////////////아이피 수정시 ipimsi수정
					  dataType: "text" //결과값 타입 (리턴)
				});
			
				$('#snsInsertButton').click(function(){	//sns게시물등록하기
					$('#snsInsertForm').submit();
		        });
		     }
	    /* 다음주소 api */    
		};

		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		
		console.log('window width : ',$(window).width()/5);
	});   
   
</script>


</head>
<body>
	<div class="row">
	    <!-- 상단 인클루드 -->
	    <c:import url="./module/header.jsp"></c:import>
	</div>
	<!-- 바디 인클루드 -->

	<div class="row">
		<div class="col-xs-1">
   		<!-- 좌측 베너 인클루드 -->
    	</div>

   		<div class="col-xs-9">
   		
   			<!-- 게시물검색 -->
   			<c:import url="/WEB-INF/views/sns/board/sns_board_search.jsp"></c:import>
           	<!-- 인기게시물 -->
           	<c:import url="/boardPopList"></c:import>
           	<!-- 최근게시물 -->
           	<c:import url="/boardList"></c:import>
   		</div>
   		<!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="./module/right.jsp"></c:import>
       	</div>
	</div>
	
    <!-- 하단 인클루드 -->
    <c:import url="./module/footer.jsp"></c:import>
</body>
</html>
