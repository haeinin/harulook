<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="float:left">
<table border="1px" cellpadding="10px" style="border-collapse:collapse">
<tr><td>상품번호</td></tr>
<c:forEach var="b" items="${proList}">
<tr>
<td>${b}</td>
</tr>

</c:forEach>

</table>
</div>


	<table border="1px" cellpadding="10px" style="border-collapse:collapse">
		<tr>

			<td>총 판매량</td>
			<td>유입 판매량</td>
			<td>구매비율</td>
		</tr>
			<c:forEach var="m" items="${m}">
				<tr>
					<td>${m.get("total")}</td>

					<td>${m.get("influx")}</td>
	
					<td>${m.get("rate")}%</td>
				</tr>
			</c:forEach>

	</table>





</body>
</html>