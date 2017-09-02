package com.ksmart.harulook.point.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.follow.service.FollowDto;
import com.ksmart.harulook.member.service.MemberDto;
import com.ksmart.harulook.point.service.PointDao;
import com.ksmart.harulook.point.service.PointDto;

@Controller
public class PointController {

	@Autowired
    private PointDao pointDao;
	/*
	쿠폰 사용
	@RequestMapping(value="/kuponUse", method = RequestMethod.POST)
	public String kuponUse(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("pointPolicyValue") int pointPolicyValue ) {
		String userId = (String) session.getAttribute("id");
			System.out.println("PointController kuponUse 세션아이디 == "+ userId);
			
        return "home";  
    }*/
	
	/*쿠폰 입력*/
	@RequestMapping(value="/couponUse", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public String couponUse(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam("pointPolicyValue") int pointPolicyValue ) {
		String userId = (String) session.getAttribute("id");
		System.out.println("PointController kuponUse 세션아이디 == "+ userId);
		
		Random rnd = new Random();	//쿠폰번호생성기
	    StringBuffer randomGoodsCode = new StringBuffer();
	    for(int i = 0; i < 10; i++){
	        if(rnd.nextBoolean()){
	        	randomGoodsCode.append((char)((int)(rnd.nextInt(26))+65));
	        }else{
	        	randomGoodsCode.append((rnd.nextInt(10)));
	        }
	    }
	    String pointGoodsCode = randomGoodsCode.toString();	//StringBuffer로 생성된 쿠폰 코드를 데이터베이스에 들어갈수 있도록 String으로 변환
	    String couponCheck = pointDao.couponCheck(pointGoodsCode);	//랜덤생성코드 중복검사
			System.out.println(couponCheck + "  == PointController 랜덤생성코드 중복검사");
		
		while(pointGoodsCode.equals(couponCheck)){	//랜덤생성코드가 중복되면 중복안될때까지 재생성
			for(int i = 0; i < 10; i++){
		        if(rnd.nextBoolean()){
		        	randomGoodsCode.append((char)((int)(rnd.nextInt(26))+65));
		        }else{
		        	randomGoodsCode.append((rnd.nextInt(10)));
		        }
		    }
			couponCheck = pointDao.couponCheck(pointGoodsCode);
		}
		
		/*String pointNo = pointDao.pointNo();	//쿠폰번호 검색 후 마지막 +1 입력
		System.out.println("PointController pointNo = " + pointNo);
		int pointInserNO = 1;    //DB에 등록된 쿠폰 없을 때 번호의 초기값
    	if(pointNo != null) {
    		pointInserNO = Integer.parseInt(pointNo)+1;	//마지막no +1
*/    		pointDao.couponInset(/*"point_"+pointInserNO, */userId, pointPolicyValue, pointGoodsCode);	//쿠폰사용입력 
    	/*	return "point/point_list";
    	}*/
        return "point/point_list";  
    }
	
	
	
	/*포인트 정책 리스트*/
	@RequestMapping(value="/myPoint", method = RequestMethod.GET)
	public String myPoint(Model model,
				HttpSession session,
				HttpServletRequest request,
				@RequestParam(value="currentPageUse", required=false, defaultValue="1") int currentPageUse,
				@RequestParam(value="currentPageGet", required=false, defaultValue="1") int currentPageGet) {
		String userId = (String) session.getAttribute("id");
		List<PointDto> pointPolicy = pointDao.pointPolicy();	//포인트 정책 리스트
		model.addAttribute("pointPolicy", pointPolicy);
			System.out.println("PointController 1 포인트정책 " + pointPolicy);
		
		List<PointDto> pointUsePolicy = pointDao.pointUsePolicy();	//포인트 쿠폰 정책
			System.out.println("PointController 2 쿠폰 정책 " + pointPolicy);
		model.addAttribute("pointUsePolicy", pointUsePolicy);
		
		int pointUseCount = pointDao.pointUseCount(userId);	// 포인트사용내역 게시물 수
		int pagePerRow = 10;
		int lastPageUse = (int)(Math.ceil(pointUseCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        List<PointDto> pointUse = pointDao.pointUse(currentPageUse, pagePerRow, userId);	//포인트 사용 내역
		model.addAttribute("currentPageUse", currentPageUse);
        model.addAttribute("pointUseCount", pointUseCount);
        model.addAttribute("lastPageUse", lastPageUse);
        model.addAttribute("pointUse", pointUse);
			System.out.println("PointController 3 포인트 사용 내역 " + pointUse);
		
		int pointGetCount = pointDao.pointGetCount(userId);	// 포인트취득내역 게시물 수
		int lastPageGet = (int)(Math.ceil(pointGetCount / pagePerRow)+1);	//총 게시물 숫자에 한페이지당 게시물 숫자 나눈값이 총 페이지 숫자
        List<PointDto> pointGet = pointDao.pointGet(currentPageGet, pagePerRow, userId);	//포인트 취득내역
		model.addAttribute("currentPageGet", currentPageGet);
        model.addAttribute("pointGetCount", pointGetCount);
        model.addAttribute("lastPageGet", lastPageGet);
        model.addAttribute("pointGet", pointGet);
			System.out.println("PointController 3 포인트 사용 내역 " + pointGet);	
		
		return "point/point_list"; //포인트 리스트
	}
}
