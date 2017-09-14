package com.ksmart.harulook.adpay.service;

import org.springframework.beans.factory.annotation.Autowired;

public class AdPayService implements AdPayServiceInterface {
	@Autowired
	private AdPayInterface adpayinterface;
	@Override
	public String getPayNo() {
		return adpayinterface.selectPayNo();
	}

	@Override
	public int addAdPay(AdPayDto adpay) {
		return adpayinterface.insertAdPay(adpay);
	}

}
