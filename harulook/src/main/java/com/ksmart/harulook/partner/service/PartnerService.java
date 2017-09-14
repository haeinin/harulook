package com.ksmart.harulook.partner.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksmart.harulook.member.service.MemberDto;
@Service
public class PartnerService implements PartnerServiceInterface {

	@Autowired private PartnerInterface partnerInterface;
	@Override
	public int addCooContract(PartnerDto dto) {
		return partnerInterface.insertCooContract(dto);
	}

	@Override
	public String getLastCooContractNo() {
		return partnerInterface.selectLastCooContractNo();
	}

	@Override
	public PartnerDto getCooContractDetail(String cooContractNo) {
		return partnerInterface.selectCooContractDetail(cooContractNo);
	}

	@Override
	public List<PartnerDto> getCooContractList() {
		return partnerInterface.selectCooContractList();
	}

	@Override
	public List<PartnerDto> getCooContractList(String id) {
		return partnerInterface.selectCooContractList(id);
	}

	@Override
	public int modifyCooContract(PartnerDto dto) {
		return partnerInterface.updateCooContract(dto);
	}

	@Override
	public List<PartnerBillDto> getCooContractBill(String cooContractNo) {
		return partnerInterface.selectCooContractBill(cooContractNo);
	}

	@Override
	public int addCooContractPay(PartnerBillDto dto) {
		return partnerInterface.insertCooContractPay(dto);
	}

	@Override
	public int modifyCooContractPayStat(PartnerBillDto dto) {
		return partnerInterface.updateCooContractPayStat(dto);
	}

	@Override
	public int modifyCooContractRelieve(PartnerBillDto dto) {
		return partnerInterface.updateCooContractRelieve(dto);
	}

	@Override
	public int removeCooContractBill(PartnerBillDto dto) {
		return partnerInterface.deleteCooContractBill(dto);
	}

	@Override
	public List<PartnerPayDto> getCooContractPayList(String cooContractNo) {
		return partnerInterface.selectCooContractPayList(cooContractNo);
	}

	@Override
	public int modifyCooContractAdmit(PartnerDto dto) {
		return partnerInterface.updateCooContractAdmit(dto);
	}

	@Override
	public PartnerBillDto getCooContractPayForm(String cooBillNo) {
		return partnerInterface.selectCooContractPayForm(cooBillNo);
	}

	@Override
	public MemberDto getCooContractCompany(String userId) {
		return partnerInterface.selectCooContractCompany(userId);
	}

	@Override
	public int addCooContractBill(String cooBillNo, String cooContractNo) {
		return partnerInterface.insertCooContractBill(cooBillNo, cooContractNo);
	}

	@Override
	public int addEndBill(String cooBillNo, String cooContractNo) {
		return partnerInterface.insertEndBill(cooBillNo, cooContractNo);
	}

	@Override
	public List<String> getCooContractNo() {
		return partnerInterface.selectCooContractNo();
	}

	@Override
	public String getLastCooBillNo() {
		return partnerInterface.selectLastCooBillNo();
	}

	@Override
	public List<PartnerStatsDto> getDailyVisitor(HashMap<String, String> map) {
		return partnerInterface.selectDailyVisitor(map);
	}

	@Override
	public List<PartnerStatsDto> getMonthlyVisitor(String cooContractNo) {
		return partnerInterface.selectMonthlyVisitor(cooContractNo);
	}

	@Override
	public List<PartnerStatsDto> getMonthlyInflux(String cooContractNo) {
		return partnerInterface.selectMonthlyInflux(cooContractNo);
	}

	@Override
	public List<PartnerStatsDto> getWeeklyVisitor(String cooContractNo) {
		return partnerInterface.selectWeeklyVisitor(cooContractNo);
	}

	@Override
	public List<PartnerStatsDto> getWeeklyInflux(String cooContractNo) {
		return partnerInterface.selectWeeklyInflux(cooContractNo);
	}

	@Override
	public int getDuplicateCode(String cooContractCode) {
		return partnerInterface.selectDuplicateCode(cooContractCode);
	}

	@Override
	public HashMap<String, Integer> getBuyCount(String mallProNo) {
		return partnerInterface.selectBuyCount(mallProNo);
	}

	@Override
	public List<String> getMallProNo() {
		return partnerInterface.selectMallProNo();
	}

	@Override
	public List<HashMap<String, String>> getBanner() {
		return partnerInterface.selectBanner();
	}

	@Override
	public List<String> getEndCooContractList() {
		return partnerInterface.selectEndCooContractList();
	}

	@Override
	public int modifyEndCooContract(String cooContractNo) {
		return partnerInterface.updateEndCooContract(cooContractNo);
	}

	@Override
	public List<String> getStartCooContract() {
		return partnerInterface.selectStartCooContract();
	}

	@Override
	public int modifyStartCooContract(String cooContractNo) {
		return partnerInterface.updateStartCooContract(cooContractNo);
	}

	@Override
	public List<String> getOverDueList() {
		return partnerInterface.selectOverDueList();
	}

	@Override
	public int modifyOverDue(String cooContractNo) {
		return partnerInterface.updateOverDue(cooContractNo);
	}

}
