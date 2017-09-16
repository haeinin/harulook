package com.ksmart.harulook.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class CommentService implements CommentServiceInterface {

	@Autowired private CommentInterface commentInterface;
	@Override
	public int removeBoardComment(String snsBoardNo) {
		return commentInterface.deleteBoardComment(snsBoardNo);
	}

	@Override
	public int removeComment(String snsCommentNo) {
		return commentInterface.deleteComment(snsCommentNo);
	}

	@Override
	public List<CommentDto> getCommentList(String snsBoardNo) {
		return commentInterface.selectCommentList(snsBoardNo);
	}

	@Override
	public int addComment(CommentDto comment) {
		return commentInterface.insertComment(comment);
	}

	@Override
	public String getLastCommentNo() {
		return commentInterface.selectLastCommentNo();
	}

}
