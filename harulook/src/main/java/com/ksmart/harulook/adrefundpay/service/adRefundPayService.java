package com.ksmart.harulook.adrefundpay.service;

import org.springframework.beans.factory.annotation.Autowired;

public class adRefundPayService implements AdRefundPayServiceInterface {
	@Autowired
	private AdRefundPayInterface adrefundpayinterface;
	@Override
	public int addRefundPay(AdRefundPayDto adrefundpay) {
		return adrefundpayinterface.insertRefundPay(adrefundpay);
	}

	@Override
	public String getRefundPayNo() {
		return adrefundpayinterface.selectRefundPayNo();
	}

}
