package com.ksmart.harulook.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.board.service.BoardDao;
import com.ksmart.harulook.board.service.BoardDto;
import com.ksmart.harulook.comment.service.CommentDao;
import com.ksmart.harulook.comment.service.CommentDto;
import com.ksmart.harulook.like.service.LikeDao;
import com.ksmart.harulook.point.service.PointDao;
import com.ksmart.harulook.util.UtilFile;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
    private PointDao pointDao;
	
	/* sns게시물 목록 검색 */
	@RequestMapping(value="/myBoardList", method = RequestMethod.POST)
	public String myBoardList(Model model, BoardDto board) {
		System.out.println("boardSearchList 요청");
		System.out.println("boardSearchList --> "+board);
		List<BoardDto> list = boardDao.boardSearchList(board);
		model.addAttribute("list", list);
		System.out.println("boardSearchList --> "+list);
		return "redirect:/boardSearchList";
	}
	
	/* sns게시물 목록 검색 */
	@RequestMapping(value="/oardSearchList", method = RequestMethod.POST)
	public String boardSearchList(Model model, BoardDto board, HttpServletRequest request) {
		System.out.println("boardSearchList 요청");
		String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
		board.setColorValue(colorValue);
		board.setStyleValue(styleValue);
		board.setSituationValue(situationValue);
		System.out.println("boardSearchList --> "+board);
		
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
		model.addAttribute("list", list);
		System.out.println("boardSearchList --> "+list);
		return "sns/board/sns_board_list";
	}
	
	/* sns게시물 삭제 처리 요청 */
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDelete(String boardNo) {
		System.out.println("sns게시물 삭제 요청");
		boardDao.boardDelete(boardNo);
		commentDao.boardCommentDelete(boardNo);
		likeDao.boardLikeDelete(boardNo);
		boardDao.snsColorDelete(boardNo);
		boardDao.snsSituationDelete(boardNo);
		boardDao.snsStyleDelete(boardNo);
		return "redirect:/boardList";
	}
	
	/* sns게시물 수정 처리 요청 */
	@RequestMapping(value="/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(BoardDto board, HttpServletRequest request) {
		System.out.println("boardUpdate 처리 요청");
		
		boardDao.snsColorDelete(board.getSnsBoardNo());
		boardDao.snsSituationDelete(board.getSnsBoardNo());
		boardDao.snsStyleDelete(board.getSnsBoardNo());
		
		String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
		
		if(situationValue != null) {
			String lastSituationNo = boardDao.getLastSituationNo();
			System.out.println("lastSituationNo : "+lastSituationNo);
			for(int i = 0; i<situationValue.length; i++) {
		        int insertSituationNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastSituationNo != null) {
		        	insertSituationNo = Integer.parseInt(lastSituationNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsSituationNo = "sns_situation_"+insertSituationNo;
		        System.out.println("snsSituationNo : "+snsSituationNo);
		        System.out.println("snsBoardNo : "+snsBoardNo);
		        System.out.println("situationValue["+i+"] : "+situationValue[i]);
		        boardDao.SnsSituationInsert(snsSituationNo, snsBoardNo, situationValue[i]);
			}
		}
		
		if(styleValue != null) {
			String lastStyleNo = boardDao.getLastStyleNo();
			for(int i = 0; i<styleValue.length; i++) {
		        int insertStyleNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastStyleNo != null) {
		        	insertStyleNo = Integer.parseInt(lastStyleNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsStyleNo = "sns_style_"+insertStyleNo;
		        boardDao.SnsStyleInsert(snsStyleNo, snsBoardNo, styleValue[i]);
			}
		}
		
		if(colorValue != null) {
			String lastColorNo = boardDao.getLastColorNo();
			for(int i = 0; i<colorValue.length; i++) {
		        int insertColorNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastColorNo != null) {
		        	insertColorNo = Integer.parseInt(lastColorNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsColorNo = "sns_color_"+insertColorNo;
		        boardDao.SnsColorInsert(snsColorNo, snsBoardNo, colorValue[i]);
			}
		}
		
		boardDao.boardUpdate(board);
		return "redirect:/boardDetail?boardNo="+board.getSnsBoardNo();
	}
	
	/* sns게시물 수정 화면 요청 */
	@RequestMapping(value="/boardUpdate", method = RequestMethod.GET)
	public String boardUpdateForm(Model model
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		System.out.println("boardUpdate 화면 요청");
		
		List<String> snsStyle = boardDao.boardStyleSelect(boardNo);
		List<String> snsColor = boardDao.boardColorSelect(boardNo);
		List<String> snsSituation = boardDao.boardSituationSelect(boardNo);
		
		BoardDto board = boardDao.boardDetail(boardNo);
		model.addAttribute("snsColor", snsColor);
		model.addAttribute("snsSituation", snsSituation);
		model.addAttribute("snsStyle", snsStyle);
		model.addAttribute("board", board);
		System.out.println("snsStyle : "+snsStyle);
		return "sns/board/sns_board_update";
	}
	
	/* sns게시물 상세 보기 */
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, HttpSession session
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		System.out.println("boardDeatil 화면 요청");
		BoardDto board = boardDao.boardDetail(boardNo);
		System.out.println("boardNo : "+ boardNo);
		List<CommentDto> commentList = commentDao.commentList(boardNo);
		System.out.println("comment : "+ commentList);
		
		List<String> snsStyle = boardDao.boardStyleSelect(boardNo);
		List<String> snsColor = boardDao.boardColorSelect(boardNo);
		List<String> snsSituation = boardDao.boardSituationSelect(boardNo);
		
		String sessionId = (String)session.getAttribute("id");
		int likeClick = likeDao.getLikeClick(boardNo, sessionId);
		boolean likeToggle = false;
		if(likeClick == 1) {
			likeToggle = true;
		} else {
			likeToggle = false;
		}
		
		model.addAttribute("snsColor", snsColor);
		model.addAttribute("snsSituation", snsSituation);
		model.addAttribute("snsStyle", snsStyle);
		model.addAttribute("likeToggle", likeToggle);
		model.addAttribute("board", board);
		model.addAttribute("commentList",commentList);
		System.out.println("boardDetail : "+ model);
		return "sns/board/sns_board_detail";
	}
	
	/* sns게시물 목록 요청 */
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
	public String boardList(Model model
            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		System.out.println("boardList 폼 요청");
		int boardCount = boardDao.getBoardCount();
        int pagePerRow = 10;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
		List<BoardDto> list = boardDao.boardList(currentPage, pagePerRow);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("list", list);
		return "sns/board/sns_board_list";
	}
	
	 /* sns게시물 입력 처리 요청  */
    @RequestMapping(value="/boardInsert", method = RequestMethod.POST)
    public String boardInsert(BoardDto board
    		,HttpServletRequest request
    		,@RequestParam("uploadFile") MultipartFile uploadFile
    		,MultipartHttpServletRequest multipartRequest) {
    	System.out.println("boardInsert 처리 요청");
    	
    	System.out.println("RewardController reAddProCtrl uploadFile : " + uploadFile);
    	
//      UtilFile 객체 생성
        UtilFile utilFile = new UtilFile();
        
//      파일 업로드 결과값을 path로 받아온다(이미 fileUpload() 메소드에서 해당 경로에 업로드는 끝났음)
        String uploadPath = utilFile.fileUpload(multipartRequest, uploadFile);
        
        System.out.println("RewardController reAddProCtrl uploadPath : " + uploadPath);
    	board.setSnsBoardImg(uploadPath.substring(61));
        
    	String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
    	
		 /******** sns_board_no의 끝 숫자 자동 입력 *****************/
        String lastBoardNo = boardDao.getLastBoardNo();
        int insertBoardNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
        if(lastBoardNo != null) {
        	insertBoardNo = Integer.parseInt(lastBoardNo)+1;
        }
        board.setSnsBoardNo("sns_board_"+insertBoardNo);
        /*************************************************/
		
        if(board.getSnsBoardAge().equals("")) {
			board.setSnsBoardAge(null);
		} 
		if(board.getSnsBoardSize().equals("")) {
			board.setSnsBoardSize(null);
		}
		if(board.getSnsBoardTall().equals("")) {
			board.setSnsBoardTall(null);
		}
        
		if(situationValue != null) {
			String lastSituationNo = boardDao.getLastSituationNo();
			System.out.println("lastSituationNo : "+lastSituationNo);
			for(int i = 0; i<situationValue.length; i++) {
		        int insertSituationNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastSituationNo != null) {
		        	insertSituationNo = Integer.parseInt(lastSituationNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsSituationNo = "sns_situation_"+insertSituationNo;
		        System.out.println("snsSituationNo : "+snsSituationNo);
		        System.out.println("snsBoardNo : "+snsBoardNo);
		        System.out.println("situationValue["+i+"] : "+situationValue[i]);
		        boardDao.SnsSituationInsert(snsSituationNo, snsBoardNo, situationValue[i]);
			}
		}
		
		if(styleValue != null) {
			String lastStyleNo = boardDao.getLastStyleNo();
			for(int i = 0; i<styleValue.length; i++) {
		        int insertStyleNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastStyleNo != null) {
		        	insertStyleNo = Integer.parseInt(lastStyleNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsStyleNo = "sns_style_"+insertStyleNo;
		        boardDao.SnsStyleInsert(snsStyleNo, snsBoardNo, styleValue[i]);
			}
		}
		
		if(colorValue != null) {
			String lastColorNo = boardDao.getLastColorNo();
			for(int i = 0; i<colorValue.length; i++) {
		        int insertColorNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastColorNo != null) {
		        	insertColorNo = Integer.parseInt(lastColorNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsColorNo = "sns_color_"+insertColorNo;
		        boardDao.SnsColorInsert(snsColorNo, snsBoardNo, colorValue[i]);
			}
		}
        boardDao.boardInsert(board);
        
        String pointPolicyNo = "point_ex_1";	//게시물 등록 포인트 no
        int boardPointCheck = boardDao.boardPointCheck(board.getUserId());	//today 게시물 검색
        	System.out.println("BoardController 포인트 입력하기 위한 게시물 검색 = " + boardPointCheck);
        String pointCehck = pointDao.pointCehck(board.getUserId(), pointPolicyNo);	//today 포인트 취득 검색
        	System.out.println("BoardController 포인트 입력하기 위한 오늘 포인트 검색 = " + pointCehck);
       
        if(boardPointCheck > 0 && pointCehck == null){	//하루 + 게시물 1 이상 등록하면 포인트 제공 포인트 중복 취득 불가 조건문
        	System.out.println("BoardController 게시물 등록할때 하루 첫번째 등록 포인트도 같이 등록 ");
        	pointDao.pointGetInsert(board.getUserId(), pointPolicyNo);	//취득포인트입력
        }	
        return "redirect:/boardList";
    }
    
    /* sns게시물 입력 화면 요청 */
	@RequestMapping(value="/boardInsert", method = RequestMethod.GET)
    public String boardInsert() {
        System.out.println("boardInsert 폼 요청");
        return "sns/board/sns_board_insert";
    }
}
