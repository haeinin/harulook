<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Insert화면입니다.
<form id="addForm" action="${pageContext.request.contextPath}/partnerContractInsert" method="post">
        <div class="form-group">
            <label for="cooContractNo">계약번호 </label>
            <input class="form-control" name="cooContractNo" id="cooContractNo" type="text"/>
        </div>
        <div class="form-group">
            <label for="userId">계약자 아이디 </label>
            <input class="form-control" name="userId" id="userId" type="text"/>
        </div>
        <div class="form-group">
            <label for="managerId">관리자 아이디 </label>
            <input class="form-control" name="managerId" id="managerId" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractDc">제공할 쿠폰 할인율 </label>
            <input class="form-control" name="cooContractDc" id="cooContractDc" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">수수료 정책 </label>
            <input class="form-control" name="cooContractFee" id="cooContractFee" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">계약 시작 날짜 </label>
            <input class="form-control" name="cooContractStart" id="cooContractFee" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee">계약 종료 날짜 </label>
            <input class="form-control" name="cooContractEnd" id="cooContractFee" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractPayDay">수수료 지급 날짜 (매월 ?일) </label>
            <input class="form-control" name="cooContractPayDay" id="cooContractPayDay" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractCode">제공할 쿠폰 입력코드 </label>
            <input class="form-control" name="cooContractCode" id="cooContractCode" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractImg">쇼핑몰 배너 이미지</label>
            <input class="form-control" name="cooContractImg" id="cooContractImg" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractLink">배너 클릭시 이동할 URL</label>
            <input class="form-control" name="cooContractLink" id="cooContractLink" type="text"/>
        </div>
        <div>
        	 <input class="btn btn-default" id="addButton" type="submit" value="글입력"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/partnerContractList">계약목록</a>
        </div>
    </form>
</body>
</html>