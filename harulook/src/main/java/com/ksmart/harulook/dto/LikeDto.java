package com.ksmart.harulook.dto;

public class LikeDto {
	private String snsLikeNo;
	private String snsBoardNo;
	private String userId;
	private String snsLikeDate;
	public String getSnsLikeNo() {
		return snsLikeNo;
	}
	public void setSnsLikeNo(String snsLikeNo) {
		this.snsLikeNo = snsLikeNo;
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
	public String getSnsLikeDate() {
		return snsLikeDate;
	}
	public void setSnsLikeDate(String snsLikeDate) {
		this.snsLikeDate = snsLikeDate;
	}
	@Override
	public String toString() {
		return "LikeDto [snsLikeNo=" + snsLikeNo + ", snsBoardNo=" + snsBoardNo + ", userId=" + userId
				+ ", snsLikeDate=" + snsLikeDate + "]";
	}
	
}
