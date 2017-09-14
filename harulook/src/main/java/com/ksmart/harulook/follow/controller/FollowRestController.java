package com.ksmart.harulook.follow.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.follow.service.FollowInterface;

@RestController
public class FollowRestController {

	@Autowired
    private FollowInterface followDao;
	
	/////////////////////////////////////////게시판이랑 연동되도록 수정 요망
	/*팔로우 체크*/
	@RequestMapping(value="/followCheck", method = RequestMethod.POST)
	public String followCheck(Model model,
		HttpSession session,
		HttpServletRequest request,
		@RequestParam("followId") String followId ) {
		System.out.println("팔로우 체크");
		String userId = (String) session.getAttribute("id");
		System.out.println("FollowController 세션아이디 == " + userId);
		System.out.println("FollowController 월래는게시판아이디 == " + followId);
		
		String checkFollow = null;	//게시판 아이디와 로그인 아이디 중복검사
		if(userId == null){
		System.out.println("FollowController 아이디 로그인 안했을때 ");
			checkFollow = "samId";	
		}else if(userId.equals(followId)){
		System.out.println("FollowController 게시판아이디 로그인아이디같음 ");
			checkFollow = "samId";
		}else{
			checkFollow = followDao.selectFollowCheck(userId, followId);	//	친구등록 중복 방지 셀렉트
		System.out.println("FollowController 친구 체크 후 == " +checkFollow);
		}
		/*	model.addAttribute("checkFollow", checkFollow);
		System.out.println("FollowController 팔로우중복체크리턴 == " + model);*/
		return checkFollow; 
	}
		
	
}
