package com.ksmart.harulook.partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.dto.MallDto;
import com.ksmart.harulook.dto.PartnerDto;

@Controller
public class PartnerController {

	@Autowired
	private PartnerDao dao;

	/*제휴계약Insert*/
	@RequestMapping(value = "/partnerContractInsert", method = RequestMethod.POST)
	public String partnerContractInsert(PartnerDto dto) {
		System.out.println("제휴계약신청");
		dao.insertCooContract(dto);
		return "redirect:/partnerContractList";
	}
	/*제휴계약폼요청*/
	@RequestMapping(value = "/partnerContractInsert", method = RequestMethod.GET)
	public String partnerContractInsert() {
		System.out.println("제휴계약 폼 요청");
		return "partner/contract/partner_contract_insert";
	}

	@RequestMapping(value = "/partnerContractList", method = RequestMethod.GET)
	public String partnerContractList(Model model) {
		List<PartnerDto> list = dao.getCooContractList();
		model.addAttribute("list",list);
		System.out.println("제휴계약컨트롤러 리스트보기");
		return "partner/contract/partner_contract_list";

	}

}
