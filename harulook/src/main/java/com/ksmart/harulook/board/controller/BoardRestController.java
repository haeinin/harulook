package com.ksmart.harulook.board.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.ksmart.harulook.board.service.BoardDao;
import com.ksmart.harulook.board.service.BoardDto;

// RestController를 이용한 ajax 처리
@RestController
public class BoardRestController {

	@Autowired
	private BoardDao boardDao;
	
	/* sns 게시물 검색 ajax 처리 */
	@RequestMapping(value="/boardSearchList", method = RequestMethod.GET)
	public List<BoardDto> boardSearchList(BoardDto board
			,HttpServletRequest request) {
		System.out.println("boardSearchList 요청");
		
		String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
		
		System.out.println("colorValue : "+colorValue);
		System.out.println("styleValue : "+styleValue);
		System.out.println("situationValue : "+situationValue);
		
		board.setColorValue(colorValue);
		board.setStyleValue(styleValue);
		board.setSituationValue(situationValue);
		if(board.getSnsBoardAge().equals("")) {
			board.setSnsBoardAge(null);
		} 
		if(board.getSnsBoardLoc().equals("")) {
			board.setSnsBoardLoc(null);
		} 
		if(board.getSnsBoardSize().equals("")) {
			board.setSnsBoardSize(null);
		}
		if(board.getSnsBoardTall().equals("")) {
			board.setSnsBoardTall(null);
		}
		if(board.getSnsBoardWeather().equals("")) {
			board.setSnsBoardWeather(null);
		}
		System.out.println("boardSearchList --> "+board);
		List<BoardDto> list = boardDao.boardSearchList(board);
		System.out.println("boardSearchList --> "+list);
		return list;
	}
}
