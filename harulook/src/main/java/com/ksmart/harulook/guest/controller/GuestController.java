package com.ksmart.harulook.guest.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.guest.service.GuestDao;

@Controller
public class GuestController {
	
	@Autowired
    private GuestDao guestDao;
	
	/*게스트입력*/
	@RequestMapping(value="/guestAdd", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String guestAdd(
			HttpServletRequest request,
			@RequestParam("ip") String ip ) {
        System.out.println("GuestController 아이피= " + ip);
        String guestSelectIp = guestDao.guestSelect(ip);	//	게스트 중복 방지 셀렉트
    	
        if(guestSelectIp != null) {	// 게시트가 중복이면 입력 불가능
        	return "home";
		}else if(guestSelectIp == null) {	//	게스트가 첫방문이면 입력
			String guestSelectNo = guestDao.guestSelectNo(request.getParameter("guestSelectNo"));	//게스트 번호 마지막 +1 입력
	        int guestInsertNo = 1;    //DB에 등록된 게시물이 없을 때 번호의 초기값
	    	if(guestSelectNo != null) {
	    		guestInsertNo = Integer.parseInt(guestSelectNo)+1;	//마지막no +1
    		guestDao.guestInsert(ip, "guest_"+guestInsertNo );	//게스트입력 ip, no
    		return "home";
	    	}	
    	}
        return "home";  
    }
	
	/*방문자 조회수 리스트*/
	@RequestMapping(value="/guestList", method = RequestMethod.GET)
	public String guestList(Model model) {
		System.out.println("방문자 리스트 폼");
		String monthlyGuest = guestDao.monthlyGuest();	//월간
		String weeklyGuest = guestDao.weeklyGuest();	//주간
		String dailyGuest = guestDao.dailyGuest();	//일일
		
		model.addAttribute("monthlyGuest", monthlyGuest);
		model.addAttribute("weeklyGuest", weeklyGuest);
		model.addAttribute("dailyGuest", dailyGuest);
			System.out.println("GuestController model == " + model);
		return "guest/guest_list"; //방문자 리스트
	}
}
