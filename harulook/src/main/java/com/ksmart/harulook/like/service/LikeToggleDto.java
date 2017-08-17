package com.ksmart.harulook.like.service;

public class LikeToggleDto {
	private int likeClick;
	private int snsLikeCount;
	public int getLikeClick() {
		return likeClick;
	}
	public void setLikeClick(int likeClick) {
		this.likeClick = likeClick;
	}
	public int getSnsLikeCount() {
		return snsLikeCount;
	}
	public void setSnsLikeCount(int snsLikeCount) {
		this.snsLikeCount = snsLikeCount;
	}
	@Override
	public String toString() {
		return "LikeToggleDto [likeClick=" + likeClick + ", snsLikeCount=" + snsLikeCount + "]";
	}
	
}
