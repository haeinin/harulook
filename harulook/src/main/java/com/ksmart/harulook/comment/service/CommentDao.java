package com.ksmart.harulook.comment.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao implements CommentInterface {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* 게시물 삭제 시 댓글 삭제 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.comment.service.CommentInterface#deleteBoardComment(java.lang.String)
	 */
	@Override
	public int deleteBoardComment(String snsBoardNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.comment.service.CommentMapper.boardCommentDelete", snsBoardNo);
	}
	
	/* 댓글 삭제 처리 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.comment.service.CommentInterface#deleteComment(java.lang.String)
	 */
	@Override
	public int deleteComment(String snsCommentNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.comment.service.CommentMapper.commentDelete", snsCommentNo);
	}
	
	/* 게시물에 등록된 댓글 목록 조회 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.comment.service.CommentInterface#selectCommentList(java.lang.String)
	 */
	@Override
	public List<CommentDto> selectCommentList(String snsBoardNo) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.comment.service.CommentMapper.commentList", snsBoardNo);
	}
	
	/* 댓글 등록 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.comment.service.CommentInterface#insertComment(com.ksmart.harulook.comment.service.CommentDto)
	 */
	@Override
	public int insertComment(CommentDto comment) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.comment.service.CommentMapper.commentInsert", comment);
	}
	
	/* 가장 마지막에 등록된 sns_comment_no 가져오는 메서드 */
	/* (non-Javadoc)
	 * @see com.ksmart.harulook.comment.service.CommentInterface#selectLastCommentNo()
	 */
	@Override
	public String selectLastCommentNo() {
		String lastCommentNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.comment.service.CommentMapper.getLastCommentNo", lastCommentNo);
	}
}
