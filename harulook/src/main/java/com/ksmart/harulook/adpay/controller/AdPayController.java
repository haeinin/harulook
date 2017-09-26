package com.ksmart.harulook.adpay.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.adpay.service.AdPayDto;
import com.ksmart.harulook.adpay.service.AdPayInterface;
@Controller
public class AdPayController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	AdPayInterface adpaydao;
	
	@RequestMapping(value="/adPayInsert",method = RequestMethod.POST)
	public String adPayInsert(AdPayDto adpay) {
		int initPayNo=1;
		String lastPayNo=adpaydao.selectPayNo();
		if(lastPayNo!=null){
			initPayNo=Integer.parseInt(lastPayNo)+1;
				}
		adpay.setAdPayNo("ad_pay_"+initPayNo);
		log.debug("광고 결제 요청");
		adpaydao.insertAdPay(adpay);
		return "redirect:/adContractList";
	}
}
