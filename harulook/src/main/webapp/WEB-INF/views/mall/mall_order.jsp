<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>제휴계약 수정하기</title>
</head>
<body>
<div class="container">

    <form id="mallProOrderForm" action="${pageContext.request.contextPath}/mallProOrder" method="post">
        <div class="form-group">
            <label for="mallProNo">상품번호 </label>
            <input class="form-control" name="mallProNo" id="mallProNo" value="${dto.mallProNo}" type="hidden" />
        </div>
        <div class="form-group">
            <label for="mallProName">상품이름  </label>
            <input class="mallProName" name="mallProName" value="${dto.mallProName}" type="text"/>
        </div>
        <div class="form-group">
            <label for="mallSalePrice">상품가격 </label>
            <input class="form-control" name="mallSalePrice" value="${dto.mallProPrice}" type="text"/>
        </div>    
        <div class="form-group">
            <label for="mallSaleAmount">상품 갯수</label>
            <input class="form-control" name="mallSaleAmount" id="mallSaleAmount"  type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractCode">할인쿠폰코드</label>
            <input class="form-control" name="cooContractCode" id="cooContractCode" type="text"/>
        </div>
      
        <div>
        	 <input class="btn btn-default" id="addButton" type="submit" value="구입하기"/>
        </div>
    </form>
</div>
</body>
</html>
