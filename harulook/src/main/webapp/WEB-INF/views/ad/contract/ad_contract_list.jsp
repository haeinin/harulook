<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>	
			<div class="container">
			   <h1>현재 광고 목록</h1>
			   <c:import url="../contract/ad_contract_list_current.jsp"></c:import>
			   <h1>광고예정 목록</h1>
			   <c:import url="../contract/ad_contract_list_not_current.jsp"></c:import>
			   <h1>광고 계약하기</h1>
			   <form action="./adContractInsert" method="GET">
			   <button>광고 계약</button>
			   </form>
			</div>
</body>
</html>