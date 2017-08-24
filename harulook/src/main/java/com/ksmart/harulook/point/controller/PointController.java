package com.ksmart.harulook.point.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.follow.service.FollowDto;
import com.ksmart.harulook.point.service.PointDao;
import com.ksmart.harulook.point.service.PointDto;

@Controller
public class PointController {

	@Autowired
    private PointDao PointDao;
	
	/*포인트 정책 리스트*/
	@RequestMapping(value="/myPoint", method = RequestMethod.GET)
	public String myPoint(Model model,
				HttpSession session,
				HttpServletRequest request,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		String userId = (String) session.getAttribute("id");
		
		List<PointDto> pointPolicy = PointDao.pointPolicy();	//포인트 정책 리스트
		model.addAttribute("pointPolicy", pointPolicy);
			System.out.println("PointController 1 포인트정책 " + pointPolicy);
		
		List<PointDto> pointUsePolicy = PointDao.pointUsePolicy();	//포인트 쿠폰 정책
			System.out.println("PointController 2 쿠폰 정책 " + pointPolicy);
		model.addAttribute("pointUsePolicy", pointUsePolicy);
		
		List<PointDto> pointUse = PointDao.pointUse(userId);	//포인트 사용 내역
			System.out.println("PointController 3 포인트 사용 내역 " + pointUse);
		model.addAttribute("pointUse", pointUse);
		
		List<PointDto> pointGet = PointDao.pointGet(userId);	//포인트 취득 내역
			System.out.println("PointController 4 포인트 취득 내역 " + pointGet);
		model.addAttribute("pointGet", pointGet);
		
		/*int followListCount = followDao.followListCount(userId);
		int pagePerRow = 10;	// 한페이지에 보여줄 갯수 10개
        int lastPage = (int)(Math.ceil(followListCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
		
		List<FollowDto> followList = followDao.followList(currentPage, pagePerRow, userId);	//팔로우 리스트
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("followListCount", followListCount);
        model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("followList", followList);
		System.out.println("FollowController model == " + model);*/
		return "point/point_list"; //방문자 리스트
	}
}
