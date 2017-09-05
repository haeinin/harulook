<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
   	
    	<div class="col-xs-9">
게시물 수정 화면
	<form id="UdpateForm" action="${pageContext.request.contextPath}/boardUpdate" method="post">
		<input type="hidden" name="snsBoardNo" value="${board.snsBoardNo}">
		<table class="table">
			<tbody>
            	<tr>
             		<td>이미지 :</td>
	                <td>
						<img alt="no image" onError="this.src='resources/files/images/defaut.jpg';" src="${board.snsBoardImg}">
					</td>
	            </tr>
            	<tr>
					<td>내용 :</td>
					<td>
						<input class="form-control" name="snsBoardContent" id="snsBoardContent" type="text" value="${board.snsBoardContent}"/>
					</td>
            	</tr>
            	<tr>
					<td>날씨 :</td>
                  	<td>
						<select class="form-control" name="snsBoardWeather" id="snsBoardWeather">
							<option>${board.snsBoardWeather}</option>
			            	<option></option>
			            	<option>맑음</option>
			            	<option>구름조금</option>
			            	<option>흐림</option>
			            	<option>비</option>
			            	<option>눈</option>
			            </select>
					</td>
	            </tr>
	            <tr>
					<td>키 :</td>
					<td>
						<select class="form-control" name="snsBoardTall" id="snsBoardTall">
						<option>${board.snsBoardTall}</option>
		            	<option></option>
		            	<option>큰키</option>
		            	<option>보통키</option>
		            	<option>작은키</option>
		            </select>
					</td>
	            </tr>
	            <tr>
					<td>체형 :</td>
					<td>
						<select class="form-control" name="snsBoardSize" id="snsBoardSize">
			            	<option>${board.snsBoardSize}</option>
			            	<option></option>
			            	<option>마른</option>
			            	<option>보통</option>
			            	<option>뚱뚱</option>
			            </select>
					</td>
	            </tr>
	            <tr>
					<td>지역 :</td>
					<td>
						<select class="form-control" name="snsBoardLoc" id="snsBoardLoc">
							<option>${board.snsBoardLoc}</option>
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
					</td>
	            </tr>
	            <tr>
					<td>성별 :</td>
					<td>
						<select class="form-control" name="snsBoardGender" id="snsBoardGender">
							<option>${board.snsBoardGender}</option>
			            	<option></option>
			            	<option>남</option>
			            	<option>여</option>
			            </select>
					</td>
	            </tr>
	            <tr>
					<td>연령대 :</td>
					<td>
						<select class="form-control" name="snsBoardAge" id="snsBoardAge">
							<option>${board.snsBoardAge}</option>
			            	<option></option>
			            	<option>10</option>
			            	<option>20</option>
			            	<option>30</option>
			            	<option>40</option>
			            	<option>50</option>
			            </select>
					</td>
	            </tr>
	            <tr>
					<td>스타일 :</td>
					<td>
						<c:choose>
							<c:when test="${snsStyle.contains('클래식')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_01" checked="checked">클래식
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_01">클래식
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('캐쥬얼')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_02" checked="checked">캐쥬얼
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_02">캐쥬얼
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('빈티지')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_03" checked="checked">빈티지
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_03">빈티지
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('스트릿')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_04" checked="checked">스트리트
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_04">스트리트
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('댄디')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_05" checked="checked">댄디
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_05">댄디
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('럭셔리')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_06" checked="checked">럭셔리
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_06">럭셔리
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('러블리')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_07" checked="checked">러블리
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_07">러블리
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('로맨틱')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_08" checked="checked">로맨틱
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_08">로맨틱
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsStyle.contains('심플')}">
								<input type="checkbox" id="styleValue" name="styleValue" value="style_09" checked="checked">심플
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="styleValue" name="styleValue" value="style_09">심플
							</c:otherwise>
						</c:choose>
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
	            <tr>
					<td>색상 :</td>
					<td>
						<c:choose>
							<c:when test="${snsColor.contains('빨강')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_01" checked="checked">빨강
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_01">빨강
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('주황')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_02" checked="checked">주황
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_02">주황
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('노랑')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_03" checked="checked">노랑
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_03">노랑
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('초록')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_04" checked="checked">초록
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_04">초록
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('파랑')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_05" checked="checked">파랑
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_05">파랑
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('남색')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_06" checked="checked">남색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_06">남색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('보라')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_07" checked="checked">보라
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_07">보라
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('검정')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_08" checked="checked">검정
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_08">검정
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('회색')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_09" checked="checked">회색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_09">회색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('흰색')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_10" checked="checked">흰색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_10">흰색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('갈색')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_11" checked="checked">갈색
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_11">갈색
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('베이지')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_12" checked="checked">베이지
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_12">베이지
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsColor.contains('핑크')}">
								<input type="checkbox" id="colorValue" name="colorValue" value="color_13" checked="checked">핑크
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="colorValue" name="colorValue" value="color_13">핑크
							</c:otherwise>
						</c:choose>
					</td>
	            </tr>
	            <tr>
					<td>상황 :</td>
					<td>
						<c:choose>
							<c:when test="${snsSituation.contains('학교')}">
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_01" checked="checked">학교
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_01">학교
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsSituation.contains('출근')}">
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_02" checked="checked">출근
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_02">출근
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsSituation.contains('파티')}">
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_03" checked="checked">파티
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_03">파티
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsSituation.contains('여행')}">
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_04" checked="checked">여행
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_04">여행
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsSituation.contains('운동')}">
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_05" checked="checked">운동
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_05">운동
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${snsSituation.contains('나들이')}">
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_06" checked="checked">나들이
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="situationValue" name="situationValue" value="situation_06">나들이
							</c:otherwise>
						</c:choose>
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
	        </tbody>
	    </table>
    	<input class="btn btn-default" type="submit" value="수정">
    	<a class="btn btn-default" href="${pageContext.request.contextPath}/home">취소</a>
    </form>
    </div>
    <!-- 우측 베너 인클루드 -->
        <div class="col-xs-2">
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
       	</div>
       </div>
       	<!-- 하단 인클루드 -->
    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>
</body>
</html>