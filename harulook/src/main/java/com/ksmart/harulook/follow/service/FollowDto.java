package com.ksmart.harulook.follow.service;

public class FollowDto {
	private String followNo;
	private String userId;
	private String followId;
	private String followDate;
	
	public String getFollowNo() {
		return followNo;
	}
	public void setFollowNo(String followNo) {
		this.followNo = followNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFollowId() {
		return followId;
	}
	public void setFollowId(String followId) {
		this.followId = followId;
	}
	public String getFollowDate() {
		return followDate;
	}
	public void setFollowDate(String followDate) {
		this.followDate = followDate;
	}
	@Override
	public String toString() {
		return "FollowDto [followNo=" + followNo + ", userId=" + userId + ", followId=" + followId + ", followDate="
				+ followDate + "]";
	}
	
	
	
}
