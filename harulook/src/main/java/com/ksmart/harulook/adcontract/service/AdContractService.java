package com.ksmart.harulook.adcontract.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ksmart.harulook.adboard.service.AdBoardDto;
import com.ksmart.harulook.adrefund.service.AdRefundDto;

public class AdContractService implements AdContractServiceInterface {
	@Autowired
	private AdContractInterface adcontractinterface;
	@Override
	public int modifyBadAdContract(String adContractNo) {
		return adcontractinterface.updateBadAdContract(adContractNo);
	}

	@Override
	public int modifyAdContract(AdContractDto adcontract) {
		return adcontractinterface.updateAdContract(adcontract);
	}

	@Override
	public AdContractDto getAdContractByContractNo(String contractno) {
		return adcontractinterface.selectAdContractByContractNo(contractno);
	}

	@Override
	public int modifyEndContract(String adContractNo) {
		return adcontractinterface.updateEndContract(adContractNo);
	}

	@Override
	public int modifyIngContract(String adContractNo) {
		return adcontractinterface.updateIngContract(adContractNo);
	}

	@Override
	public List<AdContractDto> getmodifyEndContract() {
		return adcontractinterface.selectUpdateEndContract();
	}

	@Override
	public List<AdContractDto> getmodifyIngContract() {
		return adcontractinterface.selectUpdateIngContract();
	}

	@Override
	public int addAdContract(AdContractDto adcontract) {
		return adcontractinterface.insertAdContract(adcontract);
	}

	@Override
	public AdContractDto getAdContractListCurrentPlace1() {
		return adcontractinterface.selectAdContractListCurrentPlace1();
	}

	@Override
	public AdContractDto getAdContractListCurrentPlace2() {
		return adcontractinterface.selectAdContractListCurrentPlace2();
	}

	@Override
	public AdContractDto getAdContractListCurrentPlace3() {
		return adcontractinterface.selectAdContractListCurrentPlace3();
	}

	@Override
	public List<AdContractDto> getAdContractCancelRequestList() {
		return adcontractinterface.selectAdContractCancelRequestList();
	}

	@Override
	public List<AdContractDto> getAdContractCancelRequestList(String SID) {

		return adcontractinterface.selectAdContractCancelRequestList(SID);
	}

	@Override
	public List<AdContractDto> getAdBoardAdContractStataddWaitList() {
		return adcontractinterface.selectAdContractApproveWaitList();
	}

	@Override
	public List<AdContractDto> getAdBoardAdContractStataddWaitListByUser(String SID) {
		return adcontractinterface.selectAdBoardAdContractStatInsertWaitListByUser(SID);
	}

	@Override
	public List<AdContractDto> getAdContractApproveWaitList() {
		return adcontractinterface.selectAdContractApproveWaitList();
	}

	@Override
	public List<AdContractDto> getAdContractApproveWaitListByUser(String SID) {
		return adcontractinterface.selectAdBoardAdContractStatInsertWaitListByUser(SID);
	}

	@Override
	public List<AdContractDto> getAdContractSoonList() {
		return adcontractinterface.selectAdContractSoonList();
	}

	@Override
	public List<AdContractDto> getAdContractSoonList(String SID) {
		return adcontractinterface.selectAdContractSoonList(SID);
	}

	@Override
	public String getContractNo() {
		return adcontractinterface.selectContractNo();
	}

	@Override
	public String getPrice(String adtype) {
		return adcontractinterface.selectPrice(adtype);
	}

	@Override
	public String getDc(String dc) {
		return adcontractinterface.selectDc(dc);
	}

	@Override
	public int modifyContractStat(String adcontractno) {
		return adcontractinterface.updateContractStat(adcontractno);
	}

	@Override
	public int addRefund(AdRefundDto refund) {
		return adcontractinterface.insertRefund(refund);
	}

	@Override
	public int modifyContractStatApprove(String adcontractno) {
		return adcontractinterface.updateContractStatApprove(adcontractno);
	}

	@Override
	public int modifyContractStatApproveCancel(String adcontractno) {
		return adcontractinterface.updateContractStatApprove(adcontractno);
	}

	@Override
	public int modifyContractStatAdWait(String adcontractno) {
		return adcontractinterface.updateContractStatAdWait(adcontractno);
	}

	@Override
	public List<AdBoardDto> getContractDetail(String adContractNo) {
		return adcontractinterface.selectContractDetail(adContractNo);
	}

}
