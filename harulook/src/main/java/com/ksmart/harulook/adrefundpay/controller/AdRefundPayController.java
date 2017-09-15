package com.ksmart.harulook.adrefundpay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.adrefund.service.AdRefundInterface;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDto;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayInterface;

@Controller
public class AdRefundPayController {
	@Autowired
	AdRefundPayInterface adrefundpaydao;
	@Autowired
	AdRefundInterface adrefunddao;
	/*광고 홥불정보 입력*/
	@RequestMapping(value="/insertRefundValue", method = RequestMethod.POST)
	public String insertRefundValue(AdRefundPayDto adrefundpay){
		int initRefundPayNo = 1;
		String lastRefundPayNo = adrefundpaydao.selectRefundPayNo();
		if(lastRefundPayNo != null){
			initRefundPayNo = Integer.parseInt(lastRefundPayNo) + initRefundPayNo;
		}
		adrefundpay.setRefundPayNo("refund_pay_"+initRefundPayNo);
		adrefundpaydao.insertRefundPay(adrefundpay);
		adrefunddao.updateAdRefund(adrefundpay.getRefundNo());
		return "redirect:/selectRefund";
		
	}

}
