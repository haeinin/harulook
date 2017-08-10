package com.ksmart.harulook.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	/* sns게시물 목록 요청 */
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
	public String boardList() {
		System.out.println("boardList 폼 요청");
		return "sns/board/sns_board_list";
	}
	
	 /* sns게시물 입력 처리 요청 */
    @RequestMapping(value="/boardInsert", method = RequestMethod.POST)
    public String boardInsert(BoardDto board) {
        System.out.println(board);
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
