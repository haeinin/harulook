package com.ksmart.harulook.adpay.service;

public interface AdPayInterface {

	/*제일 높은 결제 번호 조회 메서드*/
	String selectPayNo();

	/*결제 입력 메서드*/
	int insertAdPay(AdPayDto adpay);

}