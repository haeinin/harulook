package com.ksmart.harulook.point.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.point.service.PointDao;

@RestController
public class PointRestController {
	@Autowired
    private PointDao pointDao;

	/*마이페이지 포인트확인*/
	@RequestMapping(value="/myPagePoint", method = {RequestMethod.GET, RequestMethod.POST})
	public int myPagePoint(
				HttpSession session	) {
		String sessionId = (String) session.getAttribute("id");
		String sessionLevel = (String) session.getAttribute("level");///////////////////////////////////권한별 작동
		if(sessionLevel.equals("일반회원")){
			System.out.println("PointController 일반회원");
			int myPoint = pointDao.myPoint(sessionId);	//로그인 성공시 해당 회원 포인트 받아옴
			System.out.println("PointController 마myPointmyPointmyPointmyPointmyPoint == " + myPoint);
			return myPoint;
		}
		System.out.println("PointController 관리자,사업자");
		return 0; //방문자 리스트
	}
}
