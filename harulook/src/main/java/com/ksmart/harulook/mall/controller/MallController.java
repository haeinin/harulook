package com.ksmart.harulook.mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "mall/mall_list";

	}

	@RequestMapping(value = "/mallProOrder", method = RequestMethod.GET)
	public String mallProOrder(Model model, @RequestParam(value = "mallProNo", required = true) String mallProNo) {
		MallDto dto = dao.getMallPro(mallProNo);
		model.addAttribute("dto", dto);
		return "mall/mall_order";
	}

	@RequestMapping(value = "/mallProOrder", method = RequestMethod.POST)
	public String mallProSale(MallSaleDto dto
				,HttpSession session
				,Model model) {
		dao.insertMallSale(dto);
		String id = (String) session.getAttribute("id");
		System.out.println("id=>"+id);
		List<MallSaleDto> list = dao.getMallBuyList(id);
		model.addAttribute("list",list);
		System.out.println("model=>"+model.toString());
		return "mall/mall_sale";
	}
	@RequestMapping(value = "/mallSale", method = RequestMethod.GET)
	public String mallProSale() {
		return "mall/mall_sale";
	}
/*	@RequestMapping(value = "/mallSale", method = RequestMethod.POST)
	public String mallProSale(Model model
							,@RequestParam(value="id", required=true) String id) {
		List<MallSaleDto> list = dao.getMallBuyList(id);
		model.addAttribute(list);
		return "mall/mall_sale";
	}*/
	
	@RequestMapping(value = "/mallMain", method = RequestMethod.GET)
	public String mallMain() {
		return "mall/mall_main";
	}
	@RequestMapping(value="/validCooContractCode", method = RequestMethod.POST)
	public @ResponseBody String cooContractCode(@RequestParam(value="cooContractCode", required=true) String cooContractCode){
		System.out.println("controller 할인코드확인 => " + cooContractCode);
		String vaildDC = dao.getCooContractCode(cooContractCode);
		if(vaildDC == null){
			vaildDC = "";
		}
        System.out.println("할인코드확인 받아온 코드 == "+vaildDC);
        return vaildDC;  //아이디중복체크후 화면 그대로
    }

}