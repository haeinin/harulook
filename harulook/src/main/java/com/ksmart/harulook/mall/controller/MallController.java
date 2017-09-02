package com.ksmart.harulook.mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.mall.service.MallDao;
import com.ksmart.harulook.mall.service.MallDto;
import com.ksmart.harulook.mall.service.MallSaleDto;
import com.ksmart.harulook.mall.service.MallVisitorDto;


@Controller
public class MallController {

	@Autowired
	private MallDao dao;

	/*상품상세보기*/
	@RequestMapping(value = "/mallDetail", method = RequestMethod.GET)
	public String mallDetail(Model model, @RequestParam(value = "mallProNo", required = true) String mallProNo) {
		MallDto dto = dao.getMallPro(mallProNo);
		model.addAttribute("dto", dto);
		System.out.println("controller : " + mallProNo);
		return "mall/mall_detail";

	}
	/*상품주문 폼 요청*/
	@RequestMapping(value = "/mallProOrder", method = RequestMethod.GET)
	public String mallProOrder(Model model, @RequestParam(value = "mallProNo", required = true) String mallProNo) {
		MallDto dto = dao.getMallPro(mallProNo);
		model.addAttribute("dto", dto);
		return "mall/mall_order_insert";
	}
	/*상품구매처리 와 구매한 내역보기*/
	@RequestMapping(value = "/mallProOrder", method = RequestMethod.POST)
	public String mallProOrder(MallSaleDto dto
				,HttpSession session
				,Model model) {
		String id = (String) session.getAttribute("id");
		System.out.println("id=>"+id);
		
		if(id == null){
			System.out.println("if문실행");
			System.out.println(dto.getMallProNo());
			dao.insertMallSaleNon(dto);
			
		}else{
			System.out.println("else문실행");
			dto.toString();
			dto.setUserId(id);
			dto.toString();
			dao.insertMallSale(dto);
		}
		MallSaleDto getDto = dao.getMallBuyNow();
		model.addAttribute("getDto",getDto);
		
		
		System.out.println("model=>"+model.toString());
		return "mall/mall_sale";
	}
	

	/*아이디별 상품 구매 내역보기*/
	@RequestMapping(value = "/mallOrderList", method = RequestMethod.GET)
	public String mallOrderList(HttpSession session,Model model) {

		String id = (String) session.getAttribute("id");
		System.out.println("id=>"+id);
		
		List<MallSaleDto> list = dao.getMallBuyList(id);
		model.addAttribute("list",list);
		
		return "mall/mall_order_list";
	}

	/*쇼핑몰 메인화면*/
	@RequestMapping(value = "/mallMain", method = RequestMethod.GET)
	public String mallMain() {
		return "mall/mall_main";
	}

	@RequestMapping(value="/insertMallVisitor", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String insertMallVisitor(HttpServletRequest request
									,HttpSession session
									,@RequestParam("ip") String ip ) {
		
        System.out.println("컨트롤러:방문자 IP => " + ip);
        
        /*제휴계약번호 자동입력*/
		String lastMallVisitor = dao.getLastMallVisitor();
		int setNo = 1;
		if(lastMallVisitor != null){
			setNo = Integer.parseInt(lastMallVisitor)+1;
		}
		MallVisitorDto dto = new MallVisitorDto();	
		dto.setMallVisitorNo("coo_visitor_"+setNo);
		/***********************/
		dto.setMallVisitorIp(ip);
		String influx = (String)session.getAttribute("influx");//유입경로를 체크
		dto.setMallVisitorInflux(influx);
		
		dto.setCooContractNo("coo_contract_1");
		dao.insertMallVisitor(dto);
		
        return "mall/mall_main";
	}
}