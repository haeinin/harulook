package com.ksmart.harulook.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class FollowService implements FollowServiceInterface {

	@Autowired private FollowInterface followInterface;
	@Override
	public String removeFollow(String userId, String followId) {
		return followInterface.deleteFollow(userId, followId);
	}

	@Override
	public int getFollowMeListCount(String userId) {
		return followInterface.selectFollowMeListCount(userId);
	}

	@Override
	public int getFollowListCount(String userId) {
		return followInterface.selectFollowListCount(userId);
	}

	@Override
	public List<FollowDto> getFollowMeList(int currentPage, int pagePerRow, String followId) {
		return followInterface.selectFollowMeList(currentPage, pagePerRow, followId);
	}

	@Override
	public List<FollowDto> getFollowList(int currentPage, int pagePerRow, String followId) {
		return followInterface.selectFollowList(currentPage, pagePerRow, followId);
	}

	@Override
	public String getFollowCheck(String userId, String followId) {
		return followInterface.selectFollowCheck(userId, followId);
	}

	@Override
	public String getFollowNo() {
		return followInterface.selectFollowNo();
	}

	@Override
	public int addFollow(String followNo, String userId, String followId) {
		return followInterface.insertFollow(followNo, userId, followId);
	}

}
