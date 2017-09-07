<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- 예뻐요 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/boardDetail.js?ver=1"></script>
<script type="text/javascript" src="resources/js/followCheck.js"></script>

<style>
.container{
margin:50px;
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
  <!-- 상단 인클루드 -->
    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    
    <!-- 바디 인클루드 -->
    <div class="row">

	    <div class="col-xs-2"></div>

	    <div class="col-xs-9">
	    <c:forEach var="b" items="${list}" >
	    
	    <c:if test="${b.hofRank} == 3">
	    <div class="row"></div>
	    </c:if>
			<h3>${b.hofRank}등</h3>
				<table>

				
				<%-- <input type="hidden" class="boardNumber" value="${b.boardNo}"> --%>
					
						
					
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