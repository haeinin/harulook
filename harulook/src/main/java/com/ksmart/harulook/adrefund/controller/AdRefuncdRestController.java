package com.ksmart.harulook.adrefund.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.adrefund.service.AdRefundDto;
import com.ksmart.harulook.adrefund.service.AdRefundInterface;

@RestController
public class AdRefuncdRestController {

	@Autowired
	private AdRefundInterface adrefunddao;
	/*광고 환불 등록*/
	@RequestMapping(value="/insertRefund",method = RequestMethod.POST)
	public void insertRefund(@RequestParam("conractNo") String contractno
						    ,@RequestParam("contractPrice")int contractprice){
		System.out.println("광고 환불 등록 요청");
		System.out.println("계약 번호 : " + contractno + "계약금액 : " + contractprice);
		AdRefundDto adrefund = new AdRefundDto();
		String lastrefundNo=adrefunddao.selectAdRefundNo();
		int initRefundNo=1;
		if(lastrefundNo != null){
			initRefundNo = Integer.parseInt(lastrefundNo)+1;
		}
		adrefund.setRefundNo("refund_"+initRefundNo);
		adrefund.setAdContractNo(contractno);
		adrefund.setRefundPrice(contractprice);
		adrefunddao.insertAdRefund(adrefund);
	}
}
