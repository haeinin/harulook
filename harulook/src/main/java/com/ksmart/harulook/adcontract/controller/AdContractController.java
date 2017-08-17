package com.ksmart.harulook.adcontract.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.adcontract.service.AdContractDao;
import com.ksmart.harulook.adcontract.service.AdContractDto;

@Controller
public class AdContractController {
	@Autowired
	private AdContractDao adcontractdao;
	
	@RequestMapping(value="/adContractInsert",method = RequestMethod.GET)
	public String adContractInsert() {
		System.out.println("광고 계약 입력 폼 요청");
		return "ad/contract/ad_contract_insert";
	}
	@RequestMapping(value="/adContractList",method = RequestMethod.GET)
	public String adContractList(Model model) {
		System.out.println("광고 계약 현황 리스트 요청");
		List<AdContractDto> adcontractlist = adcontractdao.getAdContractList();
		model.addAttribute("adcontractlist",adcontractlist);
		System.out.println(model.toString());
		return "ad/contract/ad_contract_list";
	}
	@RequestMapping(value="/adContractInsert",method = RequestMethod.POST)
	public String adContractInsert(AdContractDto adcontract) {
		String lastContractNo=adcontractdao.getContractNo();
		int initNo=1;
		if(lastContractNo!=null){
			initNo=Integer.parseInt(lastContractNo)+1;
		}
		adcontract.setAdContractNo("ad_contract_"+initNo);
		System.out.println(adcontract);
		adcontractdao.insertAdContract(adcontract);
		return "redirect:/";
	}
	@RequestMapping(value="/adPay",method = RequestMethod.GET)
	public String adContractAdd(Model model) {
		System.out.println("광고 결제 요청");
		return "ad/pay/ad_pay";
	}
	
	@RequestMapping(value="/adContractAdUser",method = RequestMethod.GET)
	public String adContractListByUser(Model model, HttpSession session) {
		System.out.println("판매자 광고 목록 요청");
		String id = (String) session.getAttribute("id");
		List<AdContractDto> adcontractlistbyusercurrent = adcontractdao.getAdContractListByAdUserCurrent(id);
		List<AdContractDto> adcontractListbyuserother= adcontractdao.getAdContractListByAdUser(id);
		model.addAttribute(adcontractlistbyusercurrent);
		model.addAttribute(adcontractListbyuserother);
		return "ad/contract/ad_contract_by_ad_user";
	}
}
