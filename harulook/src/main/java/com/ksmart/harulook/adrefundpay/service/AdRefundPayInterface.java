package com.ksmart.harulook.adrefundpay.service;

public interface AdRefundPayInterface {

	/*환불결제 입력 메서드*/
	int insertRefundPay(AdRefundPayDto adrefundpay);

	/*환불결제번호 중 제일 높은번호 요청 메서드*/
	String selectRefundPayNo();

}