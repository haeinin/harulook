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
	
	/*나를등록한 팔로우삭제*/
	@RequestMapping(value="/followMeDelete", method = RequestMethod.POST)
	public String followMeDelete(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("followId") String followId ) {
		System.out.println("FollowMeController 팔로우 아이디= " + followId);
        String userId = (String) session.getAttribute("id");
        	System.out.println("FollowMeController 세션 아이디= " + userId);
        followDao.followDelete(followId, userId);	
        	
        return "follow/follow_me_list";  
    }
	
	/*팔로우삭제*/
	@RequestMapping(value="/followDelete", method = RequestMethod.POST)
	public String followDelete(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("followId") String followId ) {
		System.out.println("FollowController 팔로우 아이디= " + followId);
        String userId = (String) session.getAttribute("id");
        	System.out.println("FollowController 세션 아이디= " + userId);
        followDao.followDelete(userId, followId);	
        	
        return "follow/follow_list";  
    }
	
	/*팔로우 미  리스트*/
	@RequestMapping(value="/followMeList", method = RequestMethod.POST)
	public String followMeList(Model model,
				HttpServletRequest request,
				@RequestParam("userId") String followId ) {
		System.out.println("팔로우 미 리스트");
		List<FollowDto> followMeList = followDao.followMeList(followId);	//팔로우 리스트
		model.addAttribute("followMeList", followMeList);
		System.out.println("FollowMeController model == " + model);
		return "follow/follow_me_list"; //방문자 리스트
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
		String checkFollow = followDao.followCheck(userId, followId);	//	친구등록 중복 방지 셀렉트
		model.addAttribute("checkFollow", checkFollow);
			System.out.println("FollowController 팔로우중복체크리턴 == " + model);
		return "follow/follow_test"; 
	}
	
	/*팔로우입력*/
	@RequestMapping(value="/followInsert", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String followInsert(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("followId") String followId ) {
		String userId = (String) session.getAttribute("id");
			System.out.println("세션아이디 == "+ userId);
        String followNo = followDao.followNo();	//팔로우번호 마지막 +1 입력
        	System.out.println("팔로우넘버 == "+ followNo);
        	System.out.println("팔로우아이디 == "+ followId);
    	String checkFollow = followDao.followCheck(userId, followId);	//	친구등록 중복 방지 셀렉트
	    if(checkFollow != null){	//팔로우 이미 된상태이면 추가입력불가
	    	return "home"; 
	    }else if(checkFollow == null){
    		int followInsertNo = 1;    //DB에 등록된 팔로우 없을 때 번호의 초기값
	    	if(followNo != null) {
	    		followInsertNo = Integer.parseInt(followNo)+1;	//마지막no +1
	    		followDao.followInsert("follow_"+followInsertNo, userId, followId);	//팔로우입력 
	    		return "follow/follow_list";
	    	}
	    }
        return "home";  
    }
	////////////////////////////////////////////////////
}
