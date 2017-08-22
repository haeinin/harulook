package com.ksmart.harulook.follow.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.follow.service.FollowDao;
import com.ksmart.harulook.follow.service.FollowDto;

@Controller
public class FollowController {

	@Autowired
    private FollowDao followDao;
	
	/*팔로우삭제*/
	@RequestMapping(value="/followDelete", method = RequestMethod.POST)
	public String guestAdd(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("followId") String followId ) {
		System.out.println("FollowController 팔로우 아이디= " + followId);
        String userId = (String) session.getAttribute("id");
        followDao.followDelete(userId, followId);	
        	
        return "follow/follow_list";  
    }
	
	/*팔로우 리스트*/
	@RequestMapping(value="/followList", method = RequestMethod.POST)
	public String followList(Model model,
				HttpServletRequest request,
				@RequestParam("userId") String followId ) {
		System.out.println("팔로우 리스트");
		List<FollowDto> followList = followDao.followList(followId);	//팔로우 리스트
		model.addAttribute("followList", followList);
		System.out.println("FollowController model == " + model);
		return "follow/follow_list"; //방문자 리스트
	}
	
}
