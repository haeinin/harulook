package com.ksmart.harulook.adboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.adboard.service.AdBoardDao;
import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adgoods.service.AdGoodsDao;
import com.ksmart.harulook.adgoods.service.AdGoodsDto;

@RestController
public class AdBoardRestController {
	@Autowired
	AdBoardDao adBoardDao;
	@Autowired
	AdGoodsDao adGoodsDao;
	
	/* 광고 계약 게시물  상세보기 */
	@RequestMapping(value="/adBoardDetail", method = RequestMethod.GET)
	public Map<String, Object> adBoardDetail(HttpSession session
            , @RequestParam(value="adBoardNo", required=true) String adBoardNo) {
		System.out.println("adBoardDeatil 화면 요청");
		System.out.println("광고 게시물 번호 : " + adBoardNo);
		AdBoardDto adBoard = adBoardDao.selectBoardDetail(adBoardNo);
		AdGoodsDto[] adGoods = new AdGoodsDto[2];
			adGoods[0] = adGoodsDao.selectAdGoods(adBoard.getAdBoardGoods1());
			adGoods[1] = adGoodsDao.selectAdGoods(adBoard.getAdBoardGoods2());
			System.out.println(adBoard);
			Map<String, Object> adBoardDetail = new HashMap<String, Object>();
			adBoardDetail.put("adBoard", adBoard);
			adBoardDetail.put("adGoods", adGoods);
			System.out.println(adBoardDetail);
			return adBoardDetail;		
	}
}

