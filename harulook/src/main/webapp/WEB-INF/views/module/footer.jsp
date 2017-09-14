<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 하단위치조정 */
#footer {
	position: relative;
	height: 70px;
	/* background-color: #D6F0FF; */
	border-top: 1px solid lightgrey;
}
</style>

</head>
<body>
	<div id="footer">
        <div class="container">
        
            <div class="row">
                <div class="col-xs-12">
                <h4>(주)하루룩</h4>
                <p class="about-text">사업자등록번호 333-444555-6666 </p>
                <a href="${pageContext.request.contextPath}/policy">이용약관</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>