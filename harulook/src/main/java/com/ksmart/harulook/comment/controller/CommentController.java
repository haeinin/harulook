package com.ksmart.harulook.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ksmart.harulook.comment.service.CommentDao;
import com.ksmart.harulook.comment.service.CommentDto;

@Controller
public class CommentController {

	@Autowired
	private CommentDao commentDao;
	
	/* 댓글 삭제 */
	@RequestMapping(value="/commentDelete", method = RequestMethod.GET)
	public String commentDelete(String snsCommentNo, String snsBoardNo) {
		System.out.println("commentDelete 요청");
		commentDao.commentDelete(snsCommentNo);
		return "redirect:/boardDetail?boardNo="+snsBoardNo;
	}
	
	/* sns게시글 댓글 등록 */
	@RequestMapping(value="/commentInsert", method = RequestMethod.POST)
    public String CommentInsert(CommentDto comment) {
        System.out.println("commentInsert 요청");
        
        /******** sns_comment_no의 끝 숫자 자동 입력 *****************/
        String lastCommentNo = commentDao.getLastCommentNo();
        int insertCommentNo = 1;	//DB에 등록된 댓글이 없을 때 번호의 초기값
        if(lastCommentNo != null) {
        	insertCommentNo = Integer.parseInt(lastCommentNo)+1;
        }
        comment.setSnsCommentNo("sns_comment_"+insertCommentNo);
        /*************************************************/
        
        System.out.println("comment : "+ comment);
        commentDao.commentInsert(comment);
        return "redirect:/boardDetail?boardNo="+comment.getSnsBoardNo();
    }
}
