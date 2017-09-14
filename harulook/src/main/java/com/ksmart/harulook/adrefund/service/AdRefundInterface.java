package com.ksmart.harulook.adrefund.service;

import java.util.List;

public interface AdRefundInterface {

	/*광고 환불 입력 메서드*/
	int insertAdRefund(AdRefundDto adrefund);

	/*광고 환불 번호에서 제일 높은 번호 요청 메서드*/
	String selectAdRefundNo();

	/*광고 환불 리스트 요청 메서드*/
	List<AdRefundDto> selectAdRefundList();

	/*아이디에 해당하는 광고 환불 리스트 요청 메서드*/
	List<AdRefundDto> selectAdRefundList(String SID);

	/*광고 수정 메서드*/
	int updateAdRefund(String refundNo);

	/*광고 상태(=>환불완료) 메서드*/
	int updateAdContractStatApproveRefund(String refundNo);

}