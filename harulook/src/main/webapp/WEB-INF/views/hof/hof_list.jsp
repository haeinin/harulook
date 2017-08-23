<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
					<tr>
						<td>월</td>
						<td>랭크</td>
						<td>게시물번호</td>
					</tr>
				<c:forEach var="b" items="${list}" >
					<tr>
						<td>${b.hofMonth}월</td>
						<td>${b.hofRank}</td>
						<td><a href="${pageContext.request.contextPath}/boardDetail?boardNo=${b.boardNo}">${b.boardNo}</a></td>
					</tr>
				</c:forEach>
</table>
</body>
</html>