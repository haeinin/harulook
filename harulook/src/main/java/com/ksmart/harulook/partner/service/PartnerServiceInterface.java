package com.ksmart.harulook.partner.service;

import java.util.HashMap;
import java.util.List;

import com.ksmart.harulook.member.service.MemberDto;

public interface PartnerServiceInterface {
	/*제휴계약 신청처리*/
	int addCooContract(PartnerDto dto);

	/*제휴계약번호 번호 가져오기*/
	String getLastCooContractNo();

	/*제휴계약 상세보기*/
	PartnerDto getCooContractDetail(String cooContractNo);

	/*제휴계약 전체목록보기(관리자)*/
	List<PartnerDto> getCooContractList();

	/*제휴계약 목록보기(개인)*/
	List<PartnerDto> getCooContractList(String id);

	/*제휴계약 수정처리*/
	int modifyCooContract(PartnerDto dto);

	/*제휴결제예정금액 보기*/
	List<PartnerBillDto> getCooContractBill(String cooContractNo);

	/*제휴결제 처리*/
	int addCooContractPay(PartnerBillDto dto);

	/*제휴결제상태 변경처리*/
	int modifyCooContractPayStat(PartnerBillDto dto);

	/*제휴정지해제*/
	int modifyCooContractRelieve(PartnerBillDto dto);

	/*제휴결제처리 후 제휴예정데이터 삭제*/
	int removeCooContractBill(PartnerBillDto dto);

	/*제휴결제내역 보기*/
	List<PartnerPayDto> getCooContractPayList(String cooContractNo);

	/*제휴계약 승인처리*/
	int modifyCooContractAdmit(PartnerDto dto);

	/*제휴결제 폼 요청*/
	PartnerBillDto getCooContractPayForm(String cooBillNo);

	/*제휴계약업체 상세보기*/
	MemberDto getCooContractCompany(String userId);

	/*제휴계약 수수료 입력처리*/
	int addCooContractBill(String cooBillNo, String cooContractNo);

	/*제휴종료시 수수료 입력처리*/
	int addEndBill(String cooBillNo, String cooContractNo);

	/*제휴계약이름 전체불러오기*/
	List<String> getCooContractNo();

	/*제휴계약예정 번호 가져오기*/
	String getLastCooBillNo();

	/*제휴업체 일별 방문자 수 가져오기*/
	List<PartnerStatsDto> getDailyVisitor(HashMap<String, String> map);

	/*제휴업체 월별 방문자 수 가져오기*/
	List<PartnerStatsDto> getMonthlyVisitor(String cooContractNo);

	/*제휴업체 월별 유입방문자 수 가져오기*/
	List<PartnerStatsDto> getMonthlyInflux(String cooContractNo);

	/*제휴업체 주별 방문자 수 가져오기*/
	List<PartnerStatsDto> getWeeklyVisitor(String cooContractNo);

	/*제휴업체 주별 유입 방문자 수 가져오기*/
	List<PartnerStatsDto> getWeeklyInflux(String cooContractNo);

	/*제휴업체 쿠폰 번호 중복체크*/
	int getDuplicateCode(String cooContractCode);

	/*상품별 구매량 가져오기*/
	HashMap<String, Integer> getBuyCount(String mallProNo);

	/*전체 상품번호 가져오기*/
	List<String> getMallProNo();

	/*제휴승인된 배너 이미지 불러오기*/
	List<HashMap<String, String>> getBanner();

	/*기간만료된 제휴계약 조회*/
	List<String> getEndCooContractList();

	/*기간만료된 제휴계약 상태변경*/
	int modifyEndCooContract(String cooContractNo);

	/*제휴 시작할 계약 조회*/
	List<String> getStartCooContract();

	/* 제휴진행 상태로 변경*/
	int modifyStartCooContract(String cooContractNo);

	/*납부기한 지난 제휴계약 조회*/
	List<String> getOverDueList();

	/*납부기한 지난 제휴정지*/
	int modifyOverDue(String cooContractNo);

}
