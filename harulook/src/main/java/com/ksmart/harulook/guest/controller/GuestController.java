package com.ksmart.harulook.guest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.guest.service.GuestDto;
import com.ksmart.harulook.guest.service.GuestInterface;

@Controller
public class GuestController {
	
	@Autowired
    private GuestInterface guestDao;
	
	/*게스트입력*/
	@RequestMapping(value="/guestAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String guestAdd(
			HttpServletRequest request,
			HttpSession session,
			@RequestParam("ip") String ip,
			@RequestParam("apiAdd") String apiAdd ) {
        System.out.println("GuestController 아이피= " + ip);
        String guestSelectIp = guestDao.selectGuest(ip);	//	게스트 중복 방지 셀렉트
    	
        session.setAttribute("apiAdd", apiAdd);	//지역 이름 세션 저장
        System.out.println("GuestController 세션에 저장된 지역 이름 = " + session.getAttribute("apiAdd"));
        if(guestSelectIp != null) {	// 게시트가 중복이면 입력 불가능
        	return "home";
		}else if(guestSelectIp == null) {	//	게스트가 첫방문이면 입력
			String guestSelectNo = guestDao.selectGuestNo(request.getParameter("guestSelectNo"));	//게스트 번호 마지막 +1 입력
	        int guestInsertNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
	    	if(guestSelectNo != null) {
	    		guestInsertNo = Integer.parseInt(guestSelectNo)+1;	//마지막no +1
	    		guestDao.insertGuest(ip, "guest_"+guestInsertNo );	//게스트입력 ip, no
	    		return "home";
	    	}	
    	}
        return "home";  
    }
	
	/*방문자 조회수 리스트*/
	@RequestMapping(value="/guestList", method = RequestMethod.GET)
	public String guestList(Model model) {
		System.out.println("방문자 리스트 폼");
		List<GuestDto> monthlyGuest = guestDao.selectMonthlyGuest();	//월간
		List<GuestDto> weeklyGuest = guestDao.selectWeeklyGuest();	//주간
		List<GuestDto> dailyGuest = guestDao.selectdailyGuest();	//일일
		System.out.println("GuestController dailyGuest == " + dailyGuest);
		
		model.addAttribute("monthlyGuest", monthlyGuest);
		model.addAttribute("weeklyGuest", weeklyGuest);
		model.addAttribute("dailyGuest", dailyGuest);
		System.out.println("GuestController model == " + model);
		return "guest/guest_list"; //방문자 리스트
	}
}
