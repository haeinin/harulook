package com.ksmart.harulook.comment.service;

import java.util.List;

public interface CommentServiceInterface {
	/* 게시물 삭제 시 댓글 삭제 */
	int removeBoardComment(String snsBoardNo);

	/* 댓글 삭제 처리 */
	int removeComment(String snsCommentNo);

	/* 게시물에 등록된 댓글 목록 조회 */
	List<CommentDto> getCommentList(String snsBoardNo);

	/* 댓글 등록 */
	int addComment(CommentDto comment);

	/* 가장 마지막에 등록된 sns_comment_no 가져오는 메서드 */
	String getLastCommentNo();

}
