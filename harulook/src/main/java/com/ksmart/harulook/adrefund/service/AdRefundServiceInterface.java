package com.ksmart.harulook.adrefund.service;

import java.util.List;

public interface AdRefundServiceInterface {

	/*광고 환불 입력 메서드*/
	int addAdRefund(AdRefundDto adrefund);

	/*광고 환불 번호에서 제일 높은 번호 요청 메서드*/
	String getAdRefundNo();

	/*광고 환불 리스트 요청 메서드*/
	List<AdRefundDto> getAdRefundList();

	/*아이디에 해당하는 광고 환불 리스트 요청 메서드*/
	List<AdRefundDto> getAdRefundList(String SID);

	/*광고 수정 메서드*/
	int modifyAdRefund(String refundNo);

	/*광고 상태(=>환불완료) 메서드*/
	int modifyAdContractStatApproveRefund(String refundNo);

}