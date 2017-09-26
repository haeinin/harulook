package com.ksmart.harulook.adcontract.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.adcontract.service.AdContractDto;
import com.ksmart.harulook.adcontract.service.AdContractInterface;
import com.ksmart.harulook.adrefund.service.AdRefundDto;
import com.ksmart.harulook.adrefund.service.AdRefundInterface;


@Controller
public class AdContractController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AdContractInterface adcontractdao;
	
	@Autowired
	private AdRefundInterface adrefunddao;
	/************/
	@RequestMapping(value="/contractDoingCancel",method = RequestMethod.GET)
	public String contractDoingCancel(@RequestParam("adContractNo") String adcontractno
								   ,@RequestParam("adContractEnd") String adcontractend
								   ,HttpSession session){
		log.debug("진행중인 광고 게시물 취소 요청");
		adcontractdao.updateContractStat(adcontractno);
		AdRefundDto adrefund = new AdRefundDto();
		adrefund.setAdContractNo(adcontractno);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		String date = sdf.format(d);
		Date now = null;
		Date end = null;
		long caldate = 0;
		try {
			now = sdf.parse(date);
			end = sdf.parse(adcontractend);
			caldate = (end.getTime()-now.getTime())/( 24*60*60*1000); 
			caldate = Math.abs(caldate);
			log.debug("잔여 일자 : " + caldate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		adrefund.setRefundPrice(caldate*100000*0.9);
		int initRefundNo = 1;
		String lastRefundNo = adrefunddao.selectAdRefundNo();
		if(lastRefundNo != null){
			initRefundNo = Integer.parseInt(lastRefundNo) + initRefundNo;
		}
		adrefund.setRefundNo("refund_"+initRefundNo);
		adrefund.setUserId((String)session.getAttribute("id"));
		adrefunddao.insertAdRefund(adrefund);
		return "redirect:/adContractList";
	}
	@RequestMapping(value="/contractBadCancel",method = RequestMethod.GET)
	public String contractBadCancel(@RequestParam("adContractNo") String adcontractno
								   ,@RequestParam("adContractEnd") String adcontractend
								   ,HttpSession session){
		log.debug("불량 게시물 광고 취소 요청");
		adcontractdao.updateBadAdContract(adcontractno);
		AdRefundDto adrefund = new AdRefundDto();
		adrefund.setAdContractNo(adcontractno);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();
		String date = sdf.format(d);
		Date now = null;
		Date end = null;
		long caldate = 0;
		try {
			now = sdf.parse(date);
			end = sdf.parse(adcontractend);
			caldate = (end.getTime()-now.getTime())/( 24*60*60*1000); 
			caldate = Math.abs(caldate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		adrefund.setRefundPrice(caldate*100000*0.5);
		int initRefundNo = 1;
		String lastRefundNo = adrefunddao.selectAdRefundNo();
		if(lastRefundNo != null){
			initRefundNo = Integer.parseInt(lastRefundNo) + initRefundNo;
		}
		adrefund.setRefundNo("refund_"+initRefundNo);
		adrefund.setUserId((String)session.getAttribute("id"));
		adrefunddao.insertAdRefund(adrefund);
		return "redirect:/adContractList";
	}
	
	
	
	@RequestMapping(value="/adContractUpdate",method = RequestMethod.POST)
	public String adContractUpdate(AdContractDto adcontract){
		log.debug("계약 수정 요청");
		adcontractdao.updateAdContract(adcontract);
		return "redirect:/adContractList";
	}
	
	
	@RequestMapping(value="/adContractUpdate",method = RequestMethod.GET)
	public String adContractUpdateForm(Model model
								      ,@RequestParam("adContractNo") String adcontractno){
		log.debug("계약 수정 폼 요청");
		AdContractDto adContract = adcontractdao.selectAdContractByContractNo(adcontractno);
		model.addAttribute("adcontract", adContract);
		log.debug(model);
		return "ad/contract/ad_contract_update";
	}
	/*광고리스트 요청*/

	@RequestMapping(value="/adContractList",method = RequestMethod.GET)
	public String adContractList(Model model, HttpSession session) {
		log.debug("광고 계약 현황 리스트 요청");
		List<AdContractDto> adContractListSoon = null;
		List<AdContractDto> adContractListApproveWait = null;
		List<AdContractDto> adContractListAdBoardInsertWait = null;
		List<AdContractDto> adContractCancelRequest = null;
		AdContractDto adContractPlace1 = adcontractdao.selectAdContractListCurrentPlace1();
		AdContractDto adContractPlace2 = adcontractdao.selectAdContractListCurrentPlace2();
		AdContractDto adContractPlace3 = adcontractdao.selectAdContractListCurrentPlace3();
		
		log.debug("현재 진행중인 광고 리스트 요청");
		String SA = (String)session.getAttribute("level");
		String SID = (String)session.getAttribute(("id"));
			log.debug(SA);
			log.debug(SID);
		if(SA.equals("관리자")){
			adContractListSoon = adcontractdao.selectAdContractSoonList();
			adContractListApproveWait = adcontractdao.selectAdContractApproveWaitList();
			adContractListAdBoardInsertWait = adcontractdao.selectAdBoardAdContractStatInsertWaitList();
			adContractCancelRequest = adcontractdao.selectAdContractCancelRequestList();
			log.debug("권한 : " + SA + "모든광고 예정 계약 리스트 출력");
		}else if(SA.equals("사업자")){
			adContractListSoon = adcontractdao.selectAdContractSoonList(SID);
			adContractListApproveWait = adcontractdao.selectAdContractApproveWaitListByUser(SID);
			adContractListAdBoardInsertWait = adcontractdao.selectAdBoardAdContractStatInsertWaitListByUser(SID);
			adContractCancelRequest = adcontractdao.selectAdContractCancelRequestList(SID);
			log.debug("권한 : " + SA + "광고주 ID에 해당하는 광고 예정 계약 리스트 출력");
		}
		model.addAttribute("adcontractsoonlist", adContractListSoon);
		model.addAttribute("adcontractlistapprovewait", adContractListApproveWait);
		model.addAttribute("adcontractadboardinsertwaitlist", adContractListAdBoardInsertWait);
		model.addAttribute("adcontractcancelrequestlist", adContractCancelRequest);
		model.addAttribute("adContractPlace1",  adContractPlace1);
		model.addAttribute("adContractPlace2",  adContractPlace2);
		model.addAttribute("adContractPlace3",  adContractPlace3);
		log.debug(model.toString());
		return "ad/contract/ad_contract_list";
	}
	/*광고 계약 입력 화면요청*/
	@RequestMapping(value="/adContractInsert",method = RequestMethod.GET)
	public String adContractInsertForm(){
		log.debug("광고 계약 입력 화면 요청");
		return "ad/contract/ad_contract_insert";
	}
	/*광고 계약 입력 요청*/
	@RequestMapping(value="/adContractInsert",method = RequestMethod.POST)
	public String adContractInsert(AdContractDto adcontract,@RequestParam("adDcNo") String adDcNo, Model model, HttpSession session) throws ParseException {
		log.debug("세션에 담긴 아이디 : " + (String)session.getAttribute("id"));
		String lastContractNo=adcontractdao.selectContractNo();
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
		log.debug(adcontract.getUserId());
		adcontract.setAdContractNo("ad_contract_"+initContractNo);
/*		날씨 더하는 코드 시작
		SimpleDateFormat dateformat = new SimpleDateFormat ("yy-mm-dd");
		log.debug(adcontract.getAdContractStart());
		Date startdate = dateformat.parse(adcontract.getAdContractStart());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(startdate);
		calendar.add(Calendar.DAY_OF_MONTH, date);	
		String enddate = dateformat.format(calendar.getTime());
		log.debug("계산된 enddate : " + enddate);
		adcontract.setAdContractEnd(enddate);
		log.debug(date);
		log.debug(adcontract);*/
		adcontractdao.insertAdContract(adcontract);
		log.debug("adContract 입력 완료");
		model.addAttribute("contractNo", adcontract.getAdContractNo());
		model.addAttribute("priceTotal", adcontract.getAdContractPrice());
		log.debug(model);
		return "ad/pay/ad_pay";
	}

	/*광고주가 광고 승인전 계약 취소를 요청했을때*/
	@RequestMapping(value="/deleteContract", method = RequestMethod.GET)
	public String modifyContractStat(@RequestParam("adContractNo") String adcontractno) {
		log.debug("adContractNo : " + adcontractno );
		adcontractdao.updateContractStat(adcontractno);
		log.debug("취소 요청 완료");
		return "redirect:/adContractList";
	}
	/*광고주가 요청한 광고를 관리자가 승인할때*/
	@RequestMapping(value="/approveContract",method = RequestMethod.GET)
	public String approveContract(@RequestParam("adContractNo") String adcontractno) {
		log.debug("adContractNo : " + adcontractno);
		adcontractdao.updateContractStatApprove(adcontractno);
		log.debug("광고 승인 완료");
		return "redirect:/adContractList";	
	} 
	/*광고주가 계약취소를 요청하고 관리자가 계약취소를 승인할때*/
	@RequestMapping(value="/approveCancel",method = RequestMethod.GET)
	public String approveCancel(@RequestParam("adContractNo") String adcontractno
							   ,@RequestParam("adConTractPrice") int adcontractprice) {
		log.debug("adContractNo : " + adcontractno);
		adcontractdao.updateContractStatApproveCancel(adcontractno);
		log.debug("계약 취소 승인 완료");
		int initRefundNo = 1;
		String lastRefundNo = adrefunddao.selectAdRefundNo();
		if(lastRefundNo != null){
			initRefundNo = Integer.parseInt(lastRefundNo) + initRefundNo;
		}
		AdRefundDto adrefund = new AdRefundDto();
		adrefund.setRefundNo("refund_"+initRefundNo);
		adrefund.setAdContractNo(adcontractno);
		adrefund.setRefundPrice(adcontractprice);
		adrefunddao.insertAdRefund(adrefund);
		log.debug("환불정보 입력 완료");
		return "redirect:/adContractList";	
	} 

}