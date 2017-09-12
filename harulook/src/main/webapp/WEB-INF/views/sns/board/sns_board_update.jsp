<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>~하루룩~</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* 색상별 토글 버튼  */
function toggleColor(color) { //color: 선택한 색상
	
	// 해당되는 색상 체크박스가 체크되지 않았을 때
	if($('#searchColor'+color+'').is(':checked') == false) { 
		$('input:checkbox[id="searchColor'+color+'"]').prop('checked',true);	// 체크박스 체크
		$('#circle'+color+'').attr('class','fa fa-check-circle cursor-click');				// 색상 버튼 체크 상태 그림으로 
		console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
		
	// 해당되는 색상 체크박스가 이미 체크되었을 때
	} else if($('#searchColor'+color+'').is(':checked') == true) {
		$('input:checkbox[id="searchColor'+color+'"]').prop('checked',false);	// 체크박스 체크 해제
		$('#circle'+color+'').attr('class','fa fa-circle cursor-click');						// 색상 버튼 체크 해제 상태 그림으로 
		console.log('searchColor'+color+' check : ',$('#searchColor'+color+'').is(':checked'));
	}
} 

$(function(){
	//내용 입력 여부 검사
	$('#snsBoardContent').change(function(){
		if($('#snsBoardContent').val() == '') { 
			$('#contentFail').show();
			$('#snsBoardContent').focus();
		return false;
		}else{
			$('#contentFail').hide();
		}
	});
	
	// 게시물 등록버튼 클릭
	$('#addButton').click(function(){	
		
		if(!$('#snsBoardContent').val()){	//사진 업로드 안했을때
			alert('내용을 입력해주세요.');
			$('#snsBoardContent').focus();
			return false;
		}else{
			$('#updateForm').submit();
		}
    });
	
	/* 색상 체크 판별 */
	if($('input:checkbox[id="searchColorRed"]').is(":checked")) {
		$('#circleRed').attr('class','fa fa-check-circle');
	} 
	if($('input:checkbox[id="searchColorOrange"]').is(":checked")) {
		$('#circleOrange').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorYellow"]').is(":checked")) {
		$('#circleYellow').attr('class','fa fa-check-circle');
	} 
	if($('input:checkbox[id="searchColorGreen"]').is(":checked")) {
		$('#circleGreen').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorBlue"]').is(":checked")) {
		$('#circleBlue').attr('class','fa fa-check-circle');
	} 
	if($('input:checkbox[id="searchColorNavy"]').is(":checked")) {
		$('#circleNavy').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorPurple"]').is(":checked")) {
		$('#circlePurple').attr('class','fa fa-check-circle');
	} 
	if($('input:checkbox[id="searchColorBlack"]').is(":checked")) {
		$('#circleBlack').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorGrey"]').is(":checked")) {
		$('#circleGrey').attr('class','fa fa-check-circle');
	} 
	if($('input:checkbox[id="searchColorWhite"]').is(":checked")) {
		$('#circleWhite').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorBrown"]').is(":checked")) {
		$('#circleBrown').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorBeige"]').is(":checked")) {
		$('#circleBeige').attr('class','fa fa-check-circle');
	}
	if($('input:checkbox[id="searchColorPink"]').is(":checked")) {
		$('#circlePink').attr('class','fa fa-check-circle');
	}
	
	// 빨간색 버튼 클릭
	$('#circleRed').click(function(){
		toggleColor('Red');
	});
	
	// 주황색 버튼 클릭
	$('#circleOrange').click(function(){
		toggleColor('Orange');
	});
	
	// 노란색 버튼 클릭
	$('#circleYellow').click(function(){
		toggleColor('Yellow');
	});
	
	// 초록색 버튼 클릭
	$('#circleGreen').click(function(){
		toggleColor('Green');
	});
	
	// 파란색 버튼 클릭
	$('#circleBlue').click(function(){
		toggleColor('Blue');
	});
	
	// 남색 버튼 클릭
	$('#circleNavy').click(function(){
		toggleColor('Navy');
	});
	
	// 보라색 버튼 클릭
	$('#circlePurple').click(function(){
		toggleColor('Purple');
	});
	
	// 검정색 버튼 클릭
	$('#circleBlack').click(function(){
		toggleColor('Black');
	});
	
	// 회색 버튼 클릭
	$('#circleGrey').click(function(){
		toggleColor('Grey');
	});
	
	// 흰색 버튼 클릭
	$('#circleWhite').click(function(){
		toggleColor('White');
	});
	
	// 갈색 버튼 클릭
	$('#circleBrown').click(function(){
		toggleColor('Brown');
	});
	
	// 베이지색 버튼 클릭
	$('#circleBeige').click(function(){
		toggleColor('Beige');
	});
	
	// 분홍색 버튼 클릭
	$('#circlePink').click(function(){
		toggleColor('Pink');
	});
});
</script>
</head>
<body>
	<div class="row">
	    <!-- 상단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
	</div>
	
	<div class="row">
   		<!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-1">
    		<c:import url="/WEB-INF/views/module/left.jsp"></c:import>
    	</div>
   	
   		<div class="col-xs-1"></div>
    	<div class="col-xs-8">
			<form id="UdpateForm" class="form-horizontal" action="${pageContext.request.contextPath}/boardUpdate" method="post">
				<input type="hidden" name="snsBoardNo" value="${board.snsBoardNo}">
				<div class="form-group">
		            <label class="col-xs-2 control-label" for="uploadFile">사진 </label>
			        <div class="col-xs-7">
			            <img class="img-responsive" alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${board.snsBoardImg}">
		            </div>
		        </div>
				<div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardContent">내용 </label>
		            <div class="col-xs-7">
			            <textarea class="form-control" name="snsBoardContent" id="snsBoardContent">${board.snsBoardContent}</textarea>
			            <span id="contentFail" >내용을 입력해주세요.</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardLoc">지역 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardLoc" id="snsBoardLoc">
			            	<option>${board.snsBoardLoc}</option>
			            	<option>서울</option>
			            	<option>부산</option>
			            	<option>울산</option>
			            	<option>대구</option>
			            	<option>인천</option>
			            	<option>대전</option>
			            	<option>광주</option>
			            	<option>제주</option>
			            	<option>세종</option>
			            	<option>경기</option>
			            	<option>강원</option>
			            	<option>충북</option>
			            	<option>충남</option>
			            	<option>경북</option>
			            	<option>경남</option>
			            	<option>전북</option>
			            	<option>전남</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardWeather">날씨 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardWeather" id="snsBoardWeather">
			            	<option>${board.snsBoardWeather}</option>
			            	<option>맑음</option>
			            	<option>구름조금</option>
			            	<option>흐림</option>
			            	<option>비</option>
			            	<option>눈</option>
			            </select>
	            	</div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardTall">키 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardTall" id="snsBoardTall">
			            	<option>${board.snsBoardTall}</option>
			            	<option>큰키</option>
			            	<option>보통키</option>
			            	<option>작은키</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardSize">체형 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardSize" id="snsBoardSize">
			            	<option>${board.snsBoardSize}</option>
			            	<option>마른</option>
			            	<option>보통</option>
			            	<option>뚱뚱</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardGender">성별 </label>
		            <div class="col-xs-7">
		            <c:choose>
		            	<c:when test="${board.snsBoardGender == '남'}">
		            		<input name="snsBoardGender" id="snsBoardGender" type="radio" value="남" checked="checked">남
		            		<input name="snsBoardGender" id="snsBoardGender" type="radio" value="여">여
		            	</c:when>
		            	<c:otherwise>
		            		<input name="snsBoardGender" id="snsBoardGender" type="radio" value="여" checked="checked">여
		            		<input name="snsBoardGender" id="snsBoardGender" type="radio" value="남">남
		            	</c:otherwise>
		            </c:choose>
			        </div>
		        </div>
		        <div class="form-group">
		            <label class="col-xs-2 control-label" for="snsBoardAge">연령대 </label>
		            <div class="col-xs-7">
			            <select class="form-control" name="snsBoardAge" id="snsBoardAge">
			            	<option>${board.snsBoardAge}</option>
			            	<option>10</option>
			            	<option>20</option>
			            	<option>30</option>
			            	<option>40</option>
			            	<option>50</option>
			            </select>
		            </div>
		        </div>
		        <div class="form-group">
					<label class="col-xs-2 control-label" for="searchSnsBoardStyle">스타일 </label>
					<div class="col-xs-7">
					<table>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('클래식')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_01" checked="checked">클래식
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_01">클래식
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('캐쥬얼')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_02" checked="checked">캐쥬얼
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_02">캐쥬얼
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('빈티지')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_03" checked="checked">빈티지
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_03">빈티지
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('스트릿')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_04" checked="checked">스트리트
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_04">스트리트
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('댄디')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_05" checked="checked">댄디
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_05">댄디
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('럭셔리')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_06" checked="checked">럭셔리
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_06">럭셔리
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('러블리')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_07" checked="checked">러블리
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_07">러블리
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('로맨틱')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_08" checked="checked">로맨틱
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_08">로맨틱
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('심플')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_09" checked="checked">심플
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_09">심플
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsStyle.contains('액티브')}">
										<input type="checkbox" id="styleValue" name="styleValue" value="style_10" checked="checked">액티브
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="styleValue" name="styleValue" value="style_10">액티브
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
					</div>
				</div>
				<div class="form-group">
			       	<label class="col-xs-2 control-label" for="searchSnsBoardColor">색상 </label>
			       	<div class="col-xs-7">
				       	<i id="circleRed" class="fa fa-circle cursor-click" title="빨강" style="font-size: 24px; color: red; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleOrange" class="fa fa-circle cursor-click" title="주황" style="font-size: 24px; color: orange; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleYellow" class="fa fa-circle cursor-click" title="노랑" style="font-size: 24px; color: yellow; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleGreen" class="fa fa-circle cursor-click" title="초록" style="font-size: 24px; color: green; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleBlue" class="fa fa-circle cursor-click" title="파랑" style="font-size: 24px; color: deepskyblue; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleNavy" class="fa fa-circle cursor-click" title="남색(네이비)" style="font-size: 28px; color: navy;"></i>
				     	<i id="circlePurple" class="fa fa-circle cursor-click" title="보라" style="font-size: 28px; color: purple;"></i>
				     	<i id="circleBlack" class="fa fa-circle cursor-click" title="검정" style="font-size: 28px; color: black;"></i>
				     	<i id="circleGrey" class="fa fa-circle cursor-click" title="회색" style="font-size: 24px; color: grey; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleWhite" class="fa fa-circle cursor-click" title="흰색" style="font-size: 24px; color: white; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleBrown" class="fa fa-circle cursor-click" title="갈색" style="font-size: 24px; color: brown; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circleBeige" class="fa fa-circle cursor-click" title="베이지" style="font-size: 24px; color: beige; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	<i id="circlePink" class="fa fa-circle cursor-click" title="분홍" style="font-size: 24px; color: pink; background-color: black; border-radius: 47%; width: 22px;"></i>
				     	
				     	<div style="display:none;">
				     		<c:choose>
							<c:when test="${snsColor.contains('빨강')}">
								<input type="checkbox" id="searchColorRed" name="colorValue" value="color_01" checked="checked">빨강
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorRed" name="colorValue" value="color_01">빨강
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('주황')}">
								<input type="checkbox" id="searchColorOrange" name="colorValue" value="color_02" checked="checked">주황
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorOrange" name="colorValue" value="color_02">주황
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('노랑')}">
								<input type="checkbox" id="searchColorYellow" name="colorValue" value="color_03" checked="checked">노랑
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorYellow" name="colorValue" value="color_03">노랑
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('초록')}">
								<input type="checkbox" id="searchColorGreen" name="colorValue" value="color_04" checked="checked">초록
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorGreen" name="colorValue" value="color_04">초록
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('파랑')}">
								<input type="checkbox" id="searchColorBlue" name="colorValue" value="color_05" checked="checked">파랑
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorBlue" name="colorValue" value="color_05">파랑
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('남색')}">
								<input type="checkbox" id="searchColorNavy" name="colorValue" value="color_06" checked="checked">남색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorNavy" name="colorValue" value="color_06">남색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('보라')}">
								<input type="checkbox" id="searchColorPurple" name="colorValue" value="color_07" checked="checked">보라
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorPurple" name="colorValue" value="color_07">보라
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('검정')}">
								<input type="checkbox" id="searchColorBlack" name="colorValue" value="color_08" checked="checked">검정
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorBlack" name="colorValue" value="color_08">검정
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('회색')}">
								<input type="checkbox" id="searchColorGrey" name="colorValue" value="color_09" checked="checked">회색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorGrey" name="colorValue" value="color_09">회색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('흰색')}">
								<input type="checkbox" id="searchColorWhite" name="colorValue" value="color_10" checked="checked">흰색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorWhite" name="colorValue" value="color_10">흰색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('갈색')}">
								<input type="checkbox" id="searchColorBrown" name="colorValue" value="color_11" checked="checked">갈색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorBrown" name="colorValue" value="color_11">갈색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('베이지')}">
								<input type="checkbox" id="searchColorBeige" name="colorValue" value="color_12" checked="checked">베이지
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorBeige" name="colorValue" value="color_12">베이지
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('분홍')}">
								<input type="checkbox" id="searchColorPink" name="colorValue" value="color_13" checked="checked">분홍
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="searchColorPink" name="colorValue" value="color_13">분홍
							</c:otherwise>
						</c:choose>
				     	</div>
			     	</div>
			     </div>
			     <div class="form-group">
			       	<label class="col-xs-2 control-label" for="searchSnsBoardSituation">상황 </label>
			       	<div class="col-xs-7">
			       	<table>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('학교')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_01" checked="checked">학교
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_01">학교
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('출근')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_02" checked="checked">출근
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_02">출근
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('파티')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_03" checked="checked">파티
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_03">파티
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('여행')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_04" checked="checked">여행
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_04">여행
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('운동')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_05" checked="checked">운동
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_05">운동
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('나들이')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_06" checked="checked">나들이
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_06">나들이
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${snsSituation.contains('하객')}">
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_07" checked="checked">하객
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="situationValue" name="situationValue" value="situation_07">하객
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
					</div>
			     </div>
			     <div style="text-align: center;">
			    	<input class="btn btn-default" type="submit" value="수정">
			    	<a class="btn btn-default" href="${pageContext.request.contextPath}/home">취소</a>
		    	 </div>
		    	 
		    </form>
	    </div>
    <!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
       </div>
<br><br>
    <div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
</body>
</html>