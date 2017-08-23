<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#totalModal">결제금액산정</button>
    </div>
     
    <!-- totalModal -->
  <div class="modal fade" id="totalModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="#totalModal">&times;</button>
          <h4 class="modal-title">결제 금액 산출</h4>
        </div>
        <div class="modal-body">
       <form id="contractForm" action="./adContractInsert" method="POST">
    <div class="form-group">
	        <label for="adType">광고종류</label>
	        <select id="adType" name="adCostNo">
	        <option value=""></option>
	        <option value="ad_cost_01">옷</option>
	        <option value="ad_cost_03">아이템</option>
	        </select> 
    </div>
    <div class="form-group">
            <label for="adPlace">광고위치</label>
            <select id="adPlace" name="adContractPlace">
            <option value=""></option>
            <option value="1">첫번째</option>
            <option value="2">두번째</option>
            <option value="3">세번째</option>
            </select> 
        </div>
    <div class="form-group">
            <label for="date">계약일수</label>
            <select id="date" name="adDcNo">
            <option value=""></option>
            <option value="ad_dc_01">3일</option>
            <option value="ad_dc_02">7일</option>
            <option value="ad_dc_03">30일</option>
            </select> 
        </div>
        <div class="form-group">
            <label for="boardPw">시작일자</label>
            <input type="text" id="Datepicker" name="adContractStart">  
        </div>
        
        <div class="form-group">
            <label for="pricePerDay">하루당 광고금액 :</label>
            <input type="text" id="pricePerDay" readonly>
        </div>
        <div class="form-group">
            <label for="dcForPrice">할인율 :</label>
            <input type="text" id="dcForPrice" readonly>
        </div>
        <div class="form-group">
            <label for="priceTotal">총 금액 :</label>
            <input type="text" id="priceTotal" name="adContractPrice" readonly>
        </div>
        <div>
        <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#payModal" id="priceOk">결제하기</button>
            <input class="btn btn-default" id="totalComplete" type="button" value="완료"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
        </div>
        </form>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="#totalModal">닫기</button>
        </div>
      </div>
      </div>
      </div>

