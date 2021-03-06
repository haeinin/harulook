package com.ksmart.harulook.partner.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.member.service.MemberDto;
import com.ksmart.harulook.partner.service.PartnerBillDto;
import com.ksmart.harulook.partner.service.PartnerDto;
import com.ksmart.harulook.partner.service.PartnerInterface;
import com.ksmart.harulook.partner.service.PartnerPayDto;
import com.ksmart.harulook.partner.service.PartnerStatsDto;
import com.ksmart.harulook.util.UtilFile;

@Controller
public class PartnerController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private PartnerInterface partnerDao;

	/*제휴계약 신청처리*/
	@RequestMapping(value = "/partnerContractInsert", method = RequestMethod.POST)
	public String partnerContractInsert(PartnerDto dto
										,HttpSession session
										,HttpServletRequest request
										,@RequestParam("uploadFile") MultipartFile uploadFile
										,MultipartHttpServletRequest multipartRequest) {
		
		/*로그인한 아이디*/
		String id = (String)session.getAttribute("id");
		dto.setUserId(id);
		/*제휴계약번호 자동입력*/
		String lastCooContractNo = partnerDao.selectLastCooContractNo();
		log.debug("컨트롤러"+lastCooContractNo);
		int setNo = 1;
		if(lastCooContractNo != null){
			setNo = Integer.parseInt(lastCooContractNo)+1;
		}
		dto.setCooContractNo("coo_contract_"+setNo);
		/*제휴쿠폰코드 랜덤생성*/
		String cooContractCode = getRandomCode();
		/*제휴쿠폰코드 중복체크*/
		while(partnerDao.selectDuplicateCode(cooContractCode) > 0){
			cooContractCode = getRandomCode();
		}
		/*이미지파일 업로드*/
		log.debug("1번 : " + uploadFile);
		UtilFile util = new UtilFile();
		String uploadPath = util.fileUpload(multipartRequest, uploadFile);
		dto.setCooContractImg(uploadPath.substring(61));
		log.debug("2번 : " + uploadFile);
		/*---------------------*/
		dto.setCooContractCode(cooContractCode);
		partnerDao.insertCooContract(dto);
		log.debug("제휴계약신청완료");
		return "redirect:/partnerContractList";
	}
	/*제휴계약신청 폼 요청*/
	@RequestMapping(value = "/partnerContractInsert", method = RequestMethod.GET)
	public String partnerContractInsert() {
		log.debug("제휴계약 신청 폼 요청");
		return "partner/contract/partner_contract_insert";
	}
	/*제휴계약신청 폼 요청(신규)*/
	@RequestMapping(value = "/partnerContractNewInsert", method = RequestMethod.GET)
	public String partnerContractNewInsert() {
		return "partner/contract/partner_contract_insert2";
	}
	
	/*제휴계약신청 승인하기*/
	@RequestMapping(value = "/partnerContractAdmit", method = RequestMethod.GET)
	public String cooContractAdmit(PartnerDto dto){
		log.debug("제휴계약신청 승인하기");
		partnerDao.updateCooContractAdmit(dto);
		return "redirect:/partnerContractAllList";
	}
	/*제휴계약 전체목록보기(관리자)*/
	@RequestMapping(value = "/partnerContractAllList", method = RequestMethod.GET)
	public String partnerContractAllList(Model model) {
		List<PartnerDto> list = partnerDao.selectCooContractList();
		model.addAttribute("list",list);
		log.debug("제휴계약컨트롤러 리스트보기");
		return "partner/contract/partner_contract_list";
	}
	/*제휴계약 목록보기(개인)*/
	@RequestMapping(value = "/partnerContractList", method = RequestMethod.GET)
	public String partnerContractList(Model model
									,HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<PartnerDto> list = partnerDao.selectCooContractList(id);
		model.addAttribute("list",list);
		log.debug("제휴계약컨트롤러 리스트보기");
		return "partner/contract/partner_contract_list";
	}
	/*제휴계약 상세보기*/
	@RequestMapping(value="/partnerContractDetail", method = RequestMethod.GET)
    public String boardView(Model model
                            , @RequestParam(value="cooContractNo", required=true) String cooContractNo) {
		PartnerDto dto = partnerDao.selectCooContractDetail(cooContractNo);
        model.addAttribute("dto", dto);
        String userId=dto.getUserId();
        log.debug("userId 상세보기"+userId);
        MemberDto Mdto = partnerDao.selectCooContractCompany(userId);
        model.addAttribute("Mdto", Mdto);
        log.debug("제휴계약컨트롤러 상세보기");
        return "partner/contract/partner_contract_detail";
    }

	/*제휴계약 수정처리*/
	@RequestMapping(value = "/partnerContractUpdate", method = RequestMethod.POST)
	public String partnerContractUpdate(PartnerDto dto) {
		partnerDao.updateCooContract(dto);
		log.debug("제휴계약 수정처리");
		return "redirect:/partnerContractDetail?cooContractNo="+dto.getCooContractNo();

	}

	/*제휴계약 수정 폼 요청*/
	@RequestMapping(value = "/partnerContractUpdate", method = RequestMethod.GET)
	public String partnerContractUpdate(Model model
										,@RequestParam(value="cooContractNo",required=true) String cooContractNo){
		PartnerDto dto = partnerDao.selectCooContractDetail(cooContractNo);
		model.addAttribute("dto", dto);
		log.debug("제휴계약 수정 폼 요청");
		return "partner/contract/partner_contract_update";
	}
	/*결제예정 제휴수수료 보기*/
	@RequestMapping(value = "/partnerContractBillList", method = RequestMethod.GET)
	public String partnerContractBillList(Model model
										,HttpSession session){
		String cooContractNo = (String) session.getAttribute("setNo");
		List<PartnerBillDto> list = partnerDao.selectCooContractBill(cooContractNo);
		model.addAttribute("list",list);
		log.debug("제휴결제예정수수료보기");
		return "partner/pay/partner_bill_list";
	}
	/*제휴정지계약 전용 페이지*/
	@RequestMapping(value = "/partnerOverdue", method = RequestMethod.GET)
	public String partnerOverdue(Model model
								,HttpSession session
								,String setNo){
		session.setAttribute("setNo", setNo);
		log.debug("setNo======================>"+setNo);
		String cooContractNo = (String) session.getAttribute("setNo");
		log.debug("세션======================>"+cooContractNo);
		List<PartnerBillDto> list = partnerDao.selectCooContractBill(cooContractNo);
		model.addAttribute("list",list);
		log.debug("미납자 페이지");
		return "partner/pay/partner_overdue";
	}
	
	/*제휴수수료결제처리*/
	@RequestMapping(value = "/partnerContractPay", method = RequestMethod.POST)
	public String partnerContractPay(PartnerBillDto dto){
		log.debug("제휴결제처리(insert-update-delete)");
		log.debug(dto.toString());
		partnerDao.insertCooContractPay(dto);
		partnerDao.updateCooContractPayStat(dto);
		partnerDao.updateCooContractRelieve(dto);
		partnerDao.deleteCooContractBill(dto);
		return "partner/pay/partner_pay_list";
	}
	
	/*제휴수수료결제 내역보기*/
	@RequestMapping(value = "/partnerPayList", method = RequestMethod.GET)
	public String partnerPayList(Model model
								,HttpSession session){

		String cooContractNo = (String) session.getAttribute("setNo");
		List<PartnerPayDto> list = partnerDao.selectCooContractPayList(cooContractNo);
		model.addAttribute("list",list);
		log.debug("제휴결제내역보기");

		return "partner/pay/partner_pay_list";
	}


	/*제휴수수료결제 폼 요청*/
	@RequestMapping(value = "/partnerContractPayInsert", method = RequestMethod.GET)
	public String partnerContractPayInsert(Model model
			,@RequestParam(value="cooBillNo",required=true) String cooBillNo){
		PartnerBillDto dto = partnerDao.selectCooContractPayForm(cooBillNo);
		model.addAttribute("dto",dto);
		return "partner/pay/partner_pay_insert";
		
	}
	
	/*통계를 볼 제휴업체 리스트*/
	@RequestMapping(value = "/partnerStatsMain", method = RequestMethod.GET)
	public String partnerStatsMain(Model model
			, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		List<PartnerDto> list = partnerDao.selectCooContractList(id);
		model.addAttribute("list", list);
		
		return "partner/statistics/partner_statistics_list";
	}

	
	
	/*제휴업체 통계보기 메인화면*/
	@RequestMapping(value = "/StatsView", method = RequestMethod.GET)
	public String StatsView(Model model) {

		return "partner/statistics/statistics_header";

	}
	
	/*제휴업체사이트 일별 방문자 그래프*/
	@RequestMapping(value = "/daily", method = RequestMethod.GET)
	public String daily(Model model,HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		model.addAttribute("cooContractNo",cooContractNo);
		return "partner/statistics/partner_statistics_daily";

	}
	/*제휴업체사이트 월별 방문자 그래프*/
	@RequestMapping(value = "/monthly", method = RequestMethod.GET)
	public String monthly(Model model
			,HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		model.addAttribute("cooContractNo",cooContractNo);
		return "partner/statistics/partner_statistics_monthly";

	}

	/*제휴업체사이트 주별 방문자 조회(*/
	@RequestMapping(value = "/getWeeklyVisitorTable", method = RequestMethod.GET)
	public String getWeeklyVisitorTable(Model model,HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		List<PartnerStatsDto> list= partnerDao.selectWeeklyVisitor(cooContractNo);
		model.addAttribute("list",list);
		model.addAttribute("cooContractNo",cooContractNo);
		log.debug("table"+list.toString());
		return "partner/statistics/partner_statistics_weekly";

	}

	/*제휴업체계약시 쿠폰랜덤생성기(소문자 10자리)*/
	public String getRandomCode(){
		Random random = new Random();
		StringBuffer randomCode = new StringBuffer();
		for (int i = 1; i <= 10; i++) {
			randomCode.append((char)((int)(random.nextInt(26))+97));
		    }
		String cooContractCode=randomCode.toString();
		return cooContractCode;
	}
	
	/*제휴계약업체 구매 비율보기*/
	@RequestMapping(value = "/getBuyRate", method = RequestMethod.GET)
	public String getBuyRate(Model model) {
		List<String> proList = partnerDao.selectMallProNo();
		List<HashMap<String, Integer>> m = new ArrayList<HashMap<String, Integer>>();
		
		for (int i = 0; i < proList.size(); i++) {
			String mallProNo = proList.get(i);
			log.debug("mallPro=" + mallProNo);
			HashMap<String, Integer> map = partnerDao.selectBuyCount(mallProNo);
			float total = map.get("total");
			float influx = map.get("influx");
			int rate = 0;
			if (total != 0 && influx != 0) {
				log.debug("if문실행");
				rate = (int)((influx / total) * 100);

				log.debug("map의 rate값=" + rate);
			}
			map.put("rate", rate);
			log.debug("map의 total값=" + map.get("total"));
			log.debug("map의 influx값=" + map.get("influx"));
			m.add(map);

		}
		model.addAttribute("m", m);
		model.addAttribute("proList",proList);
		return "partner/statistics/partner_statistics_rate";
	}
	
	/*(1)제휴계약번호 선택하기*/
	@RequestMapping(value = "/partnerHome", method = RequestMethod.GET)
	public String part(Model model
								,HttpSession session){
		
		String id = (String) session.getAttribute("id");
		List<PartnerDto> list = partnerDao.selectCooContractList(id);
		model.addAttribute("list", list);

		return "partner/partner_home";
	}
	
	/*(2)제휴계약메뉴*/
	@RequestMapping(value = "/partnerMain", method = RequestMethod.GET)
	public String partnerMain(Model model
								,HttpSession session
								,String setNo){
		session.setAttribute("setNo", setNo);
		return "partner/partner_main";
	}
	
	
}
 
