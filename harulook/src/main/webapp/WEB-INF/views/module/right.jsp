<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 제휴광고조정 -->
<style type="text/css">
/* 제휴광고버튼 */
#add {
	position: fixed;
}

</style>
<script>
$(document).ready(function() {
	var link = [];
	var img = [];
	
$.ajax({  
    type : "GET",  
    url : "./getBanner",   
    dataType : "json",  
    success : function(data){  
    	link = [];
    	img = [];
    	$.each(data, function(key, value) {
	    	
	    	link.push(value.link);
	    	img.push(value.img);
	    	});
    	
    	$('#i').attr("src",img.pop());
    	$('#partner1').attr("href",link.pop());
  
    	$('#j').attr("src",img.pop());
    	$('#partner2').attr("href",link.pop());

    },  
    error:function(xhr,status,error){ //ajax 오류인경우  
            console.log("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);                 
    }  

}); 
});
</script>
</head>
<body>
	<div class="row" style="height: 40px;"></div>
	<div class="row" style="height: 400px;">
		<div id="add">
			<a href="${pageContext.request.contextPath}/beautifulCloset" target="_blank">
			<img src="resources/beaneo2.png" >
			</a>
		</div>

	</div>
	<div class="row" style="height: 100px;">
	<div id="add">
	<a id="partner1"><img id="i" width="50px"></a>
	</div>
	</div>
	<div class="row" style="height: 350px;">
	<div id="add">
	<a id="partner2"><img id="j" width="50px"></a>
	</div>
	
</div>
</body>
</html>