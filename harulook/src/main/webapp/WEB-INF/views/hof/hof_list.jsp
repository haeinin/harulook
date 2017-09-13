<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- 드롭박스 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- 주소 api -->
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- 유효성검사 -->
<!-- <script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<link rel="stylesheet"
	href="<c:url value="resources/css/cartoony-weather.css?ver=1" />"
	type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lato:400,700|Kaushan+Script|Montserrat'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<!-- w3아이콘  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="resources/js/modernizr.js"></script>
<!-- 댓글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="resources/js/boardDetail.js"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>
<style>
h4{
font-style:italic;
}
.container{
margin:50px;
}
.p-text{
margin-top:100px;
margin-bottom:100px;
}
</style>
<script type="text/javascript">
/*  게시물 클릭  */
function showDetail(data) {
	$('.sns-photo-box').click(function(){
		var index = $('.sns-photo-box').index(this);
		if(data != null) {
			var boardNo = data[index].snsBoardNo;
		} else {
			var boardNo = $(this).children().eq(0).val();
		}
		
		console.log('index : ',index);
		console.log('data[',index,'].snsBoardNo : ',boardNo,'');
		
		
		var boardDetailRequest = $.ajax({
			url : './boardDetail',
			method : 'get',
			data :{'boardNo' : boardNo},
			datatype : 'json',
			success : function(msg) {
				boardDetail(msg);
				followCheck(msg);
			}
		});
		$('#snsModal').modal();
	});
}

$(function(){
	showDetail(null);
});
</script>
</head>
<body>

<%-- <table>
					<tr>
						<td>월</td>
						<td>랭크</td>
						<td>게시물번호</td>
						<td>사진</td>
					</tr>
				<c:forEach var="b" items="${list}" >
					<tr>
						<td>${b.hofMonth}월</td>
						<td>${b.hofRank}</td>
						<td><a href="${pageContext.request.contextPath}/boardDetail?boardNo=${b.boardNo}">${b.boardNo}</a></td>
						<td><img src="${b.boardImg}">${b.boardImg}</td>
					</tr>
				</c:forEach>
</table> --%>
  	<div class="row">
		<!-- 해더인클루드 -->
		<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
    
    <!-- 바디 인클루드 -->
    <div class="row" >

	    <div class="col-xs-2"></div>

	    <div class="col-xs-9">
	    <div class="row">
	    <div class="col-md-2"></div>
	    <div class="col-md-6" >
	   
	    <img src="resources/hofmain.png">
	    <div class="p-text">
	    <h4>매 월 1일 마다 가장 많은 예뻐요를 받은 사진이 명예의 전당에 선정됩니다</h4>
	    <br>
	    <p>1등 : 10000 포인트 지급 </p>
	    <p>2등 : 7000 포인트 지급</p>
	    <p>3등 : 5000 포인트 지급</p>
	    <hr>
	    </div>
	    
	    
	    <c:forEach var="b" items="${list}" >
			<%-- <h3><img src="resources/medal${b.hofRank}.jpg"></h3> --%>
				<table style="background:white;">

				
				<%-- <input type="hidden" class="boardNumber" value="${b.boardNo}"> --%>
					<tr><td><img src="resources/medal${b.hofRank}.jpg"></td></tr>
					
					<tr>
						<td>
							<div class="sns-photo-box">
								<input type="hidden" id="boardNo" value="${b.boardNo}">
								<div class="image-wrap">
									<img style="height: auto; max-width: 300px; max-height: 300px; width: auto;" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${b.boardImg}">
								</div>
							</div>
						</td>
					</tr>

				
				</table>

		
			</c:forEach>
		</div>
		 </div>
	    </div>
	</div>

	<div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
		<!-- sns 게시물 상세보기 모달 -->
		<div class="modal fade" id="snsModal" role="dialog">
		    <div id="modalFrame" class="modal-dialog modal-lg" >
				<div id="snsDetail" class="modal-content">
			        <div class="row">
			        
			        	<!-- 게시물 이미지 영역 -->
				        <div id="snsDetailImgArea" class="modal-body col-xs-12 col-sm-6" style="padding-bottom: 0; padding-top: 0;">
							<div id="snsDetailImg"></div>
			        	</div>
			        	<!-- 게시물 이미지 영역 -->
			        	
			        	<!-- 게시물 내용 영역 -->
				        <div id="contentArea" class="modal-body col-xs-12 col-sm-6">
				        	<input type="hidden" id="sessionUserLevel" value="${sessionScope.level}">
			        		<div id="snsDetailContent"></div>
			        		<hr>
			        	
				        	<div id="snsDetailLike"></div>
				        	<hr>
				        	<div id="snsDetailComment"></div>
				        	<c:if test="${sessionScope.id != null}">
				        	<input type="hidden" id="sessionUserId" value="${sessionScope.id}">
				        	<div id="snsDetailCommentControll">
				        	</div>
				        	</c:if>
						</div>
						<!-- 게시물 내용 영역 -->
						
				     </div>
				</div>
			</div>
		</div>
		<!-- sns 게시물 상세보기 모달 -->

</body>
</html>