package com.ksmart.harulook.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ksmart.harulook.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	/* sns게시물 삭제 처리 요청 */
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDelete(String boardNo) {
		System.out.println("sns게시물 삭제 요청");
		boardDao.boardDelete(boardNo);
		return "redirect:/boardList";
	}
	
	/* sns게시물 수정 처리 요청 */
	@RequestMapping(value="/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(BoardDto board) {
		System.out.println("boardUpdate 처리 요청");
		boardDao.boardUpdate(board);
		return "redirect:/boardDetail?boardNo="+board.getSnsBoardNo();
	}
	
	/* sns게시물 수정 화면 요청 */
	@RequestMapping(value="/boardUpdate", method = RequestMethod.GET)
	public String boardUpdateForm(Model model
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		System.out.println("boardUpdate 화면 요청");
		BoardDto board = boardDao.boardDetail(boardNo);
		model.addAttribute("board", board);
		System.out.println(model);
		return "sns/board/sns_board_update";
	}
	
	/* sns게시물 상세 보기 */
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model
            , @RequestParam(value="boardNo", required=true) String boardNo) {
		System.out.println("boardDeatil 화면 요청");
		BoardDto board = boardDao.boardDetail(boardNo);
		model.addAttribute("board", board);
		System.out.println(model);
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
		System.out.println(model);
		return "sns/board/sns_board_list";
	}
	
	 /* sns게시물 입력 처리 요청 */
    @RequestMapping(value="/boardInsert", method = RequestMethod.POST)
    public String boardInsert(BoardDto board) {
        System.out.println(board);

        /******** sns_board_no의 끝 숫자 자동 입력 *****************/
        String lastBoardNo = boardDao.getLastBoardNo();
        System.out.println("lastBoardNo: "+lastBoardNo);
        int insertBoardNo = 1;	//DB에 등록된 게시물이 없을 때 번호의 초기값
        if(lastBoardNo != null) {
        	insertBoardNo = Integer.parseInt(lastBoardNo)+1;
        }
        board.setSnsBoardNo("sns_board_"+insertBoardNo);
        /*************************************************/
        
        boardDao.boardInsert(board);
        return "redirect:/boardList";
    }
    
    /* sns게시물 입력 화면 요청 */
	@RequestMapping(value="/boardInsert", method = RequestMethod.GET)
    public String boardInsert() {
        System.out.println("boardInsert 폼 요청");
        return "sns/board/sns_board_insert";
    }
}
