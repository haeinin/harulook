package com.ksmart.harulook.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.dto.BoardDto;

@Controller
public class BoardController {
	/*
	// 입력(액션) 요청
    @RequestMapping(value="/boardAdd", method = RequestMethod.POST)
    public String boardAdd(BoardDto board) {
        System.out.println(board);
        boardDao.boardInsert(board);
        return "redirect:/boardList"; // 글입력후 "/boardList"로 리다이렉트(재요청)
    }*/
    
	@RequestMapping(value="/boardInsert", method = RequestMethod.GET)
    public String boardAdd() {
        System.out.println("boardInsert 폼 요청");
        return "sns/board/sns_board_insert";
    }
}
