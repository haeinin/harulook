package com.ksmart.harulook.adrefundpay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.adrefund.service.AdRefundDao;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDao;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDto;

@Controller
public class AdRefundPayController {
	@Autowired
	AdRefundPayDao adrefundpaydao;
	@Autowired
	AdRefundDao adrefunddao;
	@RequestMapping(value="/insertRefundValue", method = RequestMethod.POST)
	public String insertRefundValue(AdRefundPayDto adrefundpay){
		int initRefundPayNo = 1;
		String lastRefundPayNo = adrefundpaydao.getRefundPayNo();
		if(lastRefundPayNo != null){
			initRefundPayNo = Integer.parseInt(lastRefundPayNo) + initRefundPayNo;
		}
		adrefundpay.setRefundPayNo("refund_pay_"+initRefundPayNo);
		adrefundpaydao.insertRefundPay(adrefundpay);
		adrefunddao.updateRefund(adrefundpay.getRefundNo());
		return "redirect:/selectRefund";
		
	}

}
