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

import com.ksmart.harulook.adrefund.service.AdRefundDto;
import com.ksmart.harulook.adrefund.service.AdRefundInterface;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDao;
import com.ksmart.harulook.adrefundpay.service.AdRefundPayDto;
@Controller
public class AdRefundController {
	@Autowired
	private AdRefundInterface adrefunddao;
	/*광고 환불 리스트 조회*/
	@RequestMapping(value="/selectRefund", method = RequestMethod.GET)
	public String getRefundList(Model model, HttpSession session){
		String SLEVEL = (String)session.getAttribute("level");
		String SID = (String)session.getAttribute("id");
		List<AdRefundDto> adrefundlist = null;
		if(SLEVEL.equals("관리자")){
			adrefundlist = adrefunddao.selectAdRefundList();
		}else if(SLEVEL.equals("사업자")){
			adrefundlist = adrefunddao.selectAdRefundList(SID);
		}
		model.addAttribute("adrefundlist", adrefundlist);
		System.out.println(adrefundlist);
		return "ad/refund/ad_refund_list";
	}
	/*광고 환불 정보 입력*/
	@RequestMapping(value="/insertRefundValue", method = RequestMethod.GET)
	public String insertRefundValueForm(Model model
								   ,@RequestParam("refundNo") String refundNo){
		model.addAttribute("refundNo", refundNo);
		return "ad/refund_pay/ad_refund_pay";
	}
	/*환불 승인*/
	@RequestMapping(value="/approveRefund", method = RequestMethod.GET)
	public String approveRefund(Model model
							  ,@RequestParam("refundNo") String refundNo){
		System.out.println("환불번호 : " + refundNo);
		model.addAttribute("refundNo", refundNo);
		adrefunddao.updateAdContractStatApproveRefund(refundNo);
		return "redirect:/selectRefund";
	}
	
	
}
		
	
