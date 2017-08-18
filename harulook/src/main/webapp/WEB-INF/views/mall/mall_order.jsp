<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <title>Beautiful Closet</title>
            <!-- bootstrap을 사용하기 위한 CDN주소 -->
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                crossorigin="anonymous">
            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
                crossorigin="anonymous">

            <!-- jquery를 사용하기위한 CDN주소 -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
                crossorigin="anonymous"></script>
            <!-- jQuery UI 라이브러리 js파일 -->
            <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#account').hide();
                    $('#card').hide();

                    $('#payCard').click(function () {
                        $('#card').show();
                        $('#account').hide();
                    })
                    $('#payAccount').click(function () {
                        $('#account').show();
                        $('#card').hide();
                    })




                    $('#validCheck').click(function () {
                        var request = $.ajax({
                            url: "./validCooContractCode", //호출 경로
                            method: "POST",	//전송방식
                            data: { 'cooContractCode': $('#Code').val() }, //전송해줄값
                            dataType: "text" //결과값 타입 (리턴)


                        });

                        request.done(function (msg) {
                            msg = msg.trim();
                            console.log(msg);

                            if (msg == "") {//일치하는값 없을때
                                $('#cooContractDc').val("");
                                $('#vaild').hide();
                                $('#invaild').show();
                            } else {	//일치하는 값 있을때
                                $('#cooContractDc').val(msg);
                                $('#cooContractCode').val($('#Code').val());
                                $('#vaild').show();
                                $('#invaild').hide();
                            }
                        });
                    });
                    $('#payComplete').click(function () {
                        alert('결제가 완료되었습니다.');
                        $('#mallProOrderForm').submit();
                    });
                    $('#modalBtn').click(function () {
                        var p = parseInt($('#mallSalePrice').val());
                        var n = parseInt($('#mallSaleAmount').val());
                        var dc = $('#cooContractDc').val();
                        if (dc == null || dc == "") {
                            dc = 0;
                        }
                        dc = parseInt(dc);
                        var total = p * n * (1 - (dc / 100));
                        $('#payTotal').val(total);
                        $('#mallSaleTotal').val(total);
                    });


                });
            </script>

            <style>
                .container {
                    padding: 80px 100px;
                }

                .reset {
                    margin-top: 20px;
                }

                .alert {
                    margin: 20px;
                }
            </style>
        </head>

        <body>
            <div class="container">

                <div class="form-group">
                    <label for="mallProName">상품이름  </label>
                    <input class="mallProName" name="mallProName" value="${dto.mallProName}" type="text" />
                </div>
                <form id="mallProOrderForm" action="${pageContext.request.contextPath}/mallProOrder" method="post">
                    <div class="form-group">
                        <label for="mallSalePrice">상품가격 </label>
                        <input class="form-control" name="mallSalePrice" id="mallSalePrice" value="${dto.mallProPrice}" type="text" />
                    </div>
                    <div class="form-group">
                        <label for="mallSaleAmount">상품 갯수</label>
                        <input class="form-control" name="mallSaleAmount" id="mallSaleAmount" value="1" type="text" />
                    </div>
                    <div class="form-group">
                        <label for="cooContractCode">할인쿠폰코드</label>
                        <input class="form-control" name="cooContractCode" id="cooContractCode" type="text" readonly="readonly" />
                    </div>
                    <!-- hidden값 -->
                    <input name="mallSaleTotal" id="mallSaleTotal" type="hidden">
                    <input name="mallProNo" id="mallProNo" value="${dto.mallProNo}" type="hidden" />
                    <input name="userId" id="userId" value="${sessionScope.id}" type="hidden" />
                </form>
                <div>
                    <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#vaildCode">할인코드입력</button>
                </div>
                <div class="form-group">
                    <label for="cooContractDc">쿠폰 할인율</label>
                    <input class="form-control" name="cooContractDc" id="cooContractDc" type="text" readonly="readonly" />
                </div>


                <div>
                    <button class="btn btn-info btn-lg" data-toggle="modal" id="modalBtn" data-target="#payModal">결제하기</button>
                </div>
                <div class="modal fade" id="vaildCode">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">
                                    할인쿠폰 입력하기
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="Code">할인쿠폰코드</label>
                                    <input class="form-control" id="Code" type="text" />
                                </div>
                                <button type="button" id="validCheck" class="btn btnprimary"> 할인코드 입력</button>
                                <div class="alert alert-success" style="display: none;" id="vaild">
                                    할인이 적용되었습니다.
                                </div>
                                <div class="alert alert-danger" style="display: none;" id="invaild">
                                    유효하지 않은 할인코드입니다.
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" id="closeBtn" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- PayModal -->
                <div class="modal fade" id="payModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">결제</h4>
                            </div>
                            <div class="modal-body">
                                <table border="1" width="70%" align="center">
                                    <tr>
                                        <td width="30%" height="10%"> 총 결제금액 :</td>
                                        <td><input type="text" id="payTotal" width="100%" readonly="readonly"></td>
                                    </tr>
                                </table>
                                <h4>결제 방법</h4>
                                <input type="button" id="payCard" name="payWay" value="카드결제"> &nbsp;&nbsp;&nbsp;
                                <input type="button" id="payAccount" name="payWay" value="무통장입금"><br>
                                <c:import url="../ad/pay/ad_pay_account.jsp"></c:import>
                                <c:import url="../ad/pay/ad_pay_card.jsp"></c:import>

                            </div>
                            <div>
                                <%--  <form id="PayAdmit" action="${pageContext.request.contextPath}/mallProOrder" method="get"> --%>
                                    <input class="btn btn-default" id="payComplete" type="button" value="완료" />

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="#payModal">취소</button>
                        </div>
                    </div>
                </div>

            </div>
        </body>

        </html>