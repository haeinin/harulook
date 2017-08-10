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
            <label for="cooContractNo"></label>
            <input class="form-control" name="cooContractNo" id="cooContractNo" type="text"/>
        </div>
        <div class="form-group">
            <label for="userId"></label>
            <input class="form-control" name="userId" id="userId" type="text"/>
        </div>
        <div class="form-group">
            <label for="managerId"></label>
            <input class="form-control" name="managerId" id="managerId" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractDc"></label>
            <input class="form-control" name="cooContractDc" id="cooContractDc" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractFee"></label>
            <input class="form-control" name="cooContractFee" id="cooContractFee" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractPayDay"></label>
            <input class="form-control" name="cooContractPayDay" id="cooContractPayDay" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractCode"></label>
            <input class="form-control" name="cooContractCode" id="cooContractCode" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractImg"></label>
            <input class="form-control" name="cooContractImg" id="cooContractImg" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractLink"></label>
            <input class="form-control" name="cooContractLink" id="cooContractLink" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractStat"></label>
            <input class="form-control" name="cooContractStat" id="cooContractStat" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractPayStat"></label>
            <input class="form-control" name="cooContractPayStat" id="cooContractPayStat" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractAccount"></label>
            <input class="form-control" name="cooContractAccount" id="cooContractAccount" type="text"/>

        <div class="form-group">
            <label for="cooContractAccountName"></label>
            <input class="form-control" name="cooContractAccountName" id="cooContractAccountName" type="text"/>
        </div>
        <div class="form-group">
            <label for="cooContractAccountBank"></label>
            <input class="form-control" name="cooContractAccountBank" id="cooContractAccountBank" type="text"/>
        </div>
        	 <input class="btn btn-default" id="addButton" type="submit" value="글입력"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/partnerContractList">계약목록</a>
        </div>
    </form>
</body>
</html>