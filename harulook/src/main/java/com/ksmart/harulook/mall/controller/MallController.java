package com.ksmart.harulook.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.mall.service.MallDao;
import com.ksmart.harulook.mall.service.MallDto;
import com.ksmart.harulook.mall.service.MallSaleDto;

@Controller
public class MallController {

	@Autowired
	private MallDao dao;

	@RequestMapping(value = "/mallDetail", method = RequestMethod.GET)
	public String mallDetail(Model model, @RequestParam(value = "mallProNo", required = true) String mallProNo) {
		MallDto dto = dao.getMallPro(mallProNo);
		model.addAttribute("dto", dto);
		System.out.println("controller : " + mallProNo);
		return "mall/mall_detail";

	}

	@RequestMapping(value = "/mallList", method = RequestMethod.GET)
	public String mallList(Model model) {
		List<MallDto> list = dao.getMallProList();
		model.addAttribute("list", list);
		/*
		 * int No = dao.countMallVistor(); System.out.println(No);
		 * dao.insertMallVisitor("coo_visitor_0"+(No+1));
		 */
		return "mall/mall_list";

	}

	@RequestMapping(value = "/mallProOrder", method = RequestMethod.GET)
	public String mallProOrder(Model model, @RequestParam(value = "mallProNo", required = true) String mallProNo) {
		MallDto dto = dao.getMallPro(mallProNo);
		model.addAttribute("dto", dto);
		return "mall/mall_order";
	}

	@RequestMapping(value = "/mallProOrder", method = RequestMethod.POST)
	public String mallProSale(MallSaleDto dto) {
		int price = dto.getMallSalePrice();
		System.out.println("price="+price);
		int amount = dto.getMallSaleAmount();
		System.out.println("amount="+amount);
		dto.setMallSaleTotal(price*amount);
		dao.insertMallSale(dto);
		return "mall/mall_sale";
	}

}