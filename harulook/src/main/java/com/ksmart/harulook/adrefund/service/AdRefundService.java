package com.ksmart.harulook.adrefund.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class AdRefundService implements AdRefundServiceInterface {
	@Autowired
	private AdRefundInterface adrefundinterface;
	@Override
	public int addAdRefund(AdRefundDto adrefund) {
		return adrefundinterface.insertAdRefund(adrefund);
	}

	@Override
	public String getAdRefundNo() {
		return adrefundinterface.selectAdRefundNo();
	}

	@Override
	public List<AdRefundDto> getAdRefundList() {
		return adrefundinterface.selectAdRefundList();
	}

	@Override
	public List<AdRefundDto> getAdRefundList(String SID) {
		return adrefundinterface.selectAdRefundList(SID);
	}

	@Override
	public int modifyAdRefund(String refundNo) {
		return adrefundinterface.updateAdRefund(refundNo);
	}

	@Override
	public int modifyAdContractStatApproveRefund(String refundNo) {
		return adrefundinterface.updateAdContractStatApproveRefund(refundNo);
	}

}
