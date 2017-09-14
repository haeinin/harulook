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

import com.ksmart.harulook.follow.service.FollowDto;
import com.ksmart.harulook.follow.service.FollowInterface;

@Controller
public class FollowController {

	@Autowired
    private FollowInterface followDao;
	
	/*나를등록한 팔로우삭제*/
	@RequestMapping(value="/followMeDelete", method = RequestMethod.POST)
	public String followMeDelete(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("followId") String followId ) {
		System.out.println("FollowMeController 팔로우 아이디= " + followId);
        String userId = (String) session.getAttribute("id");
        System.out.println("FollowMeController 세션 아이디= " + userId);
        followDao.deleteFollow(followId, userId);	
        	
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
        followDao.deleteFollow(userId, followId);	
        	
        return "follow/follow_list";  
    }
	
	/*팔로우 미  리스트*/
	@RequestMapping(value="/followMeList", method = RequestMethod.GET)
	public String followMeList(Model model,
			HttpSession session,
			HttpServletRequest request,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		System.out.println("팔로우 미 리스트");
		String userId = (String) session.getAttribute("id");
		int followListCount = followDao.selectFollowMeListCount(userId);
		int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(followListCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        
		List<FollowDto> followMeList = followDao.selectFollowMeList(currentPage, pagePerRow, userId);	//팔로우 리스트
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("followListCount", followListCount);
        model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("followMeList", followMeList);
		System.out.println("FollowMeController model == " + model);
		return "follow/follow_me_list"; //방문자 리스트
	}
	
	/*팔로우 리스트*/
	@RequestMapping(value="/followList", method = RequestMethod.GET)
	public String followList(Model model,
				HttpSession session,
				HttpServletRequest request,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		System.out.println("팔로우 리스트");
		String userId = (String) session.getAttribute("id");
		int followListCount = followDao.selectFollowListCount(userId);
		int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(followListCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
		
		List<FollowDto> followList = followDao.selectFollowList(currentPage, pagePerRow, userId);	//팔로우 리스트
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("followListCount", followListCount);
        model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("followList", followList);
		System.out.println("FollowController model == " + model);
		return "follow/follow_list"; //방문자 리스트
	}
	
	
	
	/*팔로우입력*/
	@RequestMapping(value="/followInsert", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String followInsert(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("followId") String followId ) {
		String userId = (String) session.getAttribute("id");
		System.out.println("세션아이디 == "+ userId);
        String followNo = followDao.selectFollowNo();	//팔로우번호 마지막 +1 입력
        System.out.println("팔로우넘버 == "+ followNo);
        System.out.println("팔로우아이디 == "+ followId);
    	String checkFollow = followDao.selectFollowCheck(userId, followId);	//	친구등록 중복 방지 셀렉트
	    if(checkFollow != null){	//팔로우 이미 된상태이면 추가입력불가
	    	return "home"; 
	    }else if(checkFollow == null){
    		int followInsertNo = 1;    //DB에 등록된 팔로우 없을 때 번호의 초기값
	    	if(followNo != null) {
	    		followInsertNo = Integer.parseInt(followNo)+1;	//마지막no +1
	    		followDao.insertFollow("follow_"+followInsertNo, userId, followId);	//팔로우입력 
	    		return "follow/follow_list";
	    	}
	    }
        return "home";  
    }
	////////////////////////////////////////////////////
}
