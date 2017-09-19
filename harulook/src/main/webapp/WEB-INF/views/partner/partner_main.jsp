<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>~하루룩~</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/files/images/umbrella.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="resources/css/style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <!-- 상단 인클루드 -->
    <div class="row">
    <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
    </div>
    
    <!-- 바디 인클루드 -->
    <div class="row">
	    <!-- 좌측 베너 인클루드 -->
    	<div class="col-xs-2">
    		<c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
    	</div>
	   
	    <div class="col-xs-8">
	    
        </div>

        <div class="col-xs-2">
            <!-- 우측 베너 인클루드 -->
    		<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
        </div>
    </div>
    
	<div class="row">
	    <!-- 하단 인클루드 -->
	    <c:import url="/WEB-INF/views/module/footer.jsp"></c:import>   
	</div>
</body>
</html>
