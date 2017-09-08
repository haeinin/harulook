<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
<!-- sns 게시물 상세보기 모달 -->
	<div class="modal fade" id="ad2Modal" role="dialog">
	    <div id="modalFrame" class="modal-dialog modal-lg" >
			<div id="snsDetail" class="modal-content">
		        <div class="row">
		        
		        	<!-- 게시물 이미지 영역 -->
			        <div id="adDetailImgArea" class="modal-body col-xs-12 col-sm-6" style="padding-bottom: 0; padding-top: 0;">
						<div id="adDetailImg"></div>
		        	</div>
		        	<!-- 게시물 이미지 영역 -->
		        	
		        	<!-- 게시물 내용 영역 -->
			        <div id="contentArea" class="modal-body col-xs-12 col-sm-6">
			        	<input type="hidden" id="sessionUserLevel" value="${sessionScope.level}">
		        		<div id="adDetailContent"></div>
		        		<hr>
		        	
			        	<div id="adDetailLike"></div>
			        	<div id="adDetailComment"></div>
			        	<hr>
			        	<c:if test="${sessionScope.id != null}">
			        	<input type="hidden" id="sessionUserId" value="${sessionScope.id}">
			        	<div id="adDetailCommentControll">
			        	</div>
			        	</c:if>
					</div>
					<!-- 게시물 내용 영역 -->
					
			     </div>
			</div>
		</div>
	</div>
	<!-- sns 게시물 상세보기 모달 -->