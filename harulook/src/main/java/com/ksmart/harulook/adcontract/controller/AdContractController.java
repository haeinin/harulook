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
	
	
	@RequestMapping(value="/adContractInsertForm",method = RequestMethod.GET)
	public String adContractInsertForm() {
		System.out.println("광고 계약 입력 폼 요청");
		return "ad/contract/ad_contract_insert";
	}
	
	@RequestMapping(value="/adContractListAdmin",method = RequestMethod.GET)
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
	
	/*@RequestMapping(value="/adContractList",method = RequestMethod.GET)
	public String adContractList() {
		return "ad/contract/ad_contract_list";
	} */
	@RequestMapping(value="/adContractList",method = RequestMethod.GET)
	public String adContractList(Model model, HttpSession session) {
		System.out.println("광고 계약 현황 리스트 요청");
		List<AdContractDto> adcontractlist = null;
		List<AdContractDto> adcontractcurrentlist = adcontractdao.getAdContractListCurrent();
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
		model.addAttribute("adcontractcurrentlist",adcontractcurrentlist);
		model.addAttribute("adcontractlist", adcontractlist);
		System.out.println(model.toString());
		return "ad/contract/ad_contract_list";
	}
	@RequestMapping(value="/adContractInsert",method = RequestMethod.POST)
	public String adContractInsert(AdContractDto adcontract,@RequestParam("adDcNo") String adDcNo, Model model) throws ParseException {
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
		adcontract.setUserId("id001");
		adcontract.setAdContractNo("ad_contract_"+initContractNo);
		/*날씨 더하는 코드 시작*/
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
		System.out.println(adcontract);
		adcontractdao.insertAdContract(adcontract);
		System.out.println("adContract 입력 완료");
		model.addAttribute("contractNo", adcontract.getAdContractNo());
		model.addAttribute("priceTotal", adcontract.getAdContractPrice());
		System.out.println(model);
		return "ad/pay/ad_pay";
	}

	
	@RequestMapping(value="/getPrice",method = RequestMethod.POST)
	@ResponseBody
	public String getPrice(@RequestParam("adtype") String adtype) {
		System.out.println("광고종류별 금액 요청");
		System.out.println(adtype);
		String price = adcontractdao.getPrice(adtype);
		return price;
	}
	@RequestMapping(value="/getDc",method = RequestMethod.POST)
	@ResponseBody
	public String getDc(@RequestParam("adCostNo") String dc) {
		System.out.println("계약일별 수수료 비율 요청");
		System.out.println(dc);
		String dcrate = adcontractdao.getDc(dc);
		return dcrate;
	}
	@RequestMapping(value="/deleteContract",method = RequestMethod.GET)
	@ResponseBody
	public String modifyContractStat(@RequestParam("adContractNo") String adcontractno
									,@RequestParam("adConTractPrice") int adcontractprice) {
		
		System.out.println("adContractNo : " + adcontractno );
		adcontractdao.modifyContractStat(adcontractno);
		System.out.println("수정 완료");
		AdRefundDto adrefund = new AdRefundDto();
		adrefund.setRefundStat(adcontractno);
		adrefund.setRefundPrice(adcontractprice);
		adrefunddao.insertRefund(adrefund);
		return "ad/contract/ad_contract_list";
	}
	@RequestMapping(value="/approveContract",method = RequestMethod.GET)
	public String approveContract(@RequestParam("adContractNo") String adcontractno) {
		System.out.println("adContractNo : " + adcontractno);
		adcontractdao.approveContractStat(adcontractno);
		System.out.println("광고 승인 완료");
		return "ad/contract/ad_contract_list";	
	} 
	@RequestMapping(value="/approveCancel",method = RequestMethod.GET)
	public String approveCancel(@RequestParam("adContractNo") String adcontractno) {
		System.out.println("adContractNo : " + adcontractno);
		adcontractdao.approveCancel(adcontractno);
		System.out.println("계약 취소 승인 완료");
		return "ad/contract/ad_contract_list";	
	} 

}