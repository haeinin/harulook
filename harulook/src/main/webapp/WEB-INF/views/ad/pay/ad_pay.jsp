<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script>
   $(document).ready(function(){
    	 
	   	/* 맨 처음에 화면이 출력됬을떄 화면을 숨김 */
	     $('#account').hide();
         $('#card').hide();
       /****************************/ 
      	/* 결제 방법을 선택하여 원하는 화면을 출력 */  
       $('#payCard').click(function(){
 				$('#card').show();
 				$('#account').hide();
 				/* 숨겨진 payWay input에 결제방식 입력 */
 				$('#payWay').val("카드결제");
 				/*****************************/
         })
          $('#payAccount').click(function(){
 				$('#account').show();
 				$('#card').hide();
 				$('#payWay').val("무통장입금")
 			})
 			/******************************/
 		/* 무통장입금을 클릭한 상황에서 은행 종류를 선택했을때 입금해야할 계좌번호 출력 */
		$('#accountbankselect').change(function(){
    	   if($('#accountbankselect').val() == '신한'){
    		   $('#inaccount').val('신한 110-393-395662 하루룩');
    	   }else if($('#accountbankselect').val() == '농협'){
				$('#inaccount').val('농협 351-0549-3314-43 하루룩');
			}else if($('#accountbankselect').val() == '카카오'){
				$('#inaccount').val('카카오 3333-0549-3314-43 하루룩');
			}
    	  /************************************************/
       })
       /* 완료 버튼을 눌렀을때 DB에 입력 */
   	$('#payComplete').click(function(){
		alert('결제가 완료되었습니다.')	
		$('#payInsert').submit();
	});
       /**********************/
     
	});
   </script>
  
  <div align="center">
		 <form action="./adPayInsert" action="post" id="payInsert" method="POST">
          	<table border="1" width="70%" align="center">
          	<tr><td height="10%">결제금액 :  </td><td><input type="text" id="pricePayTotal" width="100%" name="adPayPrice" value="${priceTotal}" readonly></td></tr>
          	</table>
          	<h4>결제 방법</h4>
          	<input type="hidden" name="adContractNo" value="${contractNo}">
          	<input type="hidden" name="adPayWay" id="payWay">
          	<input type="button" id="payCard" name="payWay" value="카드결제" > &nbsp;&nbsp;&nbsp;
          	<input type="button" id="payAccount" name="payWay" value="무통장입금" ><br>
          	<h4>결제자 이름</h4>
          	<input name="adPayName" type="text">
          	<c:import url="../../module/pay_account.jsp"></c:import>
          	<c:import url="../../module/pay_card.jsp"></c:import>
          </form>

            <input class="btn btn-default" id="payComplete" type="button" value="완료"/>
            <input class="btn btn-default" type="reset" value="초기화"/>

          <button type="button" class="btn btn-default" data-dismiss="payModal">닫기</button>
 </div>