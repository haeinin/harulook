<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <table class="table table-striped">
        <thead>
            <tr>
                <th>위치</th>
                <th>쇼핑몰</th>
                <th>광고주 아이디</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>계약 상태</th>
                <c:if test="${sessionScope.level=='관리자'}">
                <th>계약 강제 취소</th>
                </c:if>
                <c:if test="${sessionScope.level=='사업자'}">
                <th>계약 중도 취소</th>
                </c:if>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            	<td>1</td>
                <c:if test="${adContractPlace1==null}">
                	<td colspan="7" align="center"><a class="btn btn-info">비었음</a></td>
                </c:if>
                <c:if test="${adContractPlace1!=null}">                
                	<td>${adContractPlace1.userBsName}</td>
                	<td>${adContractPlace1.userId}</td>
                	<td>${adContractPlace1.adContractStart}</td>
                	<td>${adContractPlace1.adContractEnd}</td>
                	<td>${adContractPlace1.adContractStat}</td>
                <c:if test="${sessionScope.level=='관리자'}">
            		<td><a href="./contractBadCancel?adContractNo=${adContractPlace1.adContractNo}&adContractEnd=${adContractPlace1.adContractEnd}">계약 강제 취소</a></td>
            	</c:if>
				<c:if test="${sessionScope.id==adContractPlace1.userId}">
            		<td><a href="./contractDoingCancel?adContractNo=${adContractPlace1.adContractNo}&adContractEnd=${adContractPlace1.adContractEnd}">계약 중도 취소 신청</a></td>
            		<td><button id="place1detail" type="button" class="btn btn-success">상세보기</button></td>
            	</c:if>
                </c:if>
                
            </tr>
            <tr>
                <td>2</td>
                <c:if test="${adContractPlace2==null}">
                	<td colspan="7" align="center"><a class="btn btn-info">비었음</a></td>
                </c:if>
                <c:if test="${adContractPlace2!=null}">
                	<td>${adContractPlace2.userBsName}</td>
                	<td>${adContractPlace2.userId}</td>
                	<td>${adContractPlace2.adContractStart}</td>
                	<td>${adContractPlace2.adContractEnd}</td>
                	<td>${adContractPlace2.adContractStat}</td>
                <c:if test="${sessionScope.level=='관리자'}">
            		<td><a href="./contractBadCancel?adContractNo=${adContractPlace2.adContractNo}&adContractEnd=${adContractPlace2.adContractEnd}">계약 강제 취소</a></td>	
            	</c:if>
	<c:if test="${sessionScope.id==adContractPlace2.userId}">
            		<td><a href="./contractDoingCancel?adContractNo=${adContractPlace2.adContractNo}&adContractEnd=${adContractPlace2.adContractEnd}">계약 중도 취소 신청</a></td>
            	    <td><button id="place2detail" type="button" class="btn btn-success">상세보기</button></td>  
            	</c:if>
                </c:if>
  
            </tr>


            <tr>
            	<td>3</td>
            	<c:if test="${adContractPlace3==null}">
            		<td colspan="7" align="center"><a class="btn btn-info">비었음</a></td>
            	</c:if>
            	<c:if test="${adContractPlace3!=null}">
            		<td>${adContractPlace3.userBsName}</td>
            		<td>${adContractPlace3.userId}</td>
            		<td>${adContractPlace3.adContractStart}</td>
            		<td>${adContractPlace3.adContractEnd}</td>
            		<td>${adContractPlace3.adContractStat}</td>
             	<c:if test="${sessionScope.level=='관리자'}">
        			<td><a href="./contractBadCancel?adContractNo=${adContractPlace3.adContractNo}&adContractEnd=${adContractPlace3.adContractEnd}">계약 강제 취소</a></td>
        		</c:if>
        		<c:if test="${sessionScope.id==adContractPlace3.userId}">
        			<td><a href="./contractDoingCancel?adContractNo=${adContractPlace3.adContractNo}&adContractEnd=${adContractPlace3.adContractEnd}">계약 중도 취소 신청</a></td>
        			<td><button id="place3detail" type="button" class="btn btn-success">상세보기</button></td>
        		</c:if>
        		</c:if>

            </tr>
        </tbody>
    </table>