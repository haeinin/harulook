<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOARD LIST(spring mvc + mybatis 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	/* 게시글 검색 (ajax - searchCategory 클래스에 변화가 발생할 때) */
	$('.searchCategory').change(function(){
		
		var colorValue=[], styleValue=[], situationValue=[];
		
		$(":checkbox[name='colorValue']:checked").each(function(i){
			colorValue.push($(this).val());
		  });
		
		$(":checkbox[name='styleValue']:checked").each(function(i){
			styleValue.push($(this).val());
		  });
		
		$(":checkbox[name='situationValue']:checked").each(function(i){
			situationValue.push($(this).val());
		  });
		
		console.log('colorValue : ',colorValue);
		console.log('styleValue : ',styleValue);
		console.log('situationValue : ',situationValue);
		
		$.ajaxSettings.traditional = true; //배열 형태로 서버쪽 전송을 위한 설정
		
		$.ajax({
			url : './boardSearchList',
			method : 'get',
			data : { 'snsBoardWeather'	: $('#snsBoardWeather').val()
					,'snsBoardTall'		: $('#snsBoardTall').val()
					,'snsBoardSize'		: $('#snsBoardSize').val()
					,'snsBoardLoc'		: $('#snsBoardLoc').val()
					,'snsBoardGender'	: $(":input:radio[name=snsBoardGender]:checked").val()
					,'snsBoardAge'		: $('#snsBoardAge').val()
 					,'colorValue'		: colorValue
 					,'styleValue'		: styleValue
 					,'situationValue'	: situationValue
					},
			datatype : 'json',
			success : function(data){
				console.log(data);
				var boardHtml = '';
				if(data.length > 0) {
					for(var i=0; i<data.length; i++) {
						boardHtml += '<a href="${pageContext.request.contextPath}/boardDetail?boardNo='+data[i].snsBoardNo+'">';
						boardHtml += '<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">';
						boardHtml += '<div class="photo-box">';
						boardHtml += '<div class="image-wrap">';
						boardHtml += '<img alt="no image" src="'+data[i].snsBoardImg+'">';
						boardHtml += '<div class="likes">';
						boardHtml += '<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>';
						boardHtml += '<span class="center">&nbsp;'+data[i].snsLikeCount+'&nbsp;&nbsp;&nbsp;</span>';
						boardHtml += '<i class="fa fa-commenting center" style="font-size:24px"></i>';
						boardHtml += '<span class="center">&nbsp;'+data[i].snsCommentCount+'</span>';
						boardHtml += '</div>';
						boardHtml += '</div>';
						boardHtml += '<div class="description">';
						boardHtml += '<div class="date">'+data[i].snsBoardDate+'</div>';
						boardHtml += '</div>';
						boardHtml += '</div>';
						boardHtml += '</div>';
						boardHtml += '</a>';
					}
				} else {
					boardHtml += '<span>일치하는 결과가 없습니다.</span>';
				}	
				$('#boardOutput').html(boardHtml);
				
				/* 게시글 추천수, 댓글수 보이기 및 감추기 ***************/
				
				$('.likes').hide();	// 게시글 추천수, 댓글 수 감추기
				$('.photo-box').mouseenter(function(){
					$(this).find('.likes').show();
				});
				$('.photo-box').mouseleave(function(){
					$(this).find('.likes').hide();
				});
			}
		});
	});
});
</script>
</head>
<body>
<c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    <section class="instagram-wrap">
sns 게시물 목록
	<div>현재 페이지 : ${currentPage}</div>
		<div class="container">
			<div class="searchGroup">
			    <label for="snsBoardWeather">날씨 :</label>
			    <select class="searchCategory" name="snsBoardWeather" id="snsBoardWeather">
			    	<option></option>
			    	<option>맑음</option>
			    	<option>구름조금</option>
				   	<option>흐림</option>
			    	<option>비</option>
			    	<option>눈</option>
			    </select>
			    
			    <label for="snsBoardTall">키 :</label>
			    <select class="searchCategory" name="snsBoardTall" id="snsBoardTall">
			    	<option></option>
			    	<option>큰키</option>
			    	<option>보통키</option>
			    	<option>작은키</option>
			    </select>
			    
			    <label for="snsBoardSize">체형 :</label>
			    <select class="searchCategory" name="snsBoardSize" id="snsBoardSize">
			    	<option></option>
			    	<option>마른</option>
			    	<option>보통</option>
			    	<option>뚱뚱</option>
			    </select>
			
			    <label for="snsBoardLoc">지역 :</label>
			    <select class="searchCategory" name="snsBoardLoc" id="snsBoardLoc">
			    	<option></option>
			    	<option>서울</option>
			    	<option>경기</option>
			    	<option>강원</option>
			    	<option>충남</option>
			    	<option>충북</option>
			    	<option>전북</option>
			    	<option>전남</option>
			    	<option>경북</option>
			    	<option>경남</option>
			    	<option>제주</option>
			    	<option>세종</option>
			    </select>
			
			    <label for="snsBoardGender">성별 :</label>
			    <input class="searchCategory" name="snsBoardGender" id="snsBoardGender" type="radio" value="여">여
			    <input class="searchCategory" name="snsBoardGender" id="snsBoardGender" type="radio" value="남">남
			    
			
			    <label for="snsBoardAge">나이 :</label>
			    <select class="searchCategory" name="snsBoardAge" id="snsBoardAge">
			    	<option></option>
			    	<option>10</option>
			    	<option>20</option>
			    	<option>30</option>
			    	<option>40</option>
			    	<option>50</option>
			    </select>
			</div>
				<div class="form-group">
					<label for="searchSnsBoardStyle">스타일 :</label>		
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_01">클래식
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_02">캐쥬얼
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_03">빈티지
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_04">스트리트
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_05">댄디
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_06">럭셔리
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_07">러블리
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_08">로맨틱
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_09">심플
					<input class="searchCategory" type="checkbox" id="searchSnsBoardStyle" name="styleValue" value="style_10">액티브
				</div>
			<div class="form-group">
			      	<label for="searchSnsBoardColor">색상 :</label>
			     	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_01">빨강
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_02">주황
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_03">노랑
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_04">초록
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_05">파랑
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_06">남색
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_07">보라
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_08">검정
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_09">회색
			    	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_10">흰색
			    	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_11">갈색
			    	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_12">베이지
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardColor" name="colorValue" value="color_13">핑크       	
			    </div>
			    <div class="form-group">
			      	<label class="searchCategory" for="searchSnsBoardSituation">상황 :</label>
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_01">학교
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_02">출근
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_03">파티
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_04">여행
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_05">운동
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_06">나들이
			      	<input class="searchCategory" type="checkbox" id="searchSnsBoardSituation" name="situationValue" value="situation_07">하객    	
			    </div>
			    <button type="button" id="searchBtn">검색</button>
       
            <div class="row">
                <div class="col-xs-12">
                    <div class="instagram-content">
                        <h3>Latest Photos</h3>
                        <!-- The following HTML will be our template inside instafeed -->
						<div id="boardOutput" class="row photos-wrap"  style="text-align: center;"></div>
                    </div>
                </div>
            </div>
        </div>
<%-- 	    <table class="table table-striped">
	        <thead>
	            <tr>
	                <th>snsBoardNo</th>
	                <th>snsBoardImg</th>
	                <th>댓글수</th>
	                <th>추천수</th>
	                <th>snsBoardDate</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="b" items="${list}">
	                <tr>
	                    <td>${b.snsBoardNo}</td>
	                    <td><a href="${pageContext.request.contextPath}/boardDetail?boardNo=${b.snsBoardNo}"><img alt="no image" src="${b.snsBoardImg}"  width="200px" height="200px"></a></td>
	                    <td>${b.snsCommentCount}</td>
	                    <td>${b.snsLikeCount}</td>
	                    <td>${b.snsBoardDate}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    <ul class="pager">
	        <c:if test="${currentPage > 1}">
	            <li class="previous"><a href="${pageContext.request.contextPath}/boardList?currentPage=${currentPage-1}">이전</a></li>
	        </c:if>
	        <c:if test="${currentPage < lastPage+1}">
	            <li class="next"><a href="${pageContext.request.contextPath}/boardList?currentPage=${currentPage+1}">다음</a></li>
	        </c:if>
    	</ul> --%>
	    <div>
	        <a class="btn btn-default" href="${pageContext.request.contextPath}/boardInsert">게시글 입력</a>
	    </div>
	</section>
</body>
</html>