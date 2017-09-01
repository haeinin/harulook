<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	    <div class="col-xs-1">
			<c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
	    </div>
	    <div class="col-xs-9">
<div class="container">
<table border="1px">

				<c:forEach var="b" items="${list}" >
				<input type="hidden" id="boardNo" value="${b.boardNo}">
					<tr>
						<td>${b.hofRank}등</td>
					</tr>
					<tr>
						<td><img class="img" src="${b.boardImg}"></td>
					</tr>

				</c:forEach>
</table>

</div>
</div>

</body>
</html>