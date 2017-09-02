package com.ksmart.harulook.partner.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ksmart.harulook.partner.service.PartnerDao;
import com.ksmart.harulook.partner.service.PartnerStatsDto;

@RestController
public class PartnerRestController {

	@Autowired
	private PartnerDao partnerDao;

	/*제휴업체사이트 월별 방문자 조회*/
	@RequestMapping(value = "/getMonthlyVisitor", method = RequestMethod.GET)
	public String getMonthlyVisitor(String cooContractNo) {
		//String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.getMonthlyVisitor(cooContractNo);
		System.out.println(list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 월별 유입방문자 조회*/
	@RequestMapping(value = "/getMonthlyInflux", method = RequestMethod.GET)
	public String getMonthlyInflux(HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.getMonthlyInflux(cooContractNo);
		System.out.println(list.toString());
		return gson.toJson(list);

	}
	
	/*제휴업체사이트 주별 방문자 조회*/
	@RequestMapping(value = "/getWeeklyVisitor", method = RequestMethod.GET)
	public String getWeeklyVisitor(HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.getWeeklyVisitor(cooContractNo);
		System.out.println("그래프"+list.toString());
		return gson.toJson(list);

	}
	/*제휴업체사이트 주별 유입방문자 조회*/
	@RequestMapping(value = "/getWeeklyInflux", method = RequestMethod.GET)
	public String getWeeklyInflux(HttpSession session) {
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		List<PartnerStatsDto> list= partnerDao.getWeeklyInflux(cooContractNo);
		System.out.println("그래프"+list.toString());
		return gson.toJson(list);

	}
	
	/*제휴업체사이트 일별 방문자 조회*/
	@RequestMapping(value = "/getDailyVisitor", method = RequestMethod.GET)
	public String getDailyVisitor(HttpSession session, String month){
		String cooContractNo = (String) session.getAttribute("setNo");
		Gson gson = new Gson();
		HashMap<String,String> map = new HashMap<String,String>();
		System.out.println("cooContractNo==>"+cooContractNo);
		System.out.println("month==>"+month);
		
		map.put("cooContractNo",cooContractNo);
		map.put("month", month);
		List<PartnerStatsDto> list= partnerDao.getDailyVisitor(map);
		
		System.out.println("list==>"+list);
		
		return gson.toJson(list);

	}
}
