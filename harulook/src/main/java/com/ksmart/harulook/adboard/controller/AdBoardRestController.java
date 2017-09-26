package com.ksmart.harulook.adboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adboard.service.AdBoardInterface;
import com.ksmart.harulook.adgoods.service.AdGoodsDto;
import com.ksmart.harulook.adgoods.service.AdGoodsInterface;

@RestController
public class AdBoardRestController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	AdBoardInterface adBoardDao;
	@Autowired
	AdGoodsInterface adGoodsDao;
	
	/* 광고 계약 게시물  상세보기 */
	@RequestMapping(value="/adBoardDetail", method = RequestMethod.GET)
	public Map<String, Object> adBoardDetail(HttpSession session
            , @RequestParam(value="adBoardNo", required=true) String adBoardNo) {
		log.debug("adBoardDeatil 화면 요청");
		log.debug("광고 게시물 번호 : " + adBoardNo);
		AdBoardDto adBoard = adBoardDao.selectBoardDetail(adBoardNo);
		AdGoodsDto[] adGoods = new AdGoodsDto[2];
			adGoods[0] = adGoodsDao.selectAdGoods(adBoard.getAdBoardGoods1());
			adGoods[1] = adGoodsDao.selectAdGoods(adBoard.getAdBoardGoods2());
			log.debug(adBoard);
			Map<String, Object> adBoardDetail = new HashMap<String, Object>();
			adBoardDetail.put("adBoard", adBoard);
			adBoardDetail.put("adGoods", adGoods);
			log.debug(adBoardDetail);
			return adBoardDetail;		
	}
}

