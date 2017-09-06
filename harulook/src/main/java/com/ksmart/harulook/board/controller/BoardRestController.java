package com.ksmart.harulook.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ksmart.harulook.board.service.BoardDao;
import com.ksmart.harulook.board.service.BoardDto;
import com.ksmart.harulook.comment.service.CommentDao;
import com.ksmart.harulook.comment.service.CommentDto;
import com.ksmart.harulook.like.service.LikeDao;

// RestController를 이용한 ajax 처리
@RestController
public class BoardRestController {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private LikeDao likeDao;
	
	/* sns게시물 목록 요청 */
	@RequestMapping(value="/boardListMore", method = RequestMethod.GET)
	public HashMap<String,Object> boardList(
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		System.out.println("boardListMore 요청");
		System.out.println("currentPage : "+currentPage);
		
		int boardCount = boardDao.selectBoardCount();
        int pagePerRow = 9;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
		List<BoardDto> list = boardDao.selectBoardList(currentPage, pagePerRow);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentPage", currentPage);
		map.put("boardCount", boardCount);
		map.put("lastPage", lastPage);
		map.put("list", list);
        System.out.println("boardList : "+map);
		return (HashMap<String, Object>) map;
	}
	
	/* sns 게시물  상세보기 */
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public HashMap<String,Object> boardDetail(HttpSession session
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		System.out.println("boardDeatil 화면 요청");
		BoardDto board = boardDao.selectBoardDetail(boardNo);
		System.out.println("boardNo : "+ boardNo);
		List<CommentDto> commentList = commentDao.selectCommentList(boardNo);
		System.out.println("comment : "+ commentList);
		
		List<String> snsStyle = boardDao.selectBoardStyle(boardNo);
		List<String> snsColor = boardDao.selectBoardColor(boardNo);
		List<String> snsSituation = boardDao.selectBoardSituation(boardNo);
		
		String sessionId = (String)session.getAttribute("id");
		int likeClick = likeDao.selectLikeClick(boardNo, sessionId);
		boolean likeToggle = false;
		if(likeClick == 1) {
			likeToggle = true;
		} else {
			likeToggle = false;
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("snsColor", snsColor);
		map.put("snsSituation", snsSituation);
		map.put("snsStyle", snsStyle);
		map.put("likeToggle", likeToggle);
		map.put("board", board);
		map.put("commentList", commentList);
		return (HashMap<String, Object>) map;
	}
	
	/* sns 게시물 검색 ajax 처리 */
	@RequestMapping(value="/boardSearchList", method = RequestMethod.GET)
	public List<BoardDto> boardSearchList(
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			,BoardDto board
			,HttpServletRequest request) {
		System.out.println("boardSearchList 요청");
		
		int boardCount = boardDao.selectBoardCount();
        int pagePerRow = 9;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
		
		String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
		
		System.out.println("board : "+board);
		System.out.println("colorValue : "+colorValue);
		System.out.println("styleValue : "+styleValue);
		System.out.println("situationValue : "+situationValue);
		
		if(board.getUserId().equals("")) {
			board.setUserId(null);
		} 
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
		List<BoardDto> list = boardDao.selectBoardSearchList(board, currentPage, pagePerRow);
		System.out.println("boardSearchList --> "+list);
		return list;
	}
}
