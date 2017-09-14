package com.ksmart.harulook.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class PointService implements PointServiceInterface {

	@Autowired private PointInterface pointInterface;
	@Override
	public int removeAttenCheck(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.deleteAttenCheck(userId);
	}

	@Override
	public int getAttenCheckMonth(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectAttenCheckMonth(userId);
	}

	@Override
	public String getAttenCheck(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectAttenCheck(userId);
	}

	@Override
	public int addAttenCheck(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.insertAttenCheck(userId);
	}

	@Override
	public int addPointGet(String userId, String pointPolicyNo) {
		// TODO Auto-generated method stub
		return pointInterface.insertPointGet(userId, pointPolicyNo);
	}

	@Override
	public String getPointCehck(String userId, String pointPolicyNo) {
		// TODO Auto-generated method stub
		return pointInterface.selectPointCehck(userId, pointPolicyNo);
	}

	@Override
	public String getCouponCheck(String pointGoodsCode) {
		// TODO Auto-generated method stub
		return pointInterface.selectCouponCheck(pointGoodsCode);
	}

	@Override
	public int addCoupon(String userId, int pointPolicyValue, String pointGoodsCode) {
		// TODO Auto-generated method stub
		return pointInterface.insertCoupon(userId, pointPolicyValue, pointGoodsCode);
	}

	@Override
	public int getMyPoint(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectMyPoint(userId);
	}

	@Override
	public List<PointDto> getPointPolicy() {
		// TODO Auto-generated method stub
		return pointInterface.selectPointPolicy();
	}

	@Override
	public List<PointDto> getPointUsePolicy() {
		// TODO Auto-generated method stub
		return pointInterface.selectPointUsePolicy();
	}

	@Override
	public List<PointDto> getPointUse(int currentPage, int pagePerRow, String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectPointUse(currentPage, pagePerRow, userId);
	}

	@Override
	public int getPointUseCount(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectPointUseCount(userId);
	}

	@Override
	public List<PointDto> getPointGet(int currentPage, int pagePerRow, String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectPointGet(currentPage, pagePerRow, userId);
	}

	@Override
	public int getPointGetCount(String userId) {
		// TODO Auto-generated method stub
		return pointInterface.selectPointGetCount(userId);
	}

}
