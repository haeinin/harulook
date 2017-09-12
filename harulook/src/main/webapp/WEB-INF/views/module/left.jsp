<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
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
			<a href="${pageContext.request.contextPath}/boardInsert"><i class="fa fa-plus-circle" style="font-size:60px;color:gray;margin-left:50px;"></i></a>

		</c:if>
	</div>
</div>

</body>
</html>