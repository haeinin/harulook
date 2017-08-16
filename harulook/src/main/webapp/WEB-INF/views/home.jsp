<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello!
</h1>

<P>  Your IP address is  ${clientIP}. </P>
	<c:import url="./module/header.jsp"></c:import>

</body>
</html>
