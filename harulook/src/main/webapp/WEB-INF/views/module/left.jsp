<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/modernizr.js"></script>
<script type="text/javascript">
	$('#snsInsertButton').click(function(){	//sns게시물등록하기
		$('#snsInsertForm').submit();
	});
</script>
</head>
<body>
	<div class="row" style="height: 150px">
		<div class="col-sm-4"></div>
		<div class="col-sm-1">
		<a href="${pageContext.request.contextPath}/hof"> 
	<img src="./resources/HOF.png" alt="hof" width="100" height="100">
	</a>
		</div>
	</div>
	<div class="row">
	<div class="col-sm-4">
	
	</div>
	
	<div class="col-xs-12 col-sm-4">
	   <!-- 게시물등록하기버튼 -->
		<c:if test="${sessionScope.level == '일반회원'}">
			<form id="snsInsertForm" action="${pageContext.request.contextPath}/boardInsert" method="get">
			
				<button class="btn btn-default" id="snsInsertButton" value="sns게시물등록하기">
				<img src="./resources/sns_Insert.png" class="img-rounded" alt="Cinque Terre" width="50" height="40"></button>
			</form>
		</c:if>
	</div>
</div>

</body>
</html>