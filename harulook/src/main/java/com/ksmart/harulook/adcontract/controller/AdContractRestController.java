package com.ksmart.harulook.adcontract.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.adcontract.service.AdContractDao;

@RestController
public class AdContractRestController {
	
	@Autowired
	private AdContractDao adcontractdao;

	/*광고 종류를 선택했을때 해당광고별 금액 산출(AJAX)*/
	@RequestMapping(value="/getPrice",method = RequestMethod.POST)
	public String getPrice(@RequestParam("adtype") String adtype) {
		System.out.println("광고종류별 금액 요청");
		System.out.println(adtype);
		String price = adcontractdao.getPrice(adtype);
		return price;
	}
	/*계약기간을 선택헀을때 기간별 할인율 산출(AJAX)*/
	@RequestMapping(value="/getDc",method = RequestMethod.POST)
	public String getDc(@RequestParam("adCostNo") String dc) {
		System.out.println("계약일별 수수료 비율 요청");
		System.out.println(dc);
		String dcrate = adcontractdao.getDc(dc);
		return dcrate;
	}
}
