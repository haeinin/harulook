package com.ksmart.harulook.adpay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.adpay.service.AdPayDao;
import com.ksmart.harulook.adpay.service.AdPayDto;
@Controller
public class AdPayController {
	@Autowired
	AdPayDao adpaydao;
	
	@RequestMapping(value="/adPayInsert",method = RequestMethod.POST)
	public String adPayInsert(AdPayDto adpay) {
		int initPayNo=1;
		String lastPayNo=adpaydao.getPayNo();
		if(lastPayNo!=null){
			initPayNo=Integer.parseInt(lastPayNo)+1;
				}
		adpay.setAdPayNo("ad_pay_"+initPayNo);
		System.out.println("광고 결제 요청");
		adpaydao.insertAdPay(adpay);
		return "ad/contract/ad_contract_list";
	}
}
