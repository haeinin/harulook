package com.ksmart.harulook.partner.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ksmart.harulook.member.service.MemberDto;
import com.ksmart.harulook.partner.service.PartnerBillDto;
import com.ksmart.harulook.partner.service.PartnerDao;
import com.ksmart.harulook.partner.service.PartnerDto;
import com.ksmart.harulook.partner.service.PartnerStatsDto;

@Controller
public class PartnerController {

	@Autowired
	private PartnerDao dao;

	/*제휴계약 신청처리*/
	@RequestMapping(value = "/partnerContractInsert", method = RequestMethod.POST)
	public String partnerContractInsert(PartnerDto dto) {
		/*제휴계약번호 자동입력*/
		String lastCooContractNo = dao.getLastCooContractNo();
		System.out.println("컨트롤러"+lastCooContractNo);
		int setNo = 1;
		if(lastCooContractNo != null){
			setNo = Integer.parseInt(lastCooContractNo)+1;
		}
		dto.setCooContractNo("coo_contract_"+setNo);
		/********************************************************/
		dao.insertCooContract(dto);
		System.out.println("제휴계약신청완료");
		return "redirect:/partnerContractList";
	}
	/*제휴계약신청 폼 요청*/
	@RequestMapping(value = "/partnerContractInsert", method = RequestMethod.GET)
	public String partnerContractInsert() {
		System.out.println("제휴계약 신청 폼 요청");
		return "partner/contract/partner_contract_insert";
	}
	/*제휴계약신청 승인하기*/
	@RequestMapping(value = "/partnerContractAdmit", method = RequestMethod.POST)
	public String cooContractAdmit(PartnerDto dto){
		System.out.println("제휴계약신청 승인하기");
		dao.updateCooContractAdmit(dto);
		return "redirect:/partnerContractAllList";
	}
	/*제휴계약 전체목록보기(관리자)*/
	@RequestMapping(value = "/partnerContractAllList", method = RequestMethod.GET)
	public String partnerContractAllList(Model model) {
		List<PartnerDto> list = dao.getCooContractList();
		model.addAttribute("list",list);
		System.out.println("제휴계약컨트롤러 리스트보기");
		return "partner/contract/partner_contract_list";
	}
	/*제휴계약 목록보기(개인)*/
	@RequestMapping(value = "/partnerContractList", method = RequestMethod.GET)
	public String partnerContractList(Model model
									,HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<PartnerDto> list = dao.getCooContractList(id);
		model.addAttribute("list",list);
		System.out.println("제휴계약컨트롤러 리스트보기");
		return "partner/contract/partner_contract_list";
	}
	/*제휴계약 상세보기*/
	@RequestMapping(value="/partnerContractDetail", method = RequestMethod.GET)
    public String boardView(Model model
                            , @RequestParam(value="cooContractNo", required=true) String cooContractNo) {
		PartnerDto dto = dao.getCooContractDetail(cooContractNo);
        model.addAttribute("dto", dto);
        String userId=dto.getUserId();
        System.out.println("userId 상세보기"+userId);
        MemberDto Mdto = dao.getCooContractCompany(userId);
        model.addAttribute("Mdto", Mdto);
        System.out.println("제휴계약컨트롤러 상세보기");
        return "partner/contract/partner_contract_detail";
    }

	/*제휴계약 수정처리*/
	@RequestMapping(value = "/partnerContractUpdate", method = RequestMethod.POST)
	public String partnerContractUpdate(PartnerDto dto) {
		dao.updateCooContract(dto);
		System.out.println("제휴계약 수정처리");
		return "redirect:/partnerContractDetail?cooContractNo="+dto.getCooContractNo();

	}

	/*제휴계약 수정 폼 요청*/
	@RequestMapping(value = "/partnerContractUpdate", method = RequestMethod.GET)
	public String partnerContractUpdate(Model model
										,@RequestParam(value="cooContractNo",required=true) String cooContractNo){
		PartnerDto dto = dao.getCooContractDetail(cooContractNo);
		model.addAttribute("dto", dto);
		System.out.println("제휴계약 수정 폼 요청");
		return "partner/contract/partner_contract_update";
	}
	/*제휴결제예정 수수료 보기*/
	@RequestMapping(value = "/partnerContractBillList", method = RequestMethod.GET)
	public String partnerContractBillList(Model model
										,HttpSession session){
		String id = (String) session.getAttribute("id");
		List<PartnerBillDto> list = dao.getCooContractBill(id);
		model.addAttribute("list",list);
		System.out.println("제휴결제예정수수료보기");
		return "partner/pay/partner_bill_list";
	}
	/*제휴결제처리*/
	@RequestMapping(value = "/partnerContractPay", method = RequestMethod.POST)
	public String partnerContractPay(PartnerBillDto dto){
		System.out.println("제휴결제처리(insert-update-delete)");
		System.out.println(dto.toString());
		dao.insertCooContractPay(dto);
		dao.updateCooContractPayStat(dto);
		dao.deleteCooContractBill(dto);
		return "partner/pay/partner_pay_list";
	}

	/*제휴결제 폼 요청*/
	@RequestMapping(value = "/partnerContractPayInsert", method = RequestMethod.GET)
	public String partnerContractPayInsert(Model model
											,@RequestParam(value="cooContractNo",required=true) String cooContractNo){
		PartnerBillDto dto = dao.cooContractPayForm(cooContractNo);
		model.addAttribute("dto",dto);
		return "partner/pay/partner_pay_insert";
		
	}
	
	/*통계를 볼 제휴업체 리스트*/
	@RequestMapping(value = "/partnerStatsMain", method = RequestMethod.GET)
	public String partnerStatsMain(Model model
			, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		List<PartnerDto> list = dao.getCooContractList(id);
		model.addAttribute("list", list);
		
		return "partner/statistics/partner_statistics_list";
	}

	
	
	/*제휴업체 통계보기 메인화면*/
	@RequestMapping(value = "/StatsView", method = RequestMethod.GET)
	public String StatsView(Model model,String cooContractNo) {
		model.addAttribute("cooContractNo",cooContractNo);
		return "partner/statistics/statistics_header";

	}
	
	/*제휴업체사이트 일별 방문자 그래프*/
	@RequestMapping(value = "/daily", method = RequestMethod.GET)
	public String daily(Model model,String cooContractNo) {
		model.addAttribute("cooContractNo",cooContractNo);
		return "partner/statistics/partner_statistics_daily";

	}
	/*제휴업체사이트 월별 방문자 그래프*/
	@RequestMapping(value = "/monthly", method = RequestMethod.GET)
	public String monthly(Model model,String cooContractNo) {
		model.addAttribute("cooContractNo",cooContractNo);
		return "partner/statistics/partner_statistics_monthly";

	}

	
	/*제휴업체사이트 일별 방문자 조회*/
	@RequestMapping(value = "/getDailyVisitor", method = RequestMethod.GET)
	public @ResponseBody String getDailyVisitor(String cooContractNo, String month){

		Gson gson = new Gson();
		HashMap<String,String> map = new HashMap<String,String>();
		System.out.println("cooContractNo==>"+cooContractNo);
		System.out.println("month==>"+month);
		
		map.put("cooContractNo",cooContractNo);
		map.put("month", month);
		List<PartnerStatsDto> list= dao.getDailyVisitor(map);
		
		System.out.println("list==>"+list);
		
		return gson.toJson(list);

	}
	
	/*제휴업체사이트 월별 방문자 조회*/
	@RequestMapping(value = "/getMonthlyVisitor", method = RequestMethod.GET)
	public @ResponseBody String getMonthlyVisitor(String cooContractNo) {
		Gson gson = new Gson();
		List<PartnerStatsDto> list= dao.getMonthlyVisitor(cooContractNo);
		System.out.println(list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 월별 유입방문자 조회*/
	@RequestMapping(value = "/getMonthlyInflux", method = RequestMethod.GET)
	public @ResponseBody String getMonthlyInflux(String cooContractNo) {
		Gson gson = new Gson();
		List<PartnerStatsDto> list= dao.getMonthlyInflux(cooContractNo);
		System.out.println(list.toString());
		return gson.toJson(list);

	}
	
	/*제휴업체사이트 주별 방문자 조회*/
	@RequestMapping(value = "/getWeeklyVisitor", method = RequestMethod.GET)
	public @ResponseBody String getWeeklyVisitor(String cooContractNo) {
		Gson gson = new Gson();
		List<PartnerStatsDto> list= dao.getWeeklyVisitor(cooContractNo);
		System.out.println("그래프"+list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 주별 방문자 조회*/
	@RequestMapping(value = "/getWeeklyInflux", method = RequestMethod.GET)
	public @ResponseBody String getWeeklyInflux(String cooContractNo) {
		Gson gson = new Gson();
		List<PartnerStatsDto> list= dao.getWeeklyInflux(cooContractNo);
		System.out.println("그래프"+list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 주별 방문자 조회(테이블)*/
	@RequestMapping(value = "/getWeeklyVisitorTable", method = RequestMethod.GET)
	public String getWeeklyVisitorTable(Model model,String cooContractNo) {
		List<PartnerStatsDto> list= dao.getWeeklyVisitor(cooContractNo);
		model.addAttribute("list",list);
		model.addAttribute("cooContractNo",cooContractNo);
		System.out.println("table"+list.toString());
		return "partner/statistics/partner_statistics_weekly";

	}
	

	
}
 
