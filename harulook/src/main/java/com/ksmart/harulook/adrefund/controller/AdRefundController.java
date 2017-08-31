package com.ksmart.harulook.adrefund.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.ksmart.harulook.adrefund.service.AdRefundDao;
import com.ksmart.harulook.adrefund.service.AdRefundDto;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDao;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDto;
@Controller
public class AdRefundController {
	@Autowired
	private AdRefundDao adrefunddao;
	
	@RequestMapping(value="/insertRefund",method = RequestMethod.POST)
	@ResponseBody
	public void insertRefund(@RequestParam("conractNo") String contractno
						    ,@RequestParam("contractPrice")int contractprice){
		System.out.println("광고 환불 등록 요청");
		System.out.println("계약 번호 : " + contractno + "계약금액 : " + contractprice);
		AdRefundDto adrefund = new AdRefundDto();
		String lastrefundNo=adrefunddao.getRefundNo();
		int initRefundNo=1;
		if(lastrefundNo != null){
			initRefundNo = Integer.parseInt(lastrefundNo)+1;
		}
		adrefund.setRefundNo("refund_"+initRefundNo);
		adrefund.setAdContractNo(contractno);
		adrefund.setRefundPrice(contractprice);
		adrefunddao.insertRefund(adrefund);
	}
	
	@RequestMapping(value="/selectRefund", method = RequestMethod.GET)
	public String getRefundList(Model model, HttpSession session){
		String SLEVEL = (String)session.getAttribute("level");
		String SID = (String)session.getAttribute("id");
		List<AdRefundDto> adrefundlist = null;
		if(SLEVEL.equals("관리자")){
			adrefundlist = adrefunddao.getRefundList();
		}else if(SLEVEL.equals("사업자")){
			adrefundlist = adrefunddao.getRefundList(SID);
		}
		model.addAttribute("adrefundlist", adrefundlist);
		System.out.println(adrefundlist);
		return "ad/refund/ad_refund_list";
	}
	
	@RequestMapping(value="/insertRefundValue", method = RequestMethod.GET)
	public String insertRefundValueForm(Model model
								   ,@RequestParam("refundNo") String refundNo){
		model.addAttribute("refundNo", refundNo);
		return "ad/refund_pay/ad_refund_pay";
	}
	@RequestMapping(value="/approveRefund", method = RequestMethod.GET)
	public String approveRefund(Model model
							  ,@RequestParam("refundNo") String refundNo){
		System.out.println("환불번호 : " + refundNo);
		model.addAttribute("refundNo", refundNo);
		adrefunddao.approveRefund(refundNo);
		return "redirect:/selectRefund";
	}
	
	
}
		
	
