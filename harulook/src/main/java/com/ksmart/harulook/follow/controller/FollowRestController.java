package com.ksmart.harulook.follow.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.follow.service.FollowInterface;

@RestController
public class FollowRestController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private FollowInterface followDao;
	
	/////////////////////////////////////////게시판이랑 연동되도록 수정 요망
	/*팔로우 체크*/
	@RequestMapping(value="/followCheck", method = RequestMethod.POST)
	public String followCheck(Model model,
		HttpSession session,
		HttpServletRequest request,
		@RequestParam("followId") String followId ) {
		log.debug("팔로우 체크");
		String userId = (String) session.getAttribute("id");
		/*log.debug("FollowController 세션아이디 == " + userId);
		log.debug("FollowController 원래는게시판아이디 == " + followId);*/
		
		String checkFollow = null;	//게시판 아이디와 로그인 아이디 중복검사
		if(userId == null){
		log.debug("FollowController 아이디 로그인 안했을때 ");
			checkFollow = "samId";	
		}else if(userId.equals(followId)){
		log.debug("FollowController 게시판아이디 로그인아이디같음 ");
			checkFollow = "samId";
		}else{
			checkFollow = followDao.selectFollowCheck(userId, followId);	//	친구등록 중복 방지 셀렉트
		log.debug("FollowController 친구 체크 후 == " +checkFollow);
		}
		/*	model.addAttribute("checkFollow", checkFollow);
		log.debug("FollowController 팔로우중복체크리턴 == " + model);*/
		return checkFollow; 
	}
		
	
}
