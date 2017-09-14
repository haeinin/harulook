package com.ksmart.harulook.adpay.service;

public interface AdPayServiceInterface {

	/*제일 높은 결제 번호 조회 메서드*/
	String getPayNo();

	/*결제 입력 메서드*/
	int addAdPay(AdPayDto adpay);

}