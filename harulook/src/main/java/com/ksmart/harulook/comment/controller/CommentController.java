package com.ksmart.harulook.comment.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.comment.service.CommentDto;
import com.ksmart.harulook.comment.service.CommentInterface;

@Controller
public class CommentController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private CommentInterface commentDao;
	
	/* 댓글 삭제 */
	@RequestMapping(value="/commentDelete", method = RequestMethod.GET)
	public String commentDelete(String snsCommentNo, String snsBoardNo) {
		log.debug("commentDelete 요청");
		commentDao.deleteComment(snsCommentNo);
		return "redirect:/home";
	}
	
	/* sns게시글 댓글 등록 */
	@RequestMapping(value="/commentInsert", method = RequestMethod.POST)
    public String CommentInsert(CommentDto comment) {
        log.debug("commentInsert 요청");
        
        /******** sns_comment_no의 끝 숫자 자동 입력 *****************/
        String lastCommentNo = commentDao.selectLastCommentNo();
        int insertCommentNo = 1;	//DB에 등록된 댓글이 없을 때 번호의 초기값
        if(lastCommentNo != null) {
        	insertCommentNo = Integer.parseInt(lastCommentNo)+1;
        }
        comment.setSnsCommentNo("sns_comment_"+insertCommentNo);
        /*************************************************/
        
        log.debug("comment : "+ comment);
        commentDao.insertComment(comment);
        return "redirect:/boardDetail?boardNo="+comment.getSnsBoardNo();
    }
}
