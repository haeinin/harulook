<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <title>제휴계약 수수료 결제 현황</title>
        </head>
        
        <body>
        <div class="row">
        <c:import url="/WEB-INF/views/module/header.jsp"></c:import>
        </div>
            <div class="row">
                <div class="col-xs-1">
                    <c:import url="/WEB-INF/views/partner/partner_left.jsp"></c:import>
                </div>

                <div class="col-xs-9" >
                <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-7">
                        <table class="table table-striped" id="table">

                            <thead>
                                <tr>
                                    <th>제휴계약번호</th>
                                    <th>결제 날짜</th>
                                    <th>결제 금액</th>
                                    


                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="b" items="${list}">
                                    <tr>
                                        <td>${b.cooContractNo}</td>
                                        <td>${b.cooPayDate}</td>
                                        <td>${b.cooPayTotal}</td>



                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>
                </div>
                </div>
                <div class="col-xs-2">
				<!-- 우측 베너 인클루드 -->
				<c:import url="/WEB-INF/views/module/right.jsp"></c:import>
				</div>
            </div>

        </body>

        </html>