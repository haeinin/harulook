<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<title>광고리스트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<link href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/adBoardDetail.js"></script>
<script>

$(document).ready(function(){
	$('.adBoards').click(function(){
		var index = $('.adBoards').index(this);
		var adBoardNo = adBoardNoVal[index].value;
		console.log('index : ',index);
		console.log('data[',index,'].adBoardNo : ',adBoardNo,'');
		
		
 		var boardDetailRequest = $.ajax({
			url : './adBoardDetail',
			method : 'get',
			data :{'adBoardNo' : adBoardNo},
			datatype : 'json',
			success : function(msg) {
				adBoardDetail(msg);
				$('#adModal').modal(); 
			}
		});
		
	});
});
</script>

</head>
<body>			        	
            <h3>광고 게시물</h3>
        	
            <!-- The following HTML will be our template inside instafeed -->
			<div id="adBoardOutput" class="row photos-wrap"  style="text-align: center;">
			<c:forEach var="b" items="${adboardlist}" begin="0" end="2" step="1">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >
				<div class="ad-pop-photo-box cursor-click"><!-- 모달 클릭 클래스네임 -->
					<input type="hidden" id="adBoardNoVal" value="${b.adBoardNo}">
					<div class="image-wrap" style="float: left; margin: 5px; overflow: hidden;">
					<c:choose>
						   <c:when test="${b.adBoardNo == null}"><img class="adBoards" style="display: inline-block; width: 100%; min-height: 100%;" alt="no image" onError="this.src='resources/files/images/noAD.png';" src="this.src='resources/files/images/defaut.jpg';"> </c:when>
						   <c:otherwise><img class="adBoards" style="height: auto; max-width: 100%; max-height: 100%; width: auto;" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${b.adBoardImg}"></c:otherwise>
							</c:choose>
					</div>
				</div>
			</div>
			</c:forEach>
			</div>
			<!-- 광고 게시물 상세보기 모달 -->
		<div class="modal fade" id="adModal" role="dialog">
		    <div id="modalFrame" class="modal-dialog modal-lg" >
				<div id="adDetail" class="modal-content">
			        <div class="row">
			        	<div class="col-sm-8">
			        	<!-- 광고 메인 이미지 영역 -->
				        <div class="modal-body" style="padding-bottom: 0; padding-top: 0;">
							<div id="adMainImg"></div>
			        	</div>
			        	</div>
			        	<!-- 광고 메인 이미지 영역 -->
			        	<div class="col-xs-4">
			        	<!-- 광고 상세 상품 내용 영역 -->
				        <div id="adDetailContent">
						</div>
						</div>
						<!-- 강고 상세 상품 내용 영역 -->
				     </div>
				</div>
			</div>
		</div>
	<!-- 광고 게시물 상세보기 모달 -->
	
</body>
</html>