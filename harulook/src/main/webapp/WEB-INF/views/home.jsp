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
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- 모달을 쓰기위한 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="resources/js/modernizr.js"></script>

<!-- 아이피받아오기 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>

<!-- 지오코딩구글 -->
<!-- <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGmPrfFYkGiCQuX3VZJ9hpMAf00Phfgog&callback=initMap">
    </script> -->
<!-- 지오코딩다음 -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41149e966427f3ed0a2d1b8fe3bcf837"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41149e966427f3ed0a2d1b8fe3bcf837&libraries=services"></script>  --> 

<script type="text/javascript">

	$(document).ready(function(){
		/* 받아온 아이피 */
		console.log(ip());
		var addr;
		var x = 0;
		var y = 0;
		/* 세션 입력 */
		sessionStorage.setItem('influx', 'haruloook');	//제휴사이트에 값 넘기기위함
		var position = sessionStorage.getItem('influx');
		console.log(position + " == 세션position");
		
		/* function ipv(){
		  return -1 !=ip().indexOf(":")?6:4
		}
		alert(ip);
		console.log(ip); */
		
		/* 현재내위치좌표 */
		navigator.geolocation.getCurrentPosition(function(position){
	    console.log('latitude: ', position.coords.latitude);
	    console.log('longitude: ', position.coords.longitude);
	    addr = position.coords.latitude;	////////////////////////나중에 주소(도)로 바꿔서 넘겨야함
	    
	    x = position.coords.latitude;
	    y = position.coords.longitude;
	    });
		
		var request = $.ajax({
			  url: "./guestAdd", //호출 경로
			  method: "POST",	//전송방식
			  data: { 'ip' : ip() }, //전송해줄값
			  dataType: "text" //결과값 타입 (리턴)
		});
	
		
	//구글////////////////////////////////////////////////////////////////////////////////////////////
	 /* function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: 35.836895, lng: 127.131554}
        });
        var geocoder = new google.maps.Geocoder;
        var infowindow = new google.maps.InfoWindow;

        document.getElementById('submit').addEventListener('click', function() {
          geocodeLatLng(geocoder, map, infowindow);
        });
      }

      function geocodeLatLng(geocoder, map, infowindow) {
        var input = document.getElementById('latlng').value;
        var latlngStr = input.split(',', 2);
        var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
        geocoder.geocode({'location': latlng}, function(results, status) {
          if (status === 'OK') {
            if (results[1]) {
              map.setZoom(11);
              var marker = new google.maps.Marker({
                position: latlng,
                map: map
              });
              infowindow.setContent(results[1].formatted_address);
              infowindow.open(map, marker);
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
      }  */
//////다음////////////////////////////////////////////////////////////////////////////////////////
		
		/* var geocoder = new daum.maps.services.Geocoder();

		var coord = new daum.maps.LatLng(35.836787, 127.13120959999999);
		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {

		        console.log('지역 명칭 : ' + result[0].address_name);
		        console.log('행정구역 코드 : ' + result[0].code);
		    }
		};

		geocoder.coord2RegionCode(coord, callback); */
		/* geocoder.coord2addr(coord, callback); */
		$('#snsInsertButton').click(function(){	//sns게시물등록하기
			$('#snsInsertForm').submit();
        });
	
	});   
   
</script>


</head>
<body>
    <!-- 상단 인클루드 -->
    <c:import url="./module/header.jsp"></c:import>
  	  
    
    <!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    		<c:import url="./module/left.jsp"></c:import>
    	
    	<div class="col-xs-9">
        	<div class="container">
            	<c:import url="/boardPopList"></c:import>
            	<c:import url="/boardList"></c:import>
            </div>
        </div>	
            	
        
        
            <!-- 우측 베너 인클루드 -->
    		<c:import url="./module/right.jsp"></c:import>
       
	</div>
    <!-- 하단 인클루드 -->
    <c:import url="./module/footer.jsp"></c:import>
    

</body>
</html>
