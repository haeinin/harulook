package com.ksmart.harulook.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class PointService implements PointServiceInterface {

	@Autowired private PointInterface pointInterface;
	@Override
	public int removeAttenCheck(String userId) {
		return pointInterface.deleteAttenCheck(userId);
	}

	@Override
	public int getAttenCheckMonth(String userId) {
		return pointInterface.selectAttenCheckMonth(userId);
	}

	@Override
	public String getAttenCheck(String userId) {
		return pointInterface.selectAttenCheck(userId);
	}

	@Override
	public int addAttenCheck(String userId) {
		return pointInterface.insertAttenCheck(userId);
	}

	@Override
	public int addPointGet(String userId, String pointPolicyNo) {
		return pointInterface.insertPointGet(userId, pointPolicyNo);
	}

	@Override
	public String getPointCehck(String userId, String pointPolicyNo) {
		return pointInterface.selectPointCehck(userId, pointPolicyNo);
	}

	@Override
	public String getCouponCheck(String pointGoodsCode) {
		return pointInterface.selectCouponCheck(pointGoodsCode);
	}

	@Override
	public int addCoupon(String userId, int pointPolicyValue, String pointGoodsCode) {
		return pointInterface.insertCoupon(userId, pointPolicyValue, pointGoodsCode);
	}

	@Override
	public int getMyPoint(String userId) {
		return pointInterface.selectMyPoint(userId);
	}

	@Override
	public List<PointDto> getPointPolicy() {
		return pointInterface.selectPointPolicy();
	}

	@Override
	public List<PointDto> getPointUsePolicy() {
		return pointInterface.selectPointUsePolicy();
	}

	@Override
	public List<PointDto> getPointUse(int currentPage, int pagePerRow, String userId) {
		return pointInterface.selectPointUse(currentPage, pagePerRow, userId);
	}

	@Override
	public int getPointUseCount(String userId) {
		return pointInterface.selectPointUseCount(userId);
	}

	@Override
	public List<PointDto> getPointGet(int currentPage, int pagePerRow, String userId) {
		return pointInterface.selectPointGet(currentPage, pagePerRow, userId);
	}

	@Override
	public int getPointGetCount(String userId) {
		return pointInterface.selectPointGetCount(userId);
	}

}
