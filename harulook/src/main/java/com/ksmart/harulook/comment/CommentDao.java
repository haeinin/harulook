package com.ksmart.harulook.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.harulook.dto.CommentDto;

@Repository
public class CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* 댓글 삭제 처리 */
	public int commentDelete(String snsCommentNo) {
		return sqlSessionTemplate.delete("com.ksmart.harulook.comment.CommentMapper.commentDelete", snsCommentNo);
	}
	
	/* 게시물에 등록된 댓글 목록 조회 */
	public List<CommentDto> commentList(String snsBoardNo) {
		return sqlSessionTemplate.selectList("com.ksmart.harulook.comment.CommentMapper.commentList", snsBoardNo);
	}
	
	/* 댓글 등록 */
	public int commentInsert(CommentDto comment) {
		return sqlSessionTemplate.insert("com.ksmart.harulook.comment.CommentMapper.commentInsert", comment);
	}
	
	/* 가장 마지막에 등록된 sns_comment_no 가져오는 메서드 */
	public String getLastCommentNo() {
		String lastCommentNo = "";
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.comment.CommentMapper.getLastCommentNo", lastCommentNo);
	}
}
