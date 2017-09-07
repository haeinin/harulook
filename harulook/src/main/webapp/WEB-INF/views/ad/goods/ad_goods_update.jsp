<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 수정</title>
 <!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js""></script>
<script>
$(document).ready(function(){
	$('#img').on('change', function(){
 	   var id = $(this).attr('id');
	   id = id + "View";
	   console.log(id);
	     readURL(this , id);
	 });
});

function readURL(input ,id) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $("#" + id).attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
<div class="container">
    <h1>상품 상세보기</h1>
    <form action="./updateGoods" method="POST" enctype="multipart/form-data">
    <table class="table">
            <tr>
                <td>상품번호</td>
                <td>${adgoods.adGoodsNo}
                	<input type="hidden" value="${adgoods.adGoodsNo}" name="adGoodsNo"></td>
            </tr>
            <tr>
                    <th>이미지</th>
                    <td><img alt="no Image" src="${adgoods.adGoodsImage}" width="500px" height="500px" id="imgView">
                    	<input type='file' id="img" class="ad-1" name="adGoodsImage"/><br><br></td>
            </tr>
            <tr>
                	<th>링크</th>
                    <td><input type="text" value="${adgoods.adGoodsLink}" name="adGoodsLink"></td>
            </tr>
    </table>
    <button>수정완료</button>
    </form>
</div>
</body>
</html>