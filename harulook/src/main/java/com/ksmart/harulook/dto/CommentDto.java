package com.ksmart.harulook.dto;

public class CommentDto {
	private String snsCommentNo;
	private String snsBoardNo;
	private String userId;
	private String snsCommentContent;
	private String snsCommentDate;
	public String getSnsCommentNo() {
		return snsCommentNo;
	}
	public void setSnsCommentNo(String snsCommentNo) {
		this.snsCommentNo = snsCommentNo;
	}
	public String getSnsBoardNo() {
		return snsBoardNo;
	}
	public void setSnsBoardNo(String snsBoardNo) {
		this.snsBoardNo = snsBoardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSnsCommentContent() {
		return snsCommentContent;
	}
	public void setSnsCommentContent(String snsCommentContent) {
		this.snsCommentContent = snsCommentContent;
	}
	public String getSnsCommentDate() {
		return snsCommentDate;
	}
	public void setSnsCommentDate(String snsCommentDate) {
		this.snsCommentDate = snsCommentDate;
	}
	@Override
	public String toString() {
		return "CommentDto [snsCommentNo=" + snsCommentNo + ", snsBoardNo=" + snsBoardNo + ", userId=" + userId
				+ ", snsCommentContent=" + snsCommentContent + ", snsCommentDate=" + snsCommentDate + "]";
	}
	
}
