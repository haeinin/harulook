package com.ksmart.harulook.adboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ksmart.harulook.adboard.service.AdBoardDao;
import com.ksmart.harulook.adboard.service.AdBoardDto;

@RestController
public class AdBoardRestController {
	@Autowired
	AdBoardDao adboardDao;
	/* 광고 게시물  상세보기 */
	@RequestMapping(value="/adboardDetail", method = RequestMethod.GET)
	public AdBoardDto boardDetail(HttpSession session
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		System.out.println("adboardDeatil 화면 요청");
		AdBoardDto board = adboardDao.selectBoardDetail(boardNo);
		System.out.println("boardNo : "+ boardNo);
		return board;
	}

}
