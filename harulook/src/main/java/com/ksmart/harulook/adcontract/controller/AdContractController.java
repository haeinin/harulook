package com.ksmart.harulook.adcontract.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ksmart.harulook.adcontract.service.AdContractDao;
import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.adrefund.service.AdRefundDao;
import com.ksmart.harulook.adrefund.service.AdRefundDto;


@Controller
public class AdContractController {
	@Autowired
	private AdContractDao adcontractdao;
	
	@Autowired
	private AdRefundDao adrefunddao;
	/************/
	
/* 세션 적용전 사용하던 코드
 * 	@RequestMapping(value="/adContractListAdmin",method = RequestMethod.GET)
	public String adContractListAdmin(HttpSession session) {
		session.setAttribute("SA", "관리자");
		System.out.println("SA : " + session.getAttribute("SA"));
		return "ad/contract/ad_contract_list_in";
	}
	@RequestMapping(value="/adContractListAdUser",method = RequestMethod.GET)
	public String adContractListAdUser(HttpSession session) {
		session.setAttribute("SA", "광고주");
		session.setAttribute("SID", "id001");
		System.out.println("SA : " + session.getAttribute("SA"));
		System.out.println("SID : " + session.getAttribute("SID"));
		return "ad/contract/ad_contract_list_in";
	} 
<<<<<<< HEAD
	@RequestMapping(value="/adContractList",method = RequestMethod.GET)
=======
	
	/*@RequestMapping(value="/adContractList",method = RequestMethod.GET)
>>>>>>> refs/remotes/origin/kmg880311
	public String adContractList() {
		return "ad/contract/ad_contract_list";
	} */

	/*광고리스트 요청*/

	@RequestMapping(value="/adContractList",method = RequestMethod.GET)
	public String adContractList(Model model, HttpSession session) {
		System.out.println("광고 계약 현황 리스트 요청");
		List<AdContractDto> adcontractlist = null;
		AdContractDto adContractPlace1 = adcontractdao.getAdContractListCurrentPlace1();
		AdContractDto adContractPlace2 = adcontractdao.getAdContractListCurrentPlace2();
		AdContractDto adContractPlace3 = adcontractdao.getAdContractListCurrentPlace3();
		
		System.out.println("현재 진행중인 광고 리스트 요청");
		String SA = (String)session.getAttribute("level");
		String SID = (String)session.getAttribute(("id"));

			System.out.println(SA);
			System.out.println(SID);

		if(SA.equals("관리자")){
			adcontractlist = adcontractdao.getAdContractList();
			System.out.println("권한 : " + SA + "모든광고 계약 리스트 출력");
		}else if(SA.equals("사업자")){
			adcontractlist = adcontractdao.getAdContractList(SID);
			System.out.println("권한 : " + SA + "광고주 ID에 해당하는 계약 리스트 출력");
		}
		model.addAttribute("adcontractlist", adcontractlist);
		model.addAttribute("adContractPlace1",  adContractPlace1);
		model.addAttribute("adContractPlace2",  adContractPlace2);
		model.addAttribute("adContractPlace3",  adContractPlace3);
		System.out.println(model.toString());
		return "ad/contract/ad_contract_list";
	}
	/*광고 계약 입력 화면요청*/
	@RequestMapping(value="/adContractInsert",method = RequestMethod.GET)
	public String adContractInsertForm(){
		System.out.println("광고 계약 입력 화면 요청");
		return "ad/contract/ad_contract_insert";
	}
	/*광고 계약 입력 요청*/
	@RequestMapping(value="/adContractInsert",method = RequestMethod.POST)
	public String adContractInsert(AdContractDto adcontract,@RequestParam("adDcNo") String adDcNo, Model model, HttpSession session) throws ParseException {
		System.out.println("세션에 담긴 아이디 : " + (String)session.getAttribute("id"));
		String lastContractNo=adcontractdao.getContractNo();
		int initContractNo=1;
		int date = 0;
		if(lastContractNo!=null){
			initContractNo=Integer.parseInt(lastContractNo)+1;
		}	
		if(adDcNo.equals("ad_dc_01")){
			date = 3;
		}else if(adDcNo.equals("ad_dc_02")){
			date = 7;
		}else if(adDcNo.equals("ad_dc_03")){
			date = 30;
		}
		/*세션을 아직 쓰지 못하므로 임시로 문자열 입력*/
		adcontract.setUserId((String)session.getAttribute("id"));
		System.out.println(adcontract.getUserId());
		adcontract.setAdContractNo("ad_contract_"+initContractNo);
/*		날씨 더하는 코드 시작
		SimpleDateFormat dateformat = new SimpleDateFormat ("yy-mm-dd");
		System.out.println(adcontract.getAdContractStart());
		Date startdate = dateformat.parse(adcontract.getAdContractStart());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(startdate);
		calendar.add(Calendar.DAY_OF_MONTH, date);	
		String enddate = dateformat.format(calendar.getTime());
		System.out.println("계산된 enddate : " + enddate);
		adcontract.setAdContractEnd(enddate);
		System.out.println(date);
		System.out.println(adcontract);*/
		adcontractdao.insertAdContract(adcontract);
		System.out.println("adContract 입력 완료");
		model.addAttribute("contractNo", adcontract.getAdContractNo());
		model.addAttribute("priceTotal", adcontract.getAdContractPrice());
		System.out.println(model);
		return "ad/pay/ad_pay";
	}

	/*광고 종류를 선택했을때 해당광고별 금액 산출(AJAX)*/
	@RequestMapping(value="/getPrice",method = RequestMethod.POST)
	@ResponseBody
	public String getPrice(@RequestParam("adtype") String adtype) {
		System.out.println("광고종류별 금액 요청");
		System.out.println(adtype);
		String price = adcontractdao.getPrice(adtype);
		System.out.println("광고 금액 : " + price);
		return price;
	}
	/*계약기간을 선택헀을때 기간별 할인율 산출(AJAX)*/
	@RequestMapping(value="/getDc",method = RequestMethod.POST)
	@ResponseBody
	public String getDc(@RequestParam("adCostNo") String dc) {
		System.out.println("계약일별 수수료 비율 요청");
		System.out.println(dc);
		String dcrate = adcontractdao.getDc(dc);
		return dcrate;
	}
	/*광고주가 광고 승인전 계약 취소를 요청했을때*/
	@RequestMapping(value="/deleteContract", method = RequestMethod.GET)
	public String modifyContractStat(@RequestParam("adContractNo") String adcontractno) {
		System.out.println("adContractNo : " + adcontractno );
		adcontractdao.modifyContractStat(adcontractno);
		System.out.println("취소 요청 완료");
		return "redirect:/adContractList";
	}
	/*광고주가 요청한 광고를 관리자가 승인할때*/
	@RequestMapping(value="/approveContract",method = RequestMethod.GET)
	public String approveContract(@RequestParam("adContractNo") String adcontractno) {
		System.out.println("adContractNo : " + adcontractno);
		adcontractdao.approveContractStat(adcontractno);
		System.out.println("광고 승인 완료");
		return "redirect:/adContractList";	
	} 
	/*광고주가 계약취소를 요청하고 관리자가 계약취소를 승인할때*/
	@RequestMapping(value="/approveCancel",method = RequestMethod.GET)
	public String approveCancel(@RequestParam("adContractNo") String adcontractno
							   ,@RequestParam("adConTractPrice") int adcontractprice) {
		System.out.println("adContractNo : " + adcontractno);
		adcontractdao.approveCancel(adcontractno);
		System.out.println("계약 취소 승인 완료");
		int initRefundNo = 1;
		String lastRefundNo = adrefunddao.getRefundNo();
		if(lastRefundNo != null){
			initRefundNo = Integer.parseInt(lastRefundNo) + initRefundNo;
		}
		AdRefundDto adrefund = new AdRefundDto();
		adrefund.setRefundNo("refund_"+initRefundNo);
		adrefund.setAdContractNo(adcontractno);
		adrefund.setRefundPrice(adcontractprice);
		adrefunddao.insertRefund(adrefund);
		System.out.println("환불정보 입력 완료");
		return "redirect:/adContractList";	
	} 

}