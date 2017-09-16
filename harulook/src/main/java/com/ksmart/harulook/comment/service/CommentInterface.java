package com.ksmart.harulook.comment.service;

import java.util.List;

public interface CommentInterface {

	/* 게시물 삭제 시 댓글 삭제 */
	int deleteBoardComment(String snsBoardNo);

	/* 댓글 삭제 처리 */
	int deleteComment(String snsCommentNo);

	/* 게시물에 등록된 댓글 목록 조회 */
	List<CommentDto> selectCommentList(String snsBoardNo);

	/* 댓글 등록 */
	int insertComment(CommentDto comment);

	/* 가장 마지막에 등록된 sns_comment_no 가져오는 메서드 */
	String selectLastCommentNo();

}