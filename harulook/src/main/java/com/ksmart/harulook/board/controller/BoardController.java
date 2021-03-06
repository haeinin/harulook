package com.ksmart.harulook.board.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ksmart.harulook.board.service.BoardDto;
import com.ksmart.harulook.board.service.BoardInterface;
import com.ksmart.harulook.comment.service.CommentDto;
import com.ksmart.harulook.comment.service.CommentInterface;
import com.ksmart.harulook.follow.service.FollowInterface;
import com.ksmart.harulook.like.service.LikeInterface;
import com.ksmart.harulook.member.service.MemberDto;
import com.ksmart.harulook.member.service.MemberInterface;
import com.ksmart.harulook.point.service.PointInterface;
import com.ksmart.harulook.util.UtilFile;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardInterface boardDao;
	
	@Autowired
	private CommentInterface commentDao;
	
	@Autowired
	private LikeInterface likeDao;
	
	@Autowired
    private PointInterface pointDao;
	
	@Autowired
    private MemberInterface memberDao;
	
	@Autowired
    private FollowInterface followDao;
	
	/* sns게시물 태그 검색 */
	@RequestMapping(value="/boardTagSearch", method = RequestMethod.GET)
	public String boardTagSearch(Model model, BoardDto board, HttpServletRequest request
			, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		log.debug("boardTagSearch 요청");
		String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
		List<String> colorValueList = new ArrayList<String>();
		List<String> styleValueList = new ArrayList<String>();
		List<String> situationValueList = new ArrayList<String>();
		
		if(colorValue != null) {
			Collections.addAll(colorValueList, colorValue);
		}
		if(styleValue != null) {
			Collections.addAll(styleValueList, styleValue);
		}
		if(situationValue != null) {
			Collections.addAll(situationValueList, situationValue);
		}
		
		board.setColorValue(colorValue);
		board.setStyleValue(styleValue);
		board.setSituationValue(situationValue);
		log.debug("boardTagSearch --> "+board);
		
		int popularity = 0;
		int boardCount = boardDao.selectBoardCount();	
        int pagePerRow = 9;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
        int boardSearchCount = 0;
		
		MemberDto userDetail = new MemberDto();	// 내게시물 보기에서 프로필 사진 보기위함
        int followListCount = 0;
        int followMeListCount = 0;
		if(board.getUserId().equals("")) {
			board.setUserId(null);
		}else{
			userDetail = memberDao.selectUserDetail(board.getUserId()); // 내게시물 보기에서 프로필 사진 보기위함
			followListCount = followDao.selectFollowListCount(board.getUserId());	//팔로우수
			followMeListCount = followDao.selectFollowMeListCount(board.getUserId());	//팔로워수
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
		log.debug("boardTagSearch --> "+board);
		List<BoardDto> list = boardDao.selectBoardSearchList(board, currentPage, pagePerRow, popularity);
		boardSearchCount = boardDao.selectBoardSearchListCount(board);
		model.addAttribute("colorValueList",colorValueList);
		model.addAttribute("styleValueList",styleValueList);
		model.addAttribute("situationValueList",situationValueList);
		model.addAttribute("followListCount", followListCount);
		model.addAttribute("followMeListCount", followMeListCount);
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("board",board);
		model.addAttribute("list", list);
		model.addAttribute("boardSearchCount", boardSearchCount);
		log.debug("boardTagSearch --> "+list);
		return "sns/board/sns_board_search_list";
	}
	

	/* sns 인기 게시물 목록 요청 */
	@RequestMapping(value="/boardPopList", method = RequestMethod.GET)
	public String boardPopularityList(Model model
            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		log.debug("boardPopularityList 폼 요청");
		int boardCount = boardDao.selectBoardCount();
        int pagePerRow = 6;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
		List<BoardDto> list = boardDao.selectBoardPopularityList(currentPage, pagePerRow);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("list", list);
        log.debug("boardList : "+list);
		return "sns/board/sns_board_pop_list";
	}
	
	/* sns게시물 목록 요청 */
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
	public String boardList(Model model
            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		log.debug("boardList 폼 요청");
		int boardCount = boardDao.selectBoardCount();
        int pagePerRow = 9;
        int lastPage = (int)(Math.ceil(boardCount / pagePerRow));
		List<BoardDto> list = boardDao.selectBoardList(currentPage, pagePerRow);
		model.addAttribute("currentPage", currentPage);
        model.addAttribute("boardCount", boardCount);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("list", list);
        log.debug("boardList : "+list);
		return "sns/board/sns_board_list";
	}
	
	/* sns게시물 삭제 처리 요청 */
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDelete(String boardNo, HttpSession session) {
		log.debug("sns게시물 삭제 요청");
		UtilFile utilFile = new UtilFile();
		BoardDto board = boardDao.selectBoardDetail(boardNo);	// 업로드된 이미지 파일 이름 조회
		boardDao.deleteBoard(boardNo);
		commentDao.deleteBoardComment(boardNo);
		likeDao.deleteboardLike(boardNo);
		boardDao.deleteSnsColor(boardNo);
		boardDao.deleteSnsSituation(boardNo);
		boardDao.deleteSnsStyle(boardNo);
		String fileName = board.getSnsBoardImg();	// 업로드된 게시물 이미지 파일 이름 저장
		utilFile.deleteFile(fileName, session);		// 업로드된 게시물 이미지 파일 삭제 메서드 호출
		return "redirect:/home";
	}
	
	/* sns게시물 수정 처리 요청 */
	@RequestMapping(value="/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(BoardDto board, HttpServletRequest request) {
		log.debug("boardUpdate 처리 요청");
		log.debug("boardUpdate board : "+board);
		
		if(board.getSnsBoardGender().equals("")) {
			board.setSnsBoardGender(null);
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
		
		boardDao.deleteSnsColor(board.getSnsBoardNo());
		boardDao.deleteSnsSituation(board.getSnsBoardNo());
		boardDao.deleteSnsStyle(board.getSnsBoardNo());
		
		String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
		
		if(situationValue != null) {
			String lastSituationNo = boardDao.selectLastSituationNo();
			log.debug("lastSituationNo : "+lastSituationNo);
			for(int i = 0; i<situationValue.length; i++) {
		        int insertSituationNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastSituationNo != null) {
		        	insertSituationNo = Integer.parseInt(lastSituationNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsSituationNo = "sns_situation_"+insertSituationNo;
		        log.debug("snsSituationNo : "+snsSituationNo);
		        log.debug("snsBoardNo : "+snsBoardNo);
		        log.debug("situationValue["+i+"] : "+situationValue[i]);
		        boardDao.insertSnsSituation(snsSituationNo, snsBoardNo, situationValue[i]);
			}
		}
		
		if(styleValue != null) {
			String lastStyleNo = boardDao.selectLastStyleNo();
			for(int i = 0; i<styleValue.length; i++) {
		        int insertStyleNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastStyleNo != null) {
		        	insertStyleNo = Integer.parseInt(lastStyleNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsStyleNo = "sns_style_"+insertStyleNo;
		        boardDao.insertSnsStyle(snsStyleNo, snsBoardNo, styleValue[i]);
			}
		}
		
		if(colorValue != null) {
			String lastColorNo = boardDao.selectLastColorNo();
			for(int i = 0; i<colorValue.length; i++) {
		        int insertColorNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastColorNo != null) {
		        	insertColorNo = Integer.parseInt(lastColorNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsColorNo = "sns_color_"+insertColorNo;
		        boardDao.insertSnsColor(snsColorNo, snsBoardNo, colorValue[i]);
			}
		}
		
		boardDao.updatBboard(board);
		return "redirect:/home";
	}
	
	/* sns게시물 수정 화면 요청 */
	@RequestMapping(value="/boardUpdate", method = RequestMethod.GET)
	public String boardUpdateForm(Model model
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		log.debug("boardUpdate 화면 요청");
		log.debug("boardUpdate boardNo : "+boardNo);
		
		List<String> snsStyle = boardDao.selectBoardStyle(boardNo);
		List<String> snsColor = boardDao.selectBoardColor(boardNo);
		List<String> snsSituation = boardDao.selectBoardSituation(boardNo);
		
		BoardDto board = boardDao.selectBoardDetail(boardNo);
		model.addAttribute("snsColor", snsColor);
		model.addAttribute("snsSituation", snsSituation);
		model.addAttribute("snsStyle", snsStyle);
		model.addAttribute("board", board);
		log.debug("snsStyle : "+snsStyle);
		return "sns/board/sns_board_update";
	}
	
	/* sns게시물 상세 보기 */
	@RequestMapping(value="/oardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, HttpSession session
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		log.debug("boardDeatil 화면 요청");
		BoardDto board = boardDao.selectBoardDetail(boardNo);
		log.debug("boardNo : "+ boardNo);
		List<CommentDto> commentList = commentDao.selectCommentList(boardNo);
		log.debug("comment : "+ commentList);
		
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
		
		model.addAttribute("snsColor", snsColor);
		model.addAttribute("snsSituation", snsSituation);
		model.addAttribute("snsStyle", snsStyle);
		model.addAttribute("likeToggle", likeToggle);
		model.addAttribute("board", board);
		model.addAttribute("commentList",commentList);
		log.debug("boardDetail : "+ model);
		return "sns/board/sns_board_detail";
	}
	
	
	 /* sns게시물 입력 처리 요청  */
    @RequestMapping(value="/boardInsert", method = RequestMethod.POST)
    public String boardInsert(BoardDto board
    		,HttpServletRequest request
    		,@RequestParam("uploadFile") MultipartFile uploadFile
    		,MultipartHttpServletRequest multipartRequest) throws Exception {
    	log.debug("boardInsert 처리 요청");
    	log.debug("multipartRequest : "+multipartRequest);
    	
/* 		이미지 자를 때 필요한 데이터
 *    	String imgX1 = request.getParameter("imgX1");
    	String imgY1 = request.getParameter("imgY1");
    	String imgWidth = request.getParameter("ImgWidth");
    	String imgHeight = request.getParameter("ImgHeight");
    	
    	int intX1 = Integer.parseInt(imgX1);
    	int intY1 = Integer.parseInt(imgY1);
    	int intWidth = Integer.parseInt(imgWidth);
    	int intHeight = Integer.parseInt(imgHeight);
    	
    	log.debug("uploadFile ImgX1 : " + imgX1);
    	log.debug("uploadFile ImgY1 : " + imgY1);
    	log.debug("uploadFile ImgWidth : " + imgWidth);
    	log.debug("uploadFile ImgHeight : " + imgHeight);*/
    	
    	log.debug("RewardController reAddProCtrl uploadFile : " + uploadFile);
    	
//      UtilFile 객체 생성
        UtilFile utilFile = new UtilFile();
        
//      파일 업로드 결과값을 path로 받아온다(이미 fileUpload() 메소드에서 해당 경로에 업로드는 끝났음)
        String uploadPath = utilFile.fileUpload(multipartRequest, uploadFile);
        
// 		이미지 자르기 메서드 호출
//      String uploadPath = utilFile.imgFileUpload(multipartRequest, uploadFile, intX1, intY1, intWidth, intHeight);

        log.debug("RewardController reAddProCtrl uploadPath : " + uploadPath);
    	board.setSnsBoardImg(uploadPath);
        
    	String[] colorValue = request.getParameterValues("colorValue");
		String[] styleValue = request.getParameterValues("styleValue");
		String[] situationValue = request.getParameterValues("situationValue");
    	
		 /******** sns_board_no의 끝 숫자 자동 입력 *****************/
        String lastBoardNo = boardDao.selectLastBoardNo();
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
			String lastSituationNo = boardDao.selectLastSituationNo();
			log.debug("lastSituationNo : "+lastSituationNo);
			for(int i = 0; i<situationValue.length; i++) {
		        int insertSituationNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastSituationNo != null) {
		        	insertSituationNo = Integer.parseInt(lastSituationNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsSituationNo = "sns_situation_"+insertSituationNo;
		        log.debug("snsSituationNo : "+snsSituationNo);
		        log.debug("snsBoardNo : "+snsBoardNo);
		        log.debug("situationValue["+i+"] : "+situationValue[i]);
		        boardDao.insertSnsSituation(snsSituationNo, snsBoardNo, situationValue[i]);
			}
		}
		
		if(styleValue != null) {
			String lastStyleNo = boardDao.selectLastStyleNo();
			for(int i = 0; i<styleValue.length; i++) {
		        int insertStyleNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastStyleNo != null) {
		        	insertStyleNo = Integer.parseInt(lastStyleNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsStyleNo = "sns_style_"+insertStyleNo;
		        boardDao.insertSnsStyle(snsStyleNo, snsBoardNo, styleValue[i]);
			}
		}
		
		if(colorValue != null) {
			String lastColorNo = boardDao.selectLastColorNo();
			for(int i = 0; i<colorValue.length; i++) {
		        int insertColorNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
		        if(lastColorNo != null) {
		        	insertColorNo = Integer.parseInt(lastColorNo)+1+i;
		        }
		        String snsBoardNo = board.getSnsBoardNo();
		        String snsColorNo = "sns_color_"+insertColorNo;
		        boardDao.insertSnsColor(snsColorNo, snsBoardNo, colorValue[i]);
			}
		}
        boardDao.insertBoard(board);
        
        String pointPolicyNo = "point_ex_1";	//게시물 등록 포인트 no
        int boardPointCheck = boardDao.selectBoardPointCheck(board.getUserId());	//today 게시물 검색
        	log.debug("BoardController 포인트 입력하기 위한 게시물 검색 = " + boardPointCheck);
        String pointCehck = pointDao.selectPointCehck(board.getUserId(), pointPolicyNo);	//today 포인트 취득 검색
        	log.debug("BoardController 포인트 입력하기 위한 오늘 포인트 검색 = " + pointCehck);
       
        if(boardPointCheck == 0 && pointCehck == null){	//하루 + 게시물 1 이상 등록하면 포인트 제공 포인트 중복 취득 불가 조건문
        	log.debug("BoardController 게시물 등록할때 하루 첫번째 등록 포인트도 같이 등록 ");
        	pointDao.insertPointGet(board.getUserId(), pointPolicyNo);	//취득포인트입력
        }	
        return "redirect:/home";
    }
    
    /* sns게시물 입력 화면 요청 */
	@RequestMapping(value="/boardInsert", method = RequestMethod.GET)
    public String boardInsert() {
        log.debug("boardInsert 폼 요청");
        return "sns/board/sns_board_insert";
    }
}
