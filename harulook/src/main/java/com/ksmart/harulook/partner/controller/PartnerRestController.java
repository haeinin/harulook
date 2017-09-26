package com.ksmart.harulook.partner.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ksmart.harulook.partner.service.PartnerInterface;
import com.ksmart.harulook.partner.service.PartnerStatsDto;

@RestController
public class PartnerRestController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private PartnerInterface partnerDao;

	/*제휴업체사이트 월별 방문자 조회*/
	@RequestMapping(value = "/getMonthlyVisitor", method = RequestMethod.GET)
	public String getMonthlyVisitor(String cooContractNo) {
		//String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.selectMonthlyVisitor(cooContractNo);
		log.debug(list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 월별 유입방문자 조회*/
	@RequestMapping(value = "/getMonthlyInflux", method = RequestMethod.GET)
	public String getMonthlyInflux(HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.selectMonthlyInflux(cooContractNo);
		log.debug(list.toString());
		return gson.toJson(list);

	}
	
	/*제휴업체사이트 주별 방문자 조회*/
	@RequestMapping(value = "/getWeeklyVisitor", method = RequestMethod.GET)
	public String getWeeklyVisitor(HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.selectWeeklyVisitor(cooContractNo);
		log.debug("그래프"+list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 주별 유입방문자 조회*/
	@RequestMapping(value = "/getWeeklyInflux", method = RequestMethod.GET)
	public String getWeeklyInflux(HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.selectWeeklyInflux(cooContractNo);
		log.debug("그래프"+list.toString());
		return gson.toJson(list);

	}
	
	/*제휴업체사이트 일별 방문자 조회*/
	@RequestMapping(value = "/getDailyVisitor", method = RequestMethod.GET)
	public String getDailyVisitor(HttpSession session, String month){
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		HashMap<String,String> map = new HashMap<String,String>();
		log.debug("cooContractNo==>"+cooContractNo);
		log.debug("month==>"+month);
		
		map.put("cooContractNo",cooContractNo);
		map.put("month", month);
		List<PartnerStatsDto> list= partnerDao.selectDailyVisitor(map);
		
		log.debug("list==>"+list);
		
		return gson.toJson(list);

	}
	/*제휴승인된 배너 불러오기*/
	@RequestMapping(value = "/getBanner", method = RequestMethod.GET)
	public List<HashMap<String, String>> getBanner(Model model) {
		
		List<HashMap<String, String>> map = partnerDao.selectBanner();
		model.addAttribute("m",map);

		return map;
	}
}
