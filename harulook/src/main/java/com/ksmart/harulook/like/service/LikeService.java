package com.ksmart.harulook.like.service;

import org.springframework.beans.factory.annotation.Autowired;

public class LikeService implements LikeServiceInterface {

	@Autowired private LikeInterface likeInterface;
	@Override
	public int removeboardLike(String snsBoardNo) {
		return likeInterface.deleteboardLike(snsBoardNo);
	}

	@Override
	public String getLastLikeNo() {
		return likeInterface.selectLastLikeNo();
	}

	@Override
	public int getLikeCount(String snsBoardNo) {
		return likeInterface.selectLikeCount(snsBoardNo);
	}

	@Override
	public int getLikeClick(String snsBoardNo, String userId) {
		return likeInterface.selectLikeClick(snsBoardNo, userId);
	}

	@Override
	public int addLike(String snsLikeNo, String snsBoardNo, String userId) {
		return likeInterface.insertLike(snsLikeNo, snsBoardNo, userId);
	}

	@Override
	public int removeLike(String snsBoardNo, String userId) {
		return likeInterface.deleteLike(snsBoardNo, userId);
	}

}
